setwd("C:/Users/oleks/Desktop/Programming/Hopkins_University_2020_Coursera/Third_course_Getting_and_cleaning_data/Course_project/Getting_and_cleaning_data")


library(reshape2)
library(dplyr)


# 1. Load data sets and join TEST and TRAIN ------------------------------------------

test <- read.table("UCI HAR Dataset/test/X_test.txt") # data.frame: 2947 x 561 with weird column names
test_movement <- read.table("UCI HAR Dataset/test/Y_test.txt") # column with labels for movements in test 
test_participants <- read.table("UCI HAR Dataset/test/subject_test.txt") # column with labels for test participants ID
test <- cbind(test_participants, test_movement, test) # Particiapnt ID and movement ID added to main test dataset
tr_movement <- read.table("UCI HAR Dataset/train/Y_train.txt")# column with labels for movements in train
tr_participants <- read.table("UCI HAR Dataset/train/subject_train.txt")# column with labels for train participants ID

train <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(tr_participants, tr_movement, train)# Particiapnt ID and movement ID added to main train dataset

# connect two datasets
all_together <- rbind(train, test)



# 2. Getting the column names and selecting the MEAN and STD columns ---------


# Getting the labels for the columns

types_of_movements <- read.table("UCI HAR Dataset/activity_labels.txt")
types_of_movements[,2] <- as.character(types_of_movements[ , 2])
columns <- read.table("UCI HAR Dataset/features.txt")
columns[,2] <- as.character(columns[,2])


# As per assingment now we will extract only the data on mean and standard deviation

mean_or_std_columns <- grep("*mean*|*std*", columns[,2])
col_names <- columns[mean_or_std_columns,2]

col_names <- gsub('[-()]', '', col_names)
col_names <- gsub('mean', '-mean-', col_names)
col_names <- gsub('std', '-std-', col_names)
colnames(all_together) <- c("subject", "movement", col_names)

# Getting only columns with MEAN or STD in the label
test <- read.table("UCI HAR Dataset/test/X_test.txt")[mean_or_std_columns]
train <- read.table("UCI HAR Dataset/train/X_train.txt")[mean_or_std_columns]




# 3. Meltin data set and writing the final result ----------------------------

all_together$movement <- factor(all_together$movement, levels = types_of_movements[, 1], labels = types_of_movements[, 2])
all_together$subject <- as.factor(all_together$subject)

melted_for_all <- melt(all_together, id = c("subject", "movement"))
mean_for_all <- dcast(melted_for_all, subject + movement ~ variable, mean)
write.table(melted_for_all, "tidy.txt", row.names = FALSE, quote = FALSE)
write.table(mean_for_all, "tidy_averages.txt", row.names = FALSE, quote = FALSE)
