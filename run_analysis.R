#Checking that relevant libraries are installed, install and require them if not

a<-installed.packages()
packages<-a[,1] 
if(!(is.element("plyr", packages))){
      install.packages("plyr")
}

library(plyr)

#Check that the required data is in the working directory

##First, make the list of all files required
requiredFiles<-c(
      "UCI HAR Dataset/activity_labels.txt",
      "UCI HAR Dataset/features.txt",
      "UCI HAR Dataset/test/X_test.txt",
      "UCI HAR Dataset/test/subject_test.txt",
      "UCI HAR Dataset/test/y_test.txt",
      "UCI HAR Dataset/train/X_train.txt",
      "UCI HAR Dataset/train/subject_train.txt",
      "UCI HAR Dataset/train/y_train.txt"
      
)


##Then, check whether these files all exist. If one or more is missing,
#the script stops executing and gives an error message referring to the
#download_file.R script and the README.md file for further explanation.
DT<-as.data.table(requiredFiles)
DT[,notExists:=!(file.exists(DT$requiredFiles))]
if(sum(DT$notExists)>0){
      stop("One or more files are missing. You should run the download_file.R script. Please read the README.md file")
}

#Deleting the temporary files needed only for checking whether the files are there
rm(requiredFiles)
rm(DT)

#STEP 1:

#Read in all the data files

# 1: TRAIN data:
TR_x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
TR_y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
TR_subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

# 2: TEST data:
TE_x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
TE_y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
TE_subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

#3: Labels and features:
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels)<-c("act_label","act_name")
features<-read.table("UCI HAR Dataset/features.txt")

#Name the columns in the datasets (STEP 4 in the assignment):
colnames(TE_subject_test)[1]<-"subject"
colnames(TE_y_test)[1]<-"act_label"
colnames(TE_x_test)<-features[,2]

colnames(TR_subject_train)[1]<-"subject"
colnames(TR_y_train)[1]<-"act_label"
colnames(TR_x_train)<-features[,2]


#Put together the tables for subject, activity labels and the data itself for train and test data:
TEST<-cbind(TE_subject_test,TE_y_test,TE_x_test)
TRAIN<-cbind(TR_subject_train,TR_x_train,TR_y_train)

#Put the test and train datasets together:
FULL<-rbind(TEST,TRAIN)

#STEP 2:

#Find the columns containing means and standard deviations:
#First, create the logical vector of columns whose name contains "mean()" or "std()"
meanCols<-grepl("mean()",colnames(FULL),fixed=TRUE)
stdCols<-grepl("std()",colnames(FULL),fixed=TRUE)
relevantCols<-meanCols | stdCols

#Picks out the columns we want to keep: Subject identifier, activity label 
#and the means and standard devaitions
TestAndTrain<-cbind(FULL[,1:2], FULL[,relevantCols])


#STEP 3:

#Add the descriptive activity names:
DATASET<-merge(activity_labels, TestAndTrain, by="act_label")

#Drop the activity label, redundant since we have the name
DATASET$act_label<-NULL

#STEP 5:
      
#Calculate the average of each variable, for each activity and subject
DF<-ddply(DATASET, c("act_name","subject"),function(x) colMeans(x[3:68]))

write.table(DF,file="tidy_data.txt",row.names = FALSE)
#write.csv(DF,file="tidy_data.csv",row.names = FALSE)
