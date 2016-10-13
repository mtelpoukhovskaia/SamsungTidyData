##This scripts merges the data from the Samsung Galaxy S smartphone for 30 subjects
##It subsets the data into data on the mean and standard deviations of the parameters
##It labels all activities and variable appropriately and produces a tidy data set
##Then it produces a new tiny data set with averages for each activity 
###for each of the subjects in each category

##Package ply is required for this script to run
library(plyr)

##First, the files are downloaded and uncompressed
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="final.zip")
unzip("final.zip")

##data necessary is read into R

##features has the column names for the data
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
##activity_labels have the labels for each activity (e.g. 1 is Walking)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

##there are two sets, test and train

##X has the data, y has the activity name, and subject has the numbe of the subject
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)

##all the data is merged together and columns are labeled
##first and second columns are the subject name and the activity name, which comes from
##those files

##first, the columns are merged for each dataset
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

##then, the rows of both datasets are combined
df <- rbind(test, train)

##finally, the labeling of columns
colnamesdf <- c("subjectnumber", "activityname", features[,2])
colnames(df) <- colnamesdf

##only the columns with mean() and std() functions are subset, and columns with subject
##and activity info 1 and 2

mean_cols <- grep("mean()",colnamesdf)
std_cols <- grep("std()",colnamesdf)
cols <- c(1, 2, mean_cols, std_cols)

df_mean_std <- df[,cols]

##the activity numbers are decoded into their corresponding names from the activity_labels
##table

code_for_1 <- activity_labels[1,2]
code_for_2 <- activity_labels[2,2]
code_for_3 <- activity_labels[3,2]
code_for_4 <- activity_labels[4,2]
code_for_5 <- activity_labels[5,2]
code_for_6 <- activity_labels[6,2]

df_mean_std$activityname <- sub("1",code_for_1,df_mean_std$activityname)
df_mean_std$activityname <- sub("2",code_for_2,df_mean_std$activityname)
df_mean_std$activityname <- sub("3",code_for_3,df_mean_std$activityname)
df_mean_std$activityname <- sub("4",code_for_4,df_mean_std$activityname)
df_mean_std$activityname <- sub("5",code_for_5,df_mean_std$activityname)
df_mean_std$activityname <- sub("6",code_for_6,df_mean_std$activityname)

##the column names are made easier to read by taking character - away

names(df_mean_std) <- gsub("-","",names(df_mean_std))

##tidy data set is produced after it is ordered by increasing subject number

df_mean_std <- arrange(df_mean_std,subjectnumber)

##second tidy data set is the averages of all the parameters for each subject and each activity
df_mean_std_averages <- ddply(df_mean_std, .(subjectnumber, activityname), colwise(mean))

##this data set is exported as a .txt file into the folder with data
write.table(df_mean_std_averages, 
          file = "./UCI HAR Dataset/SamsungDataAverages.txt", 
          row.names = FALSE)

