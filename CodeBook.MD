

The tidy_set were a new dataset created by summarising data for each activity of each subject in the original dataset. Below is some information of the original dataset:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

the original dataset cane downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================


Major things done to create the tidy_set dataset:
1. combine the following data from the original dataset: X_train.txt, Y_train.txt, subject_train.txt, X_test.txt, Y_test.txt, subject_test.txt, and create one single dataset that combining all observations from the training set and the test set. 
2. read the feature names from “features.txt” (from the original dataset)and assign the features as variable names. 
3. select only the measurements on the mean and standard deviation. 
4. read “activity_labels.txt” (from the original dataset) and use descriptive activity to name the activities in the dataset. 
5. label the dataset with descriptive variable names. 
6. created a new dataset creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

