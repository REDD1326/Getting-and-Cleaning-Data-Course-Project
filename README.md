---
title: "README"
author: "REDD"
date: "26 de junio de 2016"
output: word_document
---
##Project of Getting and Cleaning Data course on Coursera.
###Project Description
The project consist in demonstrate the ability to collect, work with, and clean a data set. 
###Project Goal
The goal of this project is to prepare tidy data that can be used for later analysis.
##Original Data 
The data used for the course project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##Course project's definition
You should create one R script called run_analysis.R that does the following.
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data Subsets created
The Data Subset created includes the following files:
-"README.md" 
-"CodeBook.md": describes the experiment, original data and the steps to get the new Data Subsets.
-"run_analysis.R": script with the 5 steps described in the course project's definition and the analysis carried out to obtain Data Subsets. 
-The analysis in R has two outputs, the first Data Subset is called DATAF, and the second is called NEWDATA.
*DATAF subset contains a subset with the mean value (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std") for each measurement.
*NEWDATA subset contains the average of each variable in data subset for each activity and each subject.
