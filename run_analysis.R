library(plyr)

### Step 0 Prep work ###
# Download file
#download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", method="curl", destfile="./TidyData/har.zip")

# Get a list of test and training files to be merged
#test <- list.files("./TidyData/UCI HAR Dataset/test/Inertial Signals", full.names = TRUE)
#train <- list.files("./TidyData/UCI HAR Dataset/train/Inertial Signals", full.names = TRUE)

### Step 1 ###

# Read in test and training files
x_train <- read.table("./TidyData/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./TidyData/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./TidyData/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./TidyData/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./TidyData/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./TidyData/UCI HAR Dataset/test/subject_test.txt")

# Combine all data into a single dataset
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

### Step 2 ###
# Read in all measurements
features <- read.table("./TidyData/UCI HAR Dataset/features.txt", header = FALSE, sep = " ", col.names = c("featureId", "featureName"))
# Extract only mean and std deviation measurements
wanted_features <- grep("-(mean|std)\\(\\)", features[,2])
x_data <- x_data[, wanted_features]
# Add column names
names(x_data) <- features[wanted_features, 2]


### Step 3 ###
# Name the activities in the data set
activities <- read.table("./TidyData/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = " ", col.names = c("activityId", "activityName"))
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


### Step 4 ###
# Label the data with descriptive names
names(subject_data) <- "subject"

all_data <- cbind(x_data, y_data, subject_data)

### Step 5 ##
# Export a tidy dataset

tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "./TidyData/tidy_data.txt", row.name=FALSE)
                       
                       
                       
                       