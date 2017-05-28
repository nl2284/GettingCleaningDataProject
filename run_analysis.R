###General Notes:
###this script get the"Human Activity Recognition Using Smartphones Dataset" 
####and clean the data for downstream analysis
### More specificially, it does these following things:
####1. Merges the training and the test sets to create one data set.
####2. Extracts only the measurements on the mean and standard deviation for each measurement.
####3. Uses descriptive activity names to name the activities in the data set
####4. Appropriately labels the data set with descriptive variable names.
####5. Creates a second, independent tidy data set with the average of each variable 
#####for each activity and each subject.

####For clarity, it breaks up the task into nine steps with substeps.



###Step 1: download the data zip file and unzip the data
  ###1.1
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./rundata")) dir.create("./rundata")
download.file(url, destfile="./rundata/dataset.zip", method="curl")
 ### 1.2unzip the data files
unzip(zipfile="./rundata/dataset.zip", exdir="./rundata")

###Step 2: read the training data files and test data files
###2.1 read the training set
x_train<-read.table("./rundata/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./rundata/UCI HAR Dataset/train/Y_train.txt")
subject_train<-read.table("./rundata/UCI HAR Dataset/train/subject_train.txt")
###2.2. read the test data files
x_test<-read.table("./rundata/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./rundata/UCI HAR Dataset/test/Y_test.txt")
subject_test<-read.table("./rundata/UCI HAR Dataset/test/subject_test.txt")

###Step 3:read column names from the features file, and assign colnames to x_test and x_train.
###3.1
colunmnames<-read.table("./rundata/UCI HAR Dataset/features.txt")
###3.2 assign colnames to x_test
colnames(x_test)<-colunmnames[,2]
###3.3 assign colnames to y_test
colnames(x_train)<-colunmnames[,2]

###Step 4: merge x_test, y_test and subject_test, merge x_train, y_train and subject_train, 
##and then combine train set and test test
###4.1 combine the columns of the test dataset and the train dataset, add variable names to the first two columns
test<-cbind(subject_test, y_test, x_test)
train<-cbind(subject_train, y_train, x_train)
colnames(test)[1:2]<-c("subject", "activityID")
colnames(train)[1:2]<-c("subject", "activityID")
###4.2create new a variable to describe if an observation is from the training set or testing set.
test$observation_from<-"test"
train$observation_from<-"train"

##4.3. combine  train and test
train_test<-rbind(train, test)

##Step 5: find all the measurements on the mean and standard deviation,
##plus the subject column, and activityID, and then create a new dataset that contains only these columns.
mean_std<-grepl("subject|activity|mean|std|observation", names(train_test))
train_test_set<-train_test[, mean_std]


###Step 6: use descriptive activity to name the activities in the data set
####6.1. read in activity_labels.txt, and merge the two files by activityID
activity_labels<-read.table("./rundata/UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels)<-c("activityID", "activityType")
train_test_set<-merge(train_test_set, activity_labels, by="activityID", all.x=TRUE)

##6.2. remove the activityID column from the dataset, move the observation_from variable
library(dplyr)
train_test_set<-data.frame(subject=train_test_set[,2], activityType=train_test_set[, 83], 
                            observationFrom=train_test_set[, 82], train_test_set[, 3:81])

###Step 7: Appropriately labels the data set with descriptive variable names.

####7.1 get all variables names of the dataset, edit the variable names with gsub
ns<-colnames(train_test_set)
ns<-gsub("^t", "time", ns)
ns<-gsub("^f", "fastForier", ns)
ns<-gsub("Acc", "Accelerometer", ns)
ns<-gsub("Gyro", "Gyroscope", ns)
ns<-gsub("mean", "Mean", ns)
ns<-gsub("Mag", "Magnitute", ns)
ns<-gsub("Freq", "Frequency", ns)
ns<-gsub("std", "Std", ns)
ns<-gsub("-", "", ns)
ns<-gsub("\\(\\)", "", ns)
ns<-gsub("\\.", "", ns)


###7.2 assign the new variable names to the dataset
colnames(train_test_set)<-ns


###Step 8:creates a second, independent tidy data set with the average of each variable
###for each activity and each subject.

tidy_set<-train_test_set %>%
  group_by(observationFrom, subject, activityType) %>%
  summarize_each(funs(mean)) 

###Step 9: Write the tidy dataset to txt file
write.table(tidy_set, "tidy_set.txt", row.names=FALSE)
