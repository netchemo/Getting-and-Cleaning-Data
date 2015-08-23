# Getting and Cleaning Data Course Project
# Chris Nannini
# 23AUG15

# The comments below describe the steps required prior to running this
# script and brief descriptions of each line/section, where necessary.

# Download Required Data Files into your Working Directory

# Data set:
# https://d396qusza40orc.cloudfront.net/
#   getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# I downloaded the files manually from the url provided for the project 
# (listed above).  Next, I used winzip to unzip the files into a folder.  

# Consolidate Data Files into Working Directory .\data\project

# subject_test.txt
# subject_train.txt
# X_test.txt
# X_train.txt
# y_test.txt
# y_train.txt
# features.txt
# activity_labels.txt

# Load Required Library Packages

library(data.table)
library(dplyr)
library(tidyr)

# Part 1. Merges the training and the test sets to create one data set.

# Create Data Tables 

subject_test <- read.table("./data/project/subject_test.txt")
subject_train <- read.table("./data/project/subject_train.txt")
x_test <- read.table("./data/project/X_test.txt")
x_train <- read.table("./data/project/X_train.txt")
y_test <- read.table("./data/project/y_test.txt")
y_train <- read.table("./data/project/y_train.txt")
features <- read.table("./data/project/features.txt", colClasses 
                       = c("character"))
labels <- read.table("./data/project/activity_labels.txt")

# Merge the Training and the Test Sets to Create One Data Set (complete_merge)

train_merge <- cbind(subject_train, x_train, y_train)
test_merge <- cbind(subject_test, x_test, y_test)
complete_merge <- rbind(train_merge, test_merge)

# Part 2. Extracts only the measurements on the mean and standard 
# deviation for each measurement.

# Looking at the features.txt file, we see that the data collected 
# in the x_train and x_test files had 561 columns of measurements.  
# Not all of these measurements consisted of the mean and standard 
# deviation (e.g., some measurements consisted of max, min, 
# skewness, etc.).  The following code extracts only the columns that 
# consist of a mean or standard deviation for the measurement. 
# It also retains, the “subject” and “activity” columns.

# Create a listing (character vector) of raw column labels: subject gets listed
# first, followed by the measurement names, and activity is listed last.
column_labels <- rbind(rbind(c(1, "subject"),features),c(563, "activity"))[,2]

# Change the names of the combined data set (complete_merge) to match the
# raw column labels; these will be cleaned-up later.
names(complete_merge) <- column_labels

# Basic cleaning to match only "mean" and "std" from features, and 
# retain the "subject" and "activity" column headers; creates a logical
# vector indicating whether each column heading of complete_merge contained
# the pattern of desired terms in column name; (TRUE if the four headings
# exist; FALSE otherwise)
features_value <- grepl("mean|std|subject|activity", names(complete_merge))

# Create a new data table with the desired columns.
extract_merge <- complete_merge[, features_value]

# Part 3. Uses descriptive activity names to name the activities.

# The “activities” column at the end of the data table displays a numeric
# code for the activities performed by the subjects (rows).  This part 
# requires that we change the the numeric values (i.e., 1-6) to the actual
# activity names shown in the activity_labels.txt.

# Create a dplyr data table so that we can take advantage of dplyr
extract_merge_tbl <- tbl_df(extract_merge)

# Modify the numeric activity values to actual activity names.
activity_merge <- mutate(extract_merge, activity = 
                        replace(activity, activity == 1, "walking"), 
                        activity = replace(activity, activity == 2, 
                        "walking upstairs"), activity = 
                        replace(activity, activity == 3, 
                        "walking downstairs"), activity = 
                        replace(activity, activity == 4, "sitting"), 
                        activity = replace(activity, activity == 5, 
                        "standing"), activity = 
                        replace(activity, activity == 6, "laying"))

# Part 4. Appropriately labels the data set with descriptive names.

# Reorder the data so that subject and activity are in the first two
# columns. This will make it easier to read with the subjects listed 
# first, followed by their activities, then the mean and std devs.

# Places the subjects in the first column, the activities (was last; 81) 
# in the second column, and the 2-80 columns shift right. 
activity_merge <- select(activity_merge, subject, activity, 2:80)

# At this point, the columns representing the mean and standard 
# deviation measurements do not have descriptive variable names.  
# The code below changes the column names using the names provided 
# in features.txt.

# Clean-up the label appearance from the features.txt file. gsub is used
# to replace each occurrence of the pattern (first string) with second string.
names(activity_merge) <- gsub("[()]", "", names(activity_merge))
names(activity_merge) <- gsub("-std", " Std", names(activity_merge))
names(activity_merge) <- gsub("-mean", " Mean", names(activity_merge))
names(activity_merge) <- gsub("[-]", " ", names(activity_merge))
names(activity_merge) <- gsub("Acc", " Acceleration", names(activity_merge))
names(activity_merge) <- gsub("Mag", " Magnitude", names(activity_merge))
names(activity_merge) <- gsub("Freq", " Frequency", names(activity_merge))

# Part 5. From the data set in Part 4, creates a second, independent 
# tidy data set with the average of each variable for each activity and
# each subject. I took this to mean group by subject, then by activity. 

# Group by subject and activity; each subject gets group, with 
# sub-groupings for the activities that they performed.
by_subject_and_activity <- group_by(activity_merge, subject, activity)

# Use dplyr function <summarise_each> to take the mean of each 
# column (measurement variable) by subject, by activity.
summarise_mean_output <- summarise_each(by_subject_and_activity, funs(mean))

# Write the final tidy data file (summarise_mean_output) to 
# the working directory.  File name = tidyDataSet.txt.
write.table(summarise_mean_output, "tidyDataSet.txt", row.name=FALSE)