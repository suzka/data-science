### Introduction
This is the codebook for the output of the Getting and Cleansing Project

This project contains the following files:

1. ReadMe.md which contains information about the goals where to find the data

2. This Codebook.md which contains instructions and explanations for how to run the script.

3. run_analysis.R which is the actual script

4. The output can be found in a file called tidy_data.txt

The graphic below provides a good explanation of the overall process:
![]("./project_image.png")


### Step 0: Prep work
Download the data files. After downloading the zip file, the file needs to be uncompressed and saved in the same directory as the run_analysis.R script

### Step 1: Read in test and training files
Files from both the test and training directories are read in and combined into one dataset

### Step 2: Read in all measurements
All of the features (columns) are read in and then ONLY the mean and std deviation measurements (columns) are kept

### Step 3: Name the activities in the data set
Extract the names of all of the activities in the dataset

### Step 4: Labelling
Label the data with descriptive names

### Step 5: Export
Export a tidy dataset of averages for each column

