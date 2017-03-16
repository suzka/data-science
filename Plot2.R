### Plotting Assignment 1 ###
library("data.table")
library("dplyr")
library(tidyr)

# Download a file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", method="curl", destfile="data/hpc.zip")

# Read CSV file
power <- read.csv("data/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE) # read in file
unite(power, "DateTime", Date, Time, sep = " ", remove = TRUE)


power$Date <- as.Date(power$Date, format ="%d/%m/%Y") # convert to date format
#power$Time <- strptime(power$Time, format = "%H:%M:%S")
twodays <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02") # filter for 2 days in February

twodays[, 3] <- as.numeric(twodays[,3]) # convert to numeric so can chart

## Plot 1
#hist(twodays$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#dev.copy(png, file = "plot1.png") # copy to png file
#dev.off()

## Plot 2
plot(twodays$Global_active_power, type="l", xaxt="n", xlab ="", ylab="Global Active Power")
axis(side = "1", at = c(0, 1470, 2880), labels = c("Thur", "Fri", "Sat"))

dev.copy(png, file = "plot2.png", width = 480, height = 480) # copy to png file
dev.off()
