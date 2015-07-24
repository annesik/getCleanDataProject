#This script downloads the data and unzips it
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileURL, temp, method = "curl")
dateDownloaded <- date()
unzip(temp)
unlink(temp)