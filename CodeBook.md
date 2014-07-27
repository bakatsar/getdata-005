## CodeBook

### Input

The script working with this dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

These following files are involed:

* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt
* UCI HAR Dataset/test/subject_test.txt
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt

### Output

1. Script run_analysis.R does the following:
2. Read and merge training set and test set
3. Read and merge training label and test label
4. Read and merge subject
5. Read features names
6. Check if the features is mean or standard deviation of a measurement
7. Descriptive activity names to name the activities in the data set
8. Create tidy dataset with the average of each variable for each activity and each subject
9. Write the tidy dataset into file `tidyData.txt`