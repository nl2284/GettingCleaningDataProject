CodeBook

The tidy_set were a new dataset created by summarising data for each activity of each subject in the original dataset. Below is some information of the original dataset:Human Activity Recognition Using Smartphones Dataset Version 1.0

Some information of the original dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

the original dataset can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================


Major things done to create the tidy_set dataset:
1. combine the following data from the original dataset: X_train.txt, Y_train.txt, subject_train.txt, X_test.txt, Y_test.txt, subject_test.txt, and create one single dataset that combining all observations from the training set and the test set. 
2. read the feature names from “features.txt” (from the original dataset)and assign the features as variable names. 
3. select only the measurements on the mean and standard deviation. 
4. read “activity_labels.txt” (from the original dataset) and use descriptive activity to name the activities in the dataset. 
5. label the dataset with descriptive variable names. 
6. created a new dataset creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

In the dataset “tidy_set”, for each record it is provided:
======================================
- Which set the observation comes from, training set or test set
- An identifier of the subject who carried out the experiment.
- The activity type
- Average of the mean and standard deviation measurements for each activity and each subject.

Variables in "tidy_set"
======================================
"observationFrom”: identifies which set the observation comes from
	
	class: factor, levels: 2 
	level 1: train-the observation comes from the train set
	level 2: test—the observation comes from the test set
	
"subject”-An identifier of the subject who carried out the experiment.
	
	class: integer
	
"activityType”-An identifier of the activity performed.
	
	class: factor, levels: 6
        level 1: WALKING
        level 2: WALKING_UPSTAIRS
        level 3: WALKING_DOWNSTAIRS
        level 4: SITTING
        level 5: STANDING
        level 6: LAYING
	
"timeBodyAccelerometerMeanX" "numeric"
"timeBodyAccelerometerMeanY" "numeric"
"timeBodyAccelerometerMeanZ" "numeric"
"timeBodyAccelerometerStdX" "numeric"
"timeBodyAccelerometerStdY" "numeric"
"timeBodyAccelerometerStdZ" "numeric"
"timeGravityAccelerometerMeanX" "numeric"
"timeGravityAccelerometerMeanY" "numeric"
"timeGravityAccelerometerMeanZ" "numeric"
"timeGravityAccelerometerStdX" "numeric"
"timeGravityAccelerometerStdY" "numeric"
"timeGravityAccelerometerStdZ" "numeric"
"timeBodyAccelerometerJerkMeanX" "numeric"
"timeBodyAccelerometerJerkMeanY" "numeric"
"timeBodyAccelerometerJerkMeanZ" "numeric"
"timeBodyAccelerometerJerkStdX" "numeric"
"timeBodyAccelerometerJerkStdY" "numeric"
"timeBodyAccelerometerJerkStdZ" "numeric"
"timeBodyGyroscopeMeanX" "numeric"
"timeBodyGyroscopeMeanY" "numeric"
"timeBodyGyroscopeMeanZ" "numeric"
"timeBodyGyroscopeStdX" "numeric"
"timeBodyGyroscopeStdY" "numeric"
"timeBodyGyroscopeStdZ" "numeric"
"timeBodyGyroscopeJerkMeanX" "numeric"
"timeBodyGyroscopeJerkMeanY" "numeric"
"timeBodyGyroscopeJerkMeanZ" "numeric"
"timeBodyGyroscopeJerkStdX" "numeric"
"timeBodyGyroscopeJerkStdY" "numeric"
"timeBodyGyroscopeJerkStdZ" "numeric"
"timeBodyAccelerometerMagnituteMean" "numeric"
"timeBodyAccelerometerMagnituteStd" "numeric"
"timeGravityAccelerometerMagnituteMean" "numeric"
"timeGravityAccelerometerMagnituteStd" "numeric"
"timeBodyAccelerometerJerkMagnituteMean" "numeric"
"timeBodyAccelerometerJerkMagnituteStd" "numeric"
"timeBodyGyroscopeMagnituteMean" "numeric"
"timeBodyGyroscopeMagnituteStd" "numeric"
"timeBodyGyroscopeJerkMagnituteMean" "numeric"
"timeBodyGyroscopeJerkMagnituteStd" "numeric"
"fastForierBodyAccelerometerMeanX" "numeric"
"fastForierBodyAccelerometerMeanY" "numeric"
"fastForierBodyAccelerometerMeanZ" "numeric"
"fastForierBodyAccelerometerStdX" "numeric"
"fastForierBodyAccelerometerStdY" "numeric"
"fastForierBodyAccelerometerStdZ" "numeric"
"fastForierBodyAccelerometerMeanFrequencyX" "numeric"
"fastForierBodyAccelerometerMeanFrequencyY" "numeric"
"fastForierBodyAccelerometerMeanFrequencyZ" "numeric"
"fastForierBodyAccelerometerJerkMeanX" "numeric"
"fastForierBodyAccelerometerJerkMeanY" "numeric"
"fastForierBodyAccelerometerJerkMeanZ" "numeric"
"fastForierBodyAccelerometerJerkStdX" "numeric"
"fastForierBodyAccelerometerJerkStdY" "numeric"
"fastForierBodyAccelerometerJerkStdZ" "numeric"
"fastForierBodyAccelerometerJerkMeanFrequencyX" "numeric"
"fastForierBodyAccelerometerJerkMeanFrequencyY" "numeric"
"fastForierBodyAccelerometerJerkMeanFrequencyZ" "numeric"
"fastForierBodyGyroscopeMeanX" "numeric"
"fastForierBodyGyroscopeMeanY" "numeric"
"fastForierBodyGyroscopeMeanZ" "numeric"
"fastForierBodyGyroscopeStdX" "numeric"
"fastForierBodyGyroscopeStdY" "numeric"
"fastForierBodyGyroscopeStdZ" "numeric"
"fastForierBodyGyroscopeMeanFrequencyX" "numeric"
"fastForierBodyGyroscopeMeanFrequencyY" "numeric"
"fastForierBodyGyroscopeMeanFrequencyZ" "numeric"
"fastForierBodyAccelerometerMagnituteMean" "numeric"
"fastForierBodyAccelerometerMagnituteStd" "numeric"
"fastForierBodyAccelerometerMagnituteMeanFrequency" "numeric"
"fastForierBodyBodyAccelerometerJerkMagnituteMean" "numeric"
"fastForierBodyBodyAccelerometerJerkMagnituteStd" "numeric"
"fastForierBodyBodyAccelerometerJerkMagnituteMeanFrequency" "numeric"
"fastForierBodyBodyGyroscopeMagnituteMean" "numeric"
"fastForierBodyBodyGyroscopeMagnituteStd" "numeric"
"fastForierBodyBodyGyroscopeMagnituteMeanFrequency" "numeric"
"fastForierBodyBodyGyroscopeJerkMagnituteMean" "numeric"
"fastForierBodyBodyGyroscopeJerkMagnituteStd" "numeric"
"fastForierBodyBodyGyroscopeJerkMagnituteMeanFrequency" "numeric"
