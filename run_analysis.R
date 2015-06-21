#
# Course Project Exercise for Coursera Getting and Cleaning Data
#
# Author: Francesc Tarrés
#
#
# Observations: The original data files to work with have been downloaded and 
# unzipped in the directory ./UCI HAR Dataset. The data manipulation in this
# file supposses that working directory and that the names and structure of 
# files is as in the original set

# FIRSTS STEPS

# Reading the list of features and activities

features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Reading Training Data from the original Files

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")

# Arranging the train data in a tidy training dataset

train <- cbind(subject_train, y_train, x_train)

# Reading Test Data from the original files

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")

# Arranging the test data in a tidy test dataset

test <- cbind(subject_test, y_test, x_test)

##################################
# PROJECT PART 1
##################################

# Merging train and test tidy datasets in a UCI_HAR_tidy dataset

UCI_HAR_tidy <- rbind(train, test)

##################################
# PROJECT PART 4 (Label data set with descriptive names)
##################################

# Naming the columns of the final UCI_HAR_tidy dataset. Contains all the information in the dataset

colnames(UCI_HAR_tidy) <- c("identity", "activity", as.vector(features$V2))

##################################
# PROJECT PART 2
##################################

# Selecting the subset containing means and std

UCI_HAR_meanstd <- UCI_HAR_tidy[, c(1, 2, grep("mean", colnames(UCI_HAR_tidy)), 
                                    grep("std", colnames(UCI_HAR_tidy)))]

##################################
# PROJECT PART 3
##################################

# Uses descriptive activity names to name the activities in the dataset

UCI_HAR_meanstd$activity <- factor( UCI_HAR_meanstd$activity,
                                    levels = activities$V1,
                                    labels = activities$V2)

##################################
# PROJECT PART 5
##################################

# From the data in the previous step, create another dataset with the average
# of each variable for each activity and each subject

# Usin dplyr. The package should be installed using
# install.packages("dplyr")

library(dplyr)

FinalTidyData <- UCI_HAR_meanstd %>% group_by(identity, activity) %>% summarise_each(funs(mean))

# Writing the results in the working directory in TXT format

write.table(FinalTidyData, file = "Final_Tidy_Data.txt", eol ="\r\n", row.name = FALSE)