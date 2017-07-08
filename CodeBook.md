### Code Book
This file indicates all the variables and summaries calculated when using run_analysis.R

## Identifiers

Variable Name		Description					Value
subject			These are the IDs of the test subjects		1:30

activity		These are the activities that the subjects	WALKING
			were performing during data collection		WALKING_UPSTAIRS
									WALKING_DOWNSTAIRS
									SITTING
									STANDING
									LAYING

## Measurments

Variable Name		Description					Value
tBodyAcc-XYZ		All measurements were collected from a		mean
tGravityAcc-XYZ		gyroscope and accelerometer, broken down by	standard deviation
tBodyAccJerk-XYZ	3-axial raw signals (Acc-XYZ and Gyro-XYZ).
tBodyGyro-XYZ		The 't' denotes the time domain signals and
tBodyGyroJerk-XYZ	the 'f' denotes those signals that were run
tBodyAccMag		through a Fast Fourier Transform (FFT).
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Output

Variable Name		Description					Value
data.mean		Data.frame that contains the mean value		NA
			for every variable pulled from the original
			data set. It is then written to "tidy.txt".