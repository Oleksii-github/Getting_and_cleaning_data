---
title: "CodeBook"
author: "Oleksii Barash"
date: "4/21/2020"
output: html_document
---


**This is a code book that describes the variables, the data, and all transformations or work that was performed to clean up the data for the "Getting and Cleaning Data" Course Project.**

### **1. Experiment design**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### **2. Train and test files description:**

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the activity ID with their activity name.

- 'X_train.txt'  - Training set.

- 'y_train.txt' - Training labels.

- 'X_test.txt' - Test set.

- 'y_test.txt' - Test labels.
- 'subject_train.txt' - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'subject_test.txt' - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### **3. Transformations that was performed to clean up the data:**

1. All files were loaded using `read.table` function. Appropriate names corresponding to each file were assigned: `test`, `train`, `types_of_movements`, `test_participants`, `test_movement`, `tr_participants`, `tr_movement`, `columns`. Column names `columns` were conferted from factor to character variable via `as.character`.


 2. Test and train datasets were connected via `rbind`. Also Particiapnt ID and movement ID added to  dataset.


3. Columns with the measurements on the mean and standard deviation for each measurement were extracted from the dataset by using `grep` function: `grep("*mean*|*std*", columns[,2])`. For readability "mean" and "std" in columns' names were transformed into "-mean-" and "-std-"

4. New `test` and `train` data frames were created by selecting the columns that contain only "mean" or "std" words in their names.

5. `movement` and `subject` columns were transformed to `factor`

6. `melt` function was used to melt data frames into the tidy data where if observation is a row and each featue is a column.

7. `dcast` was used to create the final data set  with the average of each variable for each activity and each subject.


