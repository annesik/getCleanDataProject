Requirements for running the run_analysis.R script

* The run_analysis.R script will only work if the required data has been downloaded and extracted.

* If the required files are not in the directory, the script will output a message that tells you to run the download_file.R script, which can also be found in the directory.

* The required data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* This file must be downloaded and unzipped. This can be done by running the download_file.R script included in this repo, or it can be done manually.

The run_analysis.R script checks whether the working directory has the required files. The required files are the following:

UCI HAR Dataset/activity_labels.txt
UCI HAR Dataset/features.txt
UCI HAR Dataset/test/X_test.txt
UCI HAR Dataset/test/subject_test.txt
UCI HAR Dataset/test/y_test.txt
UCI HAR Dataset/train/X_train.txt
UCI HAR Dataset/train/subject_train.txt
UCI HAR Dataset/train/y_train.txt



xxx


The script writes a tidy table to "tidy_data.txt" into the working directory.
The first line of the resulting .txt-file gives the column names.