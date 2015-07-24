##Code book for the tidy_data dataset.

The tidy_data.txt is a text file containing the tidy data set resulting from running the run_analysis.R script.

Remark that the first line of the text file contains the column (variable) names.

###Source of the data
The data originate from the UCI Machine Learning Repository, which can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

General description and data set information can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data have been gathered through an experiment where a group of 30 volounteers were wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

More info about the experiment can be found in the README.txt file included in the zipped directory linked to above.

The signal data collected were processed to provide a number of measurements of signals. The signals were again used to estimate variables of the feature vector for each pattern, such as the mean, standard deviation, max, min etc. (for each signal and each axis). A thorough explanation can be found in the features_info.txt in the zipped directory linked to above. 

##The tidy dataset
The tidy_dataset.txt contains one row for each activity and each subject performing the experiment. In the source data, the subjects are randomly partition into one data set generating the training data, and one data set generating the test data. In the tidy_dataset.txt file, these two datasets are combined.

The variables included in the data set are:

* `act_name` - the name of the activity

      - walking
      - walking upstairs
      - walking downstairs
      - sitting
      - standing
      - laying
      
* `subject` - the identifier of the subject

      There are 30 subjects in the experiment, numbered 1 to 30.
      
* `<signal>-mean()`
      The average of the given <signal> for the given activity and subject  
      
* `<signal>-std()`
      The standard deviation of th egiven <signal> for the given activity and subject
      
`<signal>` refers to the different signals as explained in features_info.txt referenced above.
The signals are:

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

where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.