---
output:
  html_document: default
  pdf_document: default
---

# **README**
## **Getting and Cleaning Data Course Project**

### *The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.*


Descripiton of the data set from Davide Anguita et al., 2013 can be found here: <https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf>


### **1. Experiment design**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


### **2. Attribute Information:**

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### **3. Train and test files description:**

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the activity ID with their activity name.

- 'X_train.txt'  - Training set.

- 'y_train.txt' - Training labels.

- 'X_test.txt' - Test set.

- 'y_test.txt' - Test labels.
- 'subject_train.txt' - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'subject_test.txt' - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
