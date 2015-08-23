# Getting-and-Cleaning-Data

## Course Project - Tidy Data

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project consisted of the following deliverables:

1. A tidy data set called *tidyDataSet.txt*.
2. A link to my Github repository with my script for performing the analysis https://github.com/netchemo/Getting-and-Cleaning-Data.
3. A code book that describes the variables, the data, and any transformations or work performed to clean up the data called *CodeBook.md*. 
4. A <README.md> file included in the repo with my scripts; this document is the *README.md* file.

## Project Description

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project is located at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

I created one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set; rather than the original numeric values.
4. Appropriately labels the data set with descriptive variable names; cleaned-up presentation of names for column headers. 
5. From the data set in step 4, creates a second, independent tidy data set with the average (mean) of each variable (mean and std) for each each subject and activity.



