## Introduction

This assignment uses data orginally from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a> for machine learning datasets. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data used for the project were downloaded from the course website here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip [61MB]

This repository contains an R script named run_analysis.R that does the following. 

1. Merges the training and the test sets into one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement from the input dataset. 

3. Creates descriptive activity names for the activities in the data set

4. Labels the data set with descriptive variable names. 

5. Produces an independent tidy data set (har_activities_summary.txt) with the mean of each variable for each activity and each subject. 


* <b>Dataset</b>:  [20Mb]

* <b>Description</b>: Measures from an embedded accelerometer and gyroscope, that captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 


The following descriptions of the 68 variables in the dataset are taken
from the description of the data available from the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ">UCI
web site</a>:

The column number, variable, the derivation of the variables are show for each variable.
- pid	Participant id range is 1:30
- activity	Name of the activity
- 1	mean.tBodyAcc.mean...X	Mean of tBodyAcc-mean()-X
- 2	mean.tBodyAcc.mean...Y	Mean of tBodyAcc-mean()-Y
- 3	mean.tBodyAcc.mean...Z	Mean of tBodyAcc-mean()-Z
- 4	mean.tBodyAcc.std...X	Mean of tBodyAcc-std()-X
- 5	mean.tBodyAcc.std...Y	Mean of tBodyAcc-std()-Y
- 6	mean.tBodyAcc.std...Z	Mean of tBodyAcc-std()-Z
- 41	mean.tGravityAcc.mean...X	Mean of tGravityAcc-mean()-X
- 42	mean.tGravityAcc.mean...Y	Mean of tGravityAcc-mean()-Y
- 43	mean.tGravityAcc.mean...Z	Mean of tGravityAcc-mean()-Z
- 44	mean.tGravityAcc.std...X	Mean of tGravityAcc-std()-X
- 45	mean.tGravityAcc.std...Y	Mean of tGravityAcc-std()-Y
- 46	mean.tGravityAcc.std...Z	Mean of tGravityAcc-std()-Z
- 81	mean.tBodyAccJerk.mean...X	Mean of tBodyAccJerk-mean()-X
- 82	mean.tBodyAccJerk.mean...Y	Mean of tBodyAccJerk-mean()-Y
- 83	mean.tBodyAccJerk.mean...Z	Mean of tBodyAccJerk-mean()-Z
- 84	mean.tBodyAccJerk.std...X	Mean of tBodyAccJerk-std()-X
- 85	mean.tBodyAccJerk.std...Y	Mean of tBodyAccJerk-std()-Y
- 86	mean.tBodyAccJerk.std...Z	Mean of tBodyAccJerk-std()-Z
- 121	mean.tBodyGyro.mean...X	Mean of tBodyGyro-mean()-X
- 122	mean.tBodyGyro.mean...Y	Mean of tBodyGyro-mean()-Y
- 123	mean.tBodyGyro.mean...Z	Mean of tBodyGyro-mean()-Z
- 124	mean.tBodyGyro.std...X	Mean of tBodyGyro-std()-X
- 125	mean.tBodyGyro.std...Y	Mean of tBodyGyro-std()-Y
- 126	mean.tBodyGyro.std...Z	Mean of tBodyGyro-std()-Z
- 161	mean.tBodyGyroJerk.mean...X	Mean of tBodyGyroJerk-mean()-X
- 162	mean.tBodyGyroJerk.mean...Y	Mean of tBodyGyroJerk-mean()-Y
- 163	mean.tBodyGyroJerk.mean...Z	Mean of tBodyGyroJerk-mean()-Z
- 164	mean.tBodyGyroJerk.std...X	Mean of tBodyGyroJerk-std()-X
- 165	mean.tBodyGyroJerk.std...Y	Mean of tBodyGyroJerk-std()-Y
- 166	mean.tBodyGyroJerk.std...Z	Mean of tBodyGyroJerk-std()-Z
- 201	mean.tBodyAccMag.mean..	Mean of tBodyAccMag-mean()
- 202	mean.tBodyAccMag.std..	Mean of tBodyAccMag-std()
- 214	mean.tGravityAccMag.mean..	Mean of tGravityAccMag-mean()
- 215	mean.tGravityAccMag.std..	Mean of tGravityAccMag-std()
- 227	mean.tBodyAccJerkMag.mean..	Mean of tBodyAccJerkMag-mean()
- 228	mean.tBodyAccJerkMag.std..	Mean of tBodyAccJerkMag-std()
- 240	mean.tBodyGyroMag.mean..	Mean of tBodyGyroMag-mean()
- 241	mean.tBodyGyroMag.std..	Mean of tBodyGyroMag-std()
- 253	mean.tBodyGyroJerkMag.mean..	Mean of tBodyGyroJerkMag-mean()
- 254	mean.tBodyGyroJerkMag.std..	Mean of tBodyGyroJerkMag-std()
- 266	mean.fBodyAcc.mean...X	Mean of fBodyAcc-mean()-X
- 267	mean.fBodyAcc.mean...Y	Mean of fBodyAcc-mean()-Y
- 268	mean.fBodyAcc.mean...Z	Mean of fBodyAcc-mean()-Z
- 269	mean.fBodyAcc.std...X	Mean of fBodyAcc-std()-X
- 270	mean.fBodyAcc.std...Y	Mean of fBodyAcc-std()-Y
- 271	mean.fBodyAcc.std...Z	Mean of fBodyAcc-std()-Z
- 345	mean.fBodyAccJerk.mean...X	Mean of fBodyAccJerk-mean()-X
- 346	mean.fBodyAccJerk.mean...Y	Mean of fBodyAccJerk-mean()-Y
- 347	mean.fBodyAccJerk.mean...Z	Mean of fBodyAccJerk-mean()-Z
- 348	mean.fBodyAccJerk.std...X	Mean of fBodyAccJerk-std()-X
- 349	mean.fBodyAccJerk.std...Y	Mean of fBodyAccJerk-std()-Y
- 350	mean.fBodyAccJerk.std...Z	Mean of fBodyAccJerk-std()-Z
- 424	mean.fBodyGyro.mean...X	Mean of fBodyGyro-mean()-X
- 425	mean.fBodyGyro.mean...Y	Mean of fBodyGyro-mean()-Y
- 426	mean.fBodyGyro.mean...Z	Mean of fBodyGyro-mean()-Z
- 427	mean.fBodyGyro.std...X	Mean of fBodyGyro-std()-X
- 428	mean.fBodyGyro.std...Y	Mean of fBodyGyro-std()-Y
- 429	mean.fBodyGyro.std...Z	Mean of fBodyGyro-std()-Z
- 503	mean.fBodyAccMag.mean..	Mean of fBodyAccMag-mean()
- 504	mean.fBodyAccMag.std..	Mean of fBodyAccMag-std()
- 516	mean.fBodyBodyAccJerkMag.mean..	Mean of fBodyBodyAccJerkMag-mean()
- 517	mean.fBodyBodyAccJerkMag.std..	Mean of fBodyBodyAccJerkMag-std()
- 529	mean.fBodyBodyGyroMag.mean..	Mean of fBodyBodyGyroMag-mean()
- 530	mean.fBodyBodyGyroMag.std..	Mean of fBodyBodyGyroMag-std()
- 542	mean.fBodyBodyGyroJerkMag.mean..	Mean of fBodyBodyGyroJerkMag-mean()
- 543	mean.fBodyBodyGy+A12:C70roJerkMag.std..	Mean of fBodyBodyGyroJerkMag-std()



