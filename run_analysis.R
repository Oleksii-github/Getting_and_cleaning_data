setwd("C:/Users/oleks/Desktop/Programming/Hopkins_University_2020_Coursera/Third_course_Getting_and_cleaning_data/Course_project/Getting_and_cleaning_data")


library(reshape2)


# Types of movements and columns names
types_of_movements <- read.table("UCI HAR Dataset/activity_labels.txt")
types_of_movements[,2] <- as.character(types_of_movements[ , 2])
columns <- read.table("UCI HAR Dataset/features.txt")
columns[,2] <- as.character(columns[,2])

# Extract only the data on mean and standard deviation
mean_or_std_columns <- grep(".*mean.*|.*std.*", columns[,2])
col_names <- columns[mean_or_std_columns,2]
col_names = gsub('-std', 'Std', col_names)
col_names <- gsub('[-()]', '', col_names)
col_names = gsub('-mean', 'Mean', col_names)


# Load train and test datasets

test <- read.table("UCI HAR Dataset/test/X_test.txt")[mean_or_std_columns]
test_movement <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_participants <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_participants, test_movement, test)
train <- read.table("UCI HAR Dataset/train/X_train.txt")[mean_or_std_columns]
tr_movement <- read.table("UCI HAR Dataset/train/Y_train.txt")
tr_participants <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(tr_participants, tr_movement, train)
# connect two datasets
all_together <- rbind(train, test)
colnames(all_together) <- c("subject", "movement", col_names)

# convert participants and movements into factors
all_together$movement <- factor(all_together$movement, levels = types_of_movements[,1], labels = types_of_movements[,2])
all_together$subject <- as.factor(all_together$subject)

melted_for_all <- melt(all_together, id = c("subject", "movement"))
mean_for_all <- dcast(melted_for_all, subject + movement ~ variable, mean)

write.table(mean_for_all, "tidy.txt", row.names = FALSE, quote = FALSE)
