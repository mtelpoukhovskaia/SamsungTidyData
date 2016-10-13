#Code book

##A. Variable names and explanations

###In the data set, there are 30 subjects who do one of 6 activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying.  The individual data from the phone is processsed to include various parameters that are described in the features_info file in the data set.  It is quoted here:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean""

###The activity codes were taken from activity_labels file in the data set, and are quoted here:

"1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING"

##B. Processing of the data

###The data is divided into two parts: some subjects were in training group and some in test group.  Within each group, the data is divided into three files.  In one file (subject_numbers), the subject numbers are included in one column.  In the second file (y), the activity name codes are included in one column.  In the third file (X), all the parameters are included in different columns.  These columns have names that come from the file features that is common to both the training and test groups.

###The data is processed in the following steps:
1. The columns from three files (subject_numbers, y, X) are combined for the train and test sets individually, resulting in two files.  
2. Then, the rows of the two resultant files are combined to yield one set of data with all subjects.
3. The columns are labeled with their appropriate names that are taken from the file features.
4. Only the columns with names that end in mean() and std() are subset into a new data set.
5. Activity labels replace activity nuumbers (as detailed in the section above).
6. To make the variable names more readable, "-" are removed.
7. The data is ordered so that subject numbers are in ascending order.
8. The data is averaged for each activity of each subject.
9. The resulting data set is written as a .txt file to the directory with the original files.

