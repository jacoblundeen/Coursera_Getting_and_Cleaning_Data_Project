#########################################################################################################################
# Getting and Cleaning Data Course Project
# 
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
# The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a
# series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described
# below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that
# describes the variables, the data, and any transformations or work that you performed to clean up the data called
# CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the
# scripts work and how they are connected.
# 
# You should create one R script called run_analysis.R that does the following:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable
#    for each activity and each subject.
#########################################################################################################################

library(plyr)
library(tidyr)
library(reshape2)
library(stringr)

# This script starts by reading in the activity labels and features files. The strings in the features file are then cleaned up using
# gsub(), getting rid of excess parenthesis. The for loop is look for any duplicate variable names and add on a number to differentiate.
activitylabels <- tbl_df(read.table("activity_labels.txt"))
features <- tbl_df(read.table("features.txt"))
names <- features$V2
names <- gsub("\\()", "", names); names <- gsub("\\(", "_", names); names <- gsub("\\)", "", names)
for(i in 1:3)
{
     for(j in 1:length(names))
     {
          if(names[j] %in% names[j+1:length(names)])
          {
               names[j] <- paste(names[j], as.character(i), sep="_")
          }
     }
}
gsub("_1_2", "_2", names) -> names

# The test data is read in and appropriate variable names are assigned. For the 'ytest' data, lapply is used to assign the correct
# activity label to each row.
xtest <- tbl_df(read.table("X_test.txt"))
colnames(xtest) <- names
ytest <- tbl_df(read.table("y_test.txt"))
ytestlabels <- tbl_df(as.data.frame(lapply(ytest, function(ytest) {activitylabels[ytest,]})))
colnames(ytestlabels) <- c("id", "activity")
testsubjects <- tbl_df(read.table("subject_test.txt"))
colnames(testsubjects) <- "subject"

# The train data is read in and appropriate variable names are assigned. For the 'ytrain' data, lapply is used to assign the correct
# activity label to each row.
xtrain <- tbl_df(read.table("X_train.txt"))
colnames(xtrain) <- names
ytrain <- tbl_df(read.table("y_train.txt"))
ytrainlabels <- tbl_df(as.data.frame(lapply(ytrain, function(ytrain) {activitylabels[ytrain,]})))
colnames(ytrainlabels) <- c("id", "activity")
trainsubjects <- tbl_df(read.table("subject_train.txt"))
colnames(trainsubjects) <- "subject"

# All x data is merged together, all y data is merged together and all subject data is merged togther.
allxdata <- tbl_df(rbind(xtest, xtrain))
allydata <- tbl_df(rbind(ytestlabels,ytrainlabels))
allsubdata <- tbl_df(rbind(testsubjects,trainsubjects))

# grep() is used to pattern match and pull out only mean and std variables from the x data.
matcheddata <- allxdata[grep("[Mm]ean\\b|[Ss]td",names(allxdata))]

# All data is is merged together.
tidydata <- tbl_df(cbind(allsubdata, allydata[,2],matcheddata))

# melt() is used to reform the data, shifting all the mean and std variables and their associated values into two columns.
data.melted <- melt(tidydata, id = c("subject","activity"))

# dcast() is then used to reform the data again, this time the data is broken down by each subject, the six activities, and the mean value
# for each feature for each activity.
data.mean <- dcast(data.melted, subject + activity ~ variable, mean)

# The mean data is then written to a text file.
write.table(data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
