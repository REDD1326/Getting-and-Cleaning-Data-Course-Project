## Coursera Getting and Cleaning Data 
## Course Project

# Desde RStudio

if(!file.exists("./Project")){dir.create("./Project")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Project/data_project.zip")
unzip("./Project/data_project.zip", exdir = "./Project")


# 1. Merge the training and the test sets to create one data set.

##Read data sets from the file
###Data Test
SubjectDataTest <- read.table("subject_test.txt",header=FALSE)
dim(SubjectDataTest) #2947,1
XDataTest <- read.table("X_test.txt",header=FALSE)
dim(XDataTest) #2947, 561
YDataTest <- read.table("y_test.txt",header=FALSE)
dim(YDataTest) #2947, 1

DataTest <- cbind(cbind(XDataTest,SubjectDataTest),YDataTest)
dim(DataTest)  #2947, 563


### Data Train
SubjectDataTrain <- read.table("..\\train\\subject_train.txt",header=FALSE)
dim(SubjectDataTrain) #7352, 1
XDataTrain <- read.table("..\\train\\X_train.txt",header=FALSE)
dim(XDataTrain) #7352, 561
YDataTrain <- read.table("..\\train\\y_train.txt",header=FALSE)
dim(YDataTrain)  #7352, 1

DataTrain <- cbind(cbind(XDataTrain,SubjectDataTrain),YDataTrain)
dim(DataTrain)  #7352, 563
head(DataTrain,2)

##Combine two data sets
DataSets <- rbind(DataTest,DataTrain)
dim(DataSets)  #10299, 563


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

##Name the columns with "features" (the name of the 561 features-columns in training and test sets)

features <- read.table("..\\features.txt",header=FALSE,sep="") #Read "features" from the file
features <- features[,2] #select colum with feature names
Features <- t(features) #Transpose-each feature in one column (561 columns)
dim(Features) #1 561

colnames(DataSets) <- Features #Columns 1-561 with "features" names
colnames(DataSets)[562:563] <- c("Subject","Activity") 
names(DataSets)

##
DATA <- DataSets[,grepl("mean|std|Subject|Activity",names(DataSets))] #select columns with mean,standard deviation, Subject and Activity columns.
names(DATA) #include "-meanFreq()" columns
DATA <- DATA[,!grepl("meanFreq",names(DATA))] #remove columns with "meanFreq" of DATA
dim(DATA) #10299, 68

# 3. Uses descriptive activity names to name the activities in the data set
##Read activity_labels from the file
act <- read.table("..\\activity_labels.txt", col.names = c("ActivityId", "Activity"))

## Update Activity values (numbers) with correct Activity names (Activity labels)
activitylabel <- act[DATA$Activity,2]

DATAF <- cbind(DATA,activitylabel) #Final Data Set with one more column (Activity labels)

# 4. Appropriately labels the data set with descriptive variable names.
names(DATAF) 

##All names in lower case
names(DATAF) <- tolower(names(DATAF))
##Remove parentheses and - 
names(DATAF) <- gsub('\\(|\\)',"",names(DATAF))
names(DATAF) <- gsub("-","",names(DATAF))
##Rename with clear names
names(DATAF) <- gsub("^t","time",names(DATAF))
names(DATAF) <- gsub("^f","frequency",names(DATAF))
names(DATAF) <- gsub("acc","accelerometer",names(DATAF))
names(DATAF) <- gsub("gyro","gyroscope",names(DATAF))
names(DATAF) <- gsub("bodybody","body",names(DATAF))
names(DATAF) <- gsub("jerk","angular",names(DATAF))
names(DATAF) <- gsub("mag","magnitude",names(DATAF))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
NewData <- DATAF %>% group_by(activitylabel,subject)%>%
          summarise_each(funs(mean(.,na.rm=TRUE)),-activity)
write.table(NewData,row.names=FALSE, "d:\\Documentos\\DATASCIENCE\\Getting and Cleaning Data\\Project\\TidyData.txt", sep="")



