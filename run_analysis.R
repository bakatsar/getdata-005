# set your path to the unzip UCI HAR Dataset folder
path = "./"

# 1. Merges the training and the test sets to create one data set
# read and merge training set and test set
testTmp <- read.table(paste(path, "test/X_test.txt", sep=""), header=FALSE, sep="")
trainTmp <- read.table(paste(path,"train/X_train.txt", sep=""), header=FALSE, sep="")
data <- rbind(testTmp, trainTmp)

# read and merge training label and test label
testTmp <- read.table(paste(path, "test/y_test.txt", sep=""), header=FALSE, sep="")
trainTmp <- read.table(paste(path,"train/y_train.txt", sep=""), header=FALSE, sep="")
label <- rbind(testTmp, trainTmp)

# read and merge subject
testTmp <- read.table(paste(path, "test/subject_test.txt", sep=""), header=FALSE, sep="")
trainTmp <- read.table(paste(path,"train/subject_train.txt", sep=""), header=FALSE, sep="")
subject <- rbind(testTmp, trainTmp)

# remove tmp object
rm(testTmp)
rm(trainTmp)

# 4. Appropriately labels the data set with descriptive variable names
# read features names
feature <- read.table(paste(path, "features.txt", sep=""), header=FALSE, sep="")
feature <- as.character(feature$V2)
names(data) <- feature

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# function to check if the features is mean or standard deviation of a measurement
check <- function (x) {if(length(grep("mean",x))>0 | length(grep("std",x))>0) TRUE else FALSE}
keepFeature <- sapply(feature, check)
extracted <- data[, keepFeature]

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table(paste(path, "activity_labels.txt", sep=""), header=FALSE, sep="")
label$V1 <-as.factor(label$V1)
levels(label$V1) <- activity$V2

# remove tmp object
rm(feature)
rm(keepFeature)
rm(activity)
rm(data)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
group <- list(label$V1, subject$V1)
tidy <- aggregate(extracted, by=group, FUN=mean)
names(tidy) <- c("Activity", "Subject", names(extracted))

# write tidy data set to file
write.csv(tidy, file=paste(path, "tidyData.txt", sep=""))

# remove tmp object
rm(list=ls())