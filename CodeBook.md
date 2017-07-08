# Code Book
This file indicates all the variables and summaries calculated when using run_analysis.R

## Identifiers

subject - These are the IDs of the test subjects (Values: 1 - 30)

activity - These are the activities that the subjects were performing during data collection
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

## Measurements

All measurements were collected from a gyroscope and accelerometer, broken down by 3-axial raw signals (Acc-XYZ and Gyro-XYZ).
The 't' denotes the time domain signals and the 'f' denotes those signals that were run through a Fast Fourier Transform (FFT).
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ	
* tBodyGyro-XYZ		
* tBodyGyroJerk-XYZ	
* tBodyAccMag		
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

## Output

data.mean - Data.frame that contains the mean value for every variable pulled from the original	data set. It is then written to "tidy.txt".
