Getting and Cleaning Data - Course project
============================================
Anne Siri K. Bekkelund<br>
github.com/annesik


##Requirements for running the run_analysis.R script

* The run_analysis.R script will only work if the required data has been downloaded and extracted.

* If the required files are not in the directory, the script will output a message that tells you to run the download_file.R script, which can also be found in the directory.

* The required data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* This file must be downloaded and unzipped. This can be done by running the download_file.R script included in this repo, or it can be done manually.

The run_analysis.R script checks whether the working directory has the required files. The required files are the following:

- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/features.txt
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/train/y_train.txt

##The steps in the script

###Step 0: Preparations

Are relevant packages installed?
The scripts starts by checking that the relevant package "plyr" is installed, and installs it if it is not installed. It also loads the package using the library() function.

Are the required data in the working directory?
As explained above, the script will only work if the required data has been downloaded and extracted. If not, the script aborts, telling the user to run the download_file.R script first.

###Step 1: Read in the data files and merge the data sets
The script goes on to read in the training data, the test data and the labels and features data into data frames.

It then assigns correct column names to the data frames. (This is step 4 in the assignment.)

Next step is to bind together the actual measurement data (from the "x_test.txt" and "x_train.txt" files) with the subject identifiers (from "subject_test.txt" and "subject_train.txt" files) and the activity labels (from "y_test.txt" and "y_train.txt" files). This results in two data frames, one for the test and one for the training data (named TEST and TRAIN in the script.)

Finally, it binds these two data frames together using rbind().

###Step 2: Extracting the measurements on mean and standard deviation
To extract only the mean and standard deviations of the measurements, I use the grepl() function to create logical vectors stating whether the column name contains either mean() or std(). I do not include the meanFreq() variables, as I consider them to be outside the scope of what we are asked to return. They would, however, be included if I did not set the parameter fixed=TRUE in the grepl function call - then it would be FALSE by default, and the logical vector would return TRUE for column names containing meanFreq() as well as mean(). 

I combine my two logical vectors, giving me one vector called "relevantCols" with all the columns containing the 66 relevant variables.

Finally, I bind the first two columns (activity name and subject identifier) together with the relevant columns as given by the logical vector "relevantCols".

I now have a data frame with test and training data, called TestAndTrain.

###Step 3: Add descriptive activity names to name the activities in the data set
I merge the TestAndTrain data frame with the activity_labels data frame, using the merge() function, and by="act_level" (i.e. the activity name is looked up in the activity_labels data frame, and added to the resulting dataset DATASET).

To have a clean and tidy data set, i also drop the activity label column from the dataset, as it is redundant.

###Step 4: Appropriately label the data set with descriptive variable names
This was done as a part of step 1, after reading in the data.

###Step 5: New data set and writing output
I use the ddply() function from the dplyr-package to calculate the average values for each activity and each subject.

The script writes a tidy table to "tidy_data.txt" into the working directory.

##The output
The output of this script is a file called "tidy_data.txt". The first line of the resulting .txt-file gives the column names.

The CodeBook.md file in this repository explains the variables in the resulting data set.