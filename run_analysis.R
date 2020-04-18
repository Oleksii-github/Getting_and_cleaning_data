setwd("C:/Users/oleks/Desktop/Programming/Hopkins_University_2020_Coursera/Third_course_Getting_and_cleaning_data/Course_project/Getting_and_cleaning_data")


library(reshape2)


# Types of movements and columns names
types_of_movements <- read.table("UCI HAR Dataset/movement_labels.txt")
types_of_movements[,2] <- as.character(types_of_movements[,2])
columns <- read.table("UCI HAR Dataset/features.txt")
columns[,2] <- as.character(columns[,2])

# Extract only the data on mean and standard deviation
mean_or_std_columns <- grep(".*mean.*|.*std.*", columns[,2])
mean_or_std_columns.names <- columns[mean_or_std_columns,2]
mean_or_std_columns.names = gsub('-mean', 'Mean', mean_or_std_columns.names)
mean_or_std_columns.names = gsub('-std', 'Std', mean_or_std_columns.names)
mean_or_std_columns.names <- gsub('[-()]', '', mean_or_std_columns.names)


# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[mean_or_std_columns]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[mean_or_std_columns]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# connect two datasets
all_together <- rbind(train, test)
colnames(all_together) <- c("subject", "movement", mean_or_std_columns.names)

# convert participants and movements into factors
all_together$movement <- factor(all_together$movement, levels = types_of_movements[,1], labels = types_of_movements[,2])
all_together$subject <- as.factor(all_together$subject)

all_together.melted <- melt(all_together, id = c("subject", "movement"))
all_together.mean <- dcast(all_together.melted, subject + movement ~ variable, mean)

write.table(all_together.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
