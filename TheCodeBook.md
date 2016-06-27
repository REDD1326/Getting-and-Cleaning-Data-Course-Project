---
title: "The Code Book"
author: "REDD"
date: "26 de junio de 2016"
output: word_document
---
##Code Book - UCI HAR Dataset

Data set correspond to a subset of data from:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
www.smarlab.ws

###Study Design
Data consist in human activity recognition using smartphones data set (description of authors):
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time (t) and frequency (f) domain.

###The measured features were:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
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

The set of variables that were estimated from these features are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.


###Obtaining Data Subset

-For this analysis I merged test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) to obtain a single Data Subset. Original Data Sets are available from UCI HAR Dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
-I create a new column in Data Subset with the features names from "features.txt" to name each variable.

-I extract only the measurements on the mean value (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") for each measurement.
-I create a new variable named activity_label from "activity_labels.txt" to improve the description of each activity.
-I modified the variable names avoiding contractions to a better understanding of each variable.

###Code Book - Description of variables names for Data Subset:
1.	time or frequency corresponds to domain signals from the accelerometer and gyroscope.
2.	x, y or z denotes 3-axial signals in x, y and z directions.
3.	body and gravity are acceleration signals.
4.	angular corresponds to Jerk signals obtained from body linear acceleration and angular velocity derived in time   
5.	magnitude corresponds to the magnitude of Jerk signals that was calculated using the Euclidean norm.
6.	mean and std corresponds to mean and standard deviation calculated for each variable.
7.	subject corresponds to 1 to 30 volunteers in the experiment was carried out.
8.	activity corresponds to the numbering of the activities performed by volunteers.
9.	activitylabel corresponds to the names of each activity.

###Obtaining independent Data Subset
-I create a new tidy data set with the average of each variable in data subset for each activity and each subject.
-I group data subset by activity name and by subject. Then I calculated the mean for each variable.
