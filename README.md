# Coursera Getting and Cleaning Data Project

This repository holds all relevant files to the end of course project. The files necessary for this project can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script, run_analysis.R, performs the following actions:

1) Load packages needed for the script to run.
2) Read in the 'activity_lables.txt" and 'features.txt' files. The 'activity_labels.txt' file contains the descriptions of the six
possible activities performed and their numeric value. The 'features.txt' files contains the variable names for the data. These variables
names are cleaned up for readibility.
3) Read in all testing and training data and merge the data sets.
4) The data is subsetted by those variables that only reflect the mean and standard deviation.
5) Creates a new data set, called data.mean, that contains the mean value for each variable, for each activity, for each subject.
6) Data.mean is then written to a file called 'tidy.txt'.

## Code Book
"Codebook.md" provides the information from the original data sets code book, plus and update on what my R script accomplished.

## Tidy Data
The file "tidy.txt" is the new data set created by the "run_analysis.R" script.
