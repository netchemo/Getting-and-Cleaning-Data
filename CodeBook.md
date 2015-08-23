# Code Book

This code book describes the variables, the data, and any transformations or work performed to clean up the raw data provided in the course project for Getting-and-Cleaning-Data.

## Overview

**From the UCI Website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones** 

The original data for this project originated from University of California, Irvine (UCI) Machine Learning Repository, the Center for Machine Learning and Intelligent Systems.  The data was from the Human Activity Recognition database created from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

**From the README.txt File Associated with the Data:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Data Files

### From https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data available for this project consisted of 26 txt files.  In order to create the run_analysis.R and tidyDataSet.txt files, only 8 data files were used:

1. subject_test.txt:  Each row identifies the subject who performed the activity for each window sample. 
2. subject_train.txt:  Each row identifies the subject who performed the activity for each window sample.  
3. X_test.txt:  Test set.
4. X_train.txt:  Training set.
5. y_test.txt:  Test labels.
6. y_train.txt:  Training labels.
7. features.txt:  List of all features.
8. activity_labels.txt:  Links the class labels with their activity name.

The training and test sets (files 1-6 above) were merged to create one data set.  The features.txt and activity_labels.txt files were used to create column (measurement variable) names and activity labels (for the six activities), respectively.

## Identifiers

* subject - Each row identifies the subject who performed the activity (one of six activities described above) for each window sample.  Its range is from 1 to 30.  Displayed in the tidyDataSet.txt in the first column.  180 total rows.
* activity - Each subject performed six activities (walking, walking upstairs, waking downstairs, sitting, standing, laying) wearing a Samsung Galaxy S II on the waist.  The activities were modified from uppercase (original data set) to lower case and the underscores were removed. Displayed in the tidyDataSet.txt in the second column.

## Measurement Variables 

The original data collected in the x_train and x_test files had 561 columns of measurements (acquired from the smart phone sensors).  Not all of these measurements consisted of the mean and standard deviation (e.g., some measurements consisted of max, min, skewness, etc.).  The run_analysis.R code extracted only the columns that consisted of a mean or standard deviation for the measurement.  Columns for subject and activity were also retained and moved to the first and second columns, respectively.  

The origingal columns representing the mean and standard deviation measurements did not have descriptive variable names. The run_analyis.R code modified the column names using the names provided in features.txt.  The transformations included:

* Parentheses were removed
* Hyphens were removed
* Spaces were added between some words (e.g., mean, std)
* "Acc" was changed to "Acceleration" to enhance readability
* "Mag" was changed to "Magnitude" to enhance readability
* "Freq" was changed to "Frequency" to enhance readability

Finally, a final tidy data set was geneated with the average of each measurement variable for eacy subject and each activity; measurement means (of means and standard deviations) grouped by subject and activity.

**Seventy-nine (79) measurement variables (columns 3-81) representing means (of means and std devs) were genereated by subject and activity:**

* tBody Acceleration Mean X
* tBody Acceleration Mean Y
* tBody Acceleration Mean Z
* tBody Acceleration Std X
* tBody Acceleration Std Y
* tBody Acceleration Std Z
* tGravity Acceleration Mean X
* tGravity Acceleration Mean Y
* tGravity Acceleration Mean Z
* tGravity Acceleration Std X
* tGravity Acceleration Std Y
* tGravity Acceleration Std Z
* tBody AccelerationJerk Mean X
* tBody AccelerationJerk Mean Y
* tBody AccelerationJerk Mean Z
* tBody AccelerationJerk Std X
* tBody AccelerationJerk Std Y
* tBody AccelerationJerk Std Z
* tBodyGyro Mean X
* tBodyGyro Mean Y
* tBodyGyro Mean Z
* tBodyGyro Std X
* tBodyGyro Std Y
* tBodyGyro Std Z
* tBodyGyroJerk Mean X
* tBodyGyroJerk Mean Y
* tBodyGyroJerk Mean Z
* tBodyGyroJerk Std X
* tBodyGyroJerk Std Y
* tBodyGyroJerk Std Z
* tBody Acceleration Magnitude Mean
* tBody Acceleration Magnitude Std
* tGravity Acceleration Magnitude Mean
* tGravity Acceleration Magnitude Std
* tBody AccelerationJerk Magnitude Mean
* tBody AccelerationJerk Magnitude Std
* tBodyGyro Magnitude Mean
* tBodyGyro Magnitude Std
* tBodyGyroJerk Magnitude Mean
* tBodyGyroJerk Magnitude Std
* fBody Acceleration Mean X
* fBody Acceleration Mean Y
* fBody Acceleration Mean Z
* fBody Acceleration Std X
* fBody Acceleration Std Y
* fBody Acceleration Std Z
* fBody Acceleration Mean Frequency X
* fBody Acceleration Mean Frequency Y
* fBody Acceleration Mean Frequency Z
* fBody AccelerationJerk Mean X
* fBody AccelerationJerk Mean Y
* fBody AccelerationJerk Mean Z
* fBody AccelerationJerk Std X
* fBody AccelerationJerk Std Y
* fBody AccelerationJerk Std Z
* fBody AccelerationJerk Mean Frequency X
* fBody AccelerationJerk Mean Frequency Y
* fBody AccelerationJerk Mean Frequency Z
* fBodyGyro Mean X
* fBodyGyro Mean Y
* fBodyGyro Mean Z
* fBodyGyro Std X
* fBodyGyro Std Y
* fBodyGyro Std Z
* fBodyGyro Mean Frequency X
* fBodyGyro Mean Frequency Y
* fBodyGyro Mean Frequency Z
* fBody Acceleration Magnitude Mean
* fBody Acceleration Magnitude Std
* fBody Acceleration Magnitude Mean Frequency
* fBodyBody AccelerationJerk Magnitude Mean
* fBodyBody AccelerationJerk Magnitude Std
* fBodyBody AccelerationJerk Magnitude Mean Frequency
* fBodyBodyGyro Magnitude Mean
* fBodyBodyGyro Magnitude Std
* fBodyBodyGyro Magnitude Mean Frequency
* fBodyBodyGyroJerk Magnitude Mean
* fBodyBodyGyroJerk Magnitude Std
* fBodyBodyGyroJerk Magnitude Mean Frequency

