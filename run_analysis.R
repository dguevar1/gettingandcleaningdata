# File: run_analysis.R
#
# Description: 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
#
# Load packages
library(dplyr)
#
################################################################
# Load Activity Labels and Features
################################################################
#
# a.) Read in activity labels.
#
activity_labels = read.table("activity_labels.txt")
activity_labels <- rename(activity_labels, activity_label_id = V1, activity_label_description = V2)
head(activity_labels)
#
# b.) Read in features.
#
features = read.table("features.txt")
features <- rename(features, feature_id = V1, feature_description = V2)
head(features)
#
################################################################
# Load Training Set
################################################################
#
# c.) Read in subject training set.
#
subject_train = read.table("train/subject_train.txt")
subject_train <- rename(subject_train, subject_id = V1)
# number of data samples per subject on the training set
data_samples_per_subject_train <- table(subject_train)
data_samples_per_subject_train
# list of unique subjects on the training set
unique_subjects_train <- unique(subject_train)
unique_subjects_train
# number of unique subjects on the training set
rapply(subject_train,function(x)length(unique(x)))
# preview of the start of the data list
head(subject_train)
# preview of the end of the data list
tail(subject_train)
#
# d.) Read in triaxial acceleration from the accelerometer (total accelearation) for the training set.
#
total_acceleration_x_train = read.table("train/Inertial Signals/total_acc_x_train.txt")
#
total_acceleration_y_train = read.table("train/Inertial Signals/total_acc_y_train.txt")
#
total_acceleration_z_train = read.table("train/Inertial Signals/total_acc_z_train.txt")
#
total_acceleration_xyz_train <- data.frame(total_acceleration_x=total_acceleration_x_train, total_acceleration_y=total_acceleration_y_train, total_acceleration_z=total_acceleration_z_train)
#
head(total_acceleration_xyz_train,n=2)
#
# e.) Read in the estimated body acceleration for the training set.
#
body_acceleration_x_train = read.table("train/Inertial Signals/body_acc_x_train.txt")
#
body_acceleration_y_train = read.table("train/Inertial Signals/body_acc_y_train.txt")
#
body_acceleration_z_train = read.table("train/Inertial Signals/body_acc_z_train.txt")
#
body_acceleration_xyz_train <- data.frame(body_acceleration_x=body_acceleration_x_train, body_acceleration_y=body_acceleration_y_train, body_acceleration_z=body_acceleration_z_train)
#
head(body_acceleration_xyz_train,n=2)
#
# f.) Read in the triaxial angular velocity from the gyroscope for the training set.
#
body_gyroscope_x_train = read.table("train/Inertial Signals/body_gyro_x_train.txt")
#
body_gyroscope_y_train = read.table("train/Inertial Signals/body_gyro_y_train.txt")
#
body_gyroscope_z_train = read.table("train/Inertial Signals/body_gyro_z_train.txt")
#
body_gyroscope_xyz_train <- data.frame(body_gyroscope_x=body_gyroscope_x_train, body_gyroscope_y=body_gyroscope_y_train, body_gyroscope_z=body_gyroscope_z_train)
#
head(body_gyroscope_xyz_train,n=2)
#
# g.) Combined inertial signals data for the training set
#
inertial_signals_train <- data.frame(total_acceleration_xyz_train, body_acceleration_xyz_train, body_gyroscope_xyz_train)
head(inertial_signals_train,n=2)
#
# h.) Read in features training set.
#
x_train = read.table("train/X_train.txt")
dim(x_train)
colnames(x_train) <- unlist(features[2])
head(x_train,n=2)
tail(x_train)
#
# i.) Read in activity label data for training set.
#
y_train = read.table("train/y_train.txt")
y_train <- rename(y_train, activity_label_id = V1)
y_train$activity_label_id <- factor(y_train$activity_label_id)
levels(y_train$activity_label_id) <- activity_labels[,2]
head(y_train)
tail(y_train)
#
# j.) Combine all training set.
#
training_set <- data.frame(subject_train,y_train,inertial_signals_train,x_train)
head(training_set, n=2)
#
################################################################
# Load Testing Set
################################################################
#
# k.) Read in subject testing set.
#
subject_test = read.table("test/subject_test.txt")
subject_test <- rename(subject_test, subject_id = V1)
# number of data samples per subject on the testing set
data_samples_per_subject_test <- table(subject_test)
data_samples_per_subject_test
# list of unique subjects on the testing set
unique_subjects_test <- unique(subject_test)
unique_subjects_test
# number of unique subjects on the training set
rapply(subject_test,function(x)length(unique(x)))
# preview of the start of the data list
head(subject_test)
# preview of the end of the data list
tail(subject_test)
#
# l.) Read in triaxial acceleration from the accelerometer (total accelearation) for the testing set.
#
total_acceleration_x_test = read.table("test/Inertial Signals/total_acc_x_test.txt")
#
total_acceleration_y_test = read.table("test/Inertial Signals/total_acc_y_test.txt")
#
total_acceleration_z_test = read.table("test/Inertial Signals/total_acc_z_test.txt")
#
total_acceleration_xyz_test <- data.frame(total_acceleration_x=total_acceleration_x_test, total_acceleration_y=total_acceleration_y_test, total_acceleration_z=total_acceleration_z_test)
#
head(total_acceleration_xyz_test,n=2)
#
# m.) Read in the estimated body acceleration for the testing set.
#
body_acceleration_x_test = read.table("test/Inertial Signals/body_acc_x_test.txt")
#
body_acceleration_y_test = read.table("test/Inertial Signals/body_acc_y_test.txt")
#
body_acceleration_z_test = read.table("test/Inertial Signals/body_acc_z_test.txt")
#
body_acceleration_xyz_test <- data.frame(body_acceleration_x=body_acceleration_x_test, body_acceleration_y=body_acceleration_y_test, body_acceleration_z=body_acceleration_z_test)
#
head(body_acceleration_xyz_test,n=2)
#
# n.) Read in the triaxial angular velocity from the gyroscope for the testing set.
#
body_gyroscope_x_test = read.table("test/Inertial Signals/body_gyro_x_test.txt")
#
body_gyroscope_y_test = read.table("test/Inertial Signals/body_gyro_y_test.txt")
#
body_gyroscope_z_test = read.table("test/Inertial Signals/body_gyro_z_test.txt")
#
body_gyroscope_xyz_test <- data.frame(body_gyroscope_x=body_gyroscope_x_test, body_gyroscope_y=body_gyroscope_y_test, body_gyroscope_z=body_gyroscope_z_test)
#
head(body_gyroscope_xyz_test,n=2)
#
# o.) Combined inertial signals data for the testing set.
#
inertial_signals_test <- data.frame(total_acceleration_xyz_test, body_acceleration_xyz_test, body_gyroscope_xyz_test)
head(inertial_signals_test,n=2)
#
# p.) Read in features testing set.
#
x_test = read.table("test/x_test.txt")
dim(x_test)
colnames(x_test) <- unlist(features[2])
head(x_test,n=2)
tail(x_test)
#
# q.) Read in activity label data for testing set.
#
y_test = read.table("test/y_test.txt")
y_test = rename(y_test, activity_label_id = V1)
y_test$activity_label_id <- factor(y_test$activity_label_id)
levels(y_test$activity_label_id) <- activity_labels[,2]
head(y_test)
tail(y_test)
#
# r.) Combine all training set.
#
testing_set <- data.frame(subject_test,y_test,inertial_signals_test,x_test)
head(testing_set, n=2)
#
################################################################
# Combine Training and Testing Set
################################################################
#
combined_set <- merge(training_set,testing_set,all=TRUE)
head(combined_set,n=2)
unique(combined_set[1])
#
# 5.) From the data set in step 4, creates a second, independent
# tidy data set with the average of each variable for each
# activity and each subject.
# 
# a.) group the combined set by subject_id and activity_label_id
setBySubjectActivity <- group_by(combined_set, subject_id, activity_label_id)
head(setBySubjectActivity, n=6)
#
# b.) Use melt to collapse all the variables besides subject_id and activity_label_id
#
names(setBySubjectActivity[,-(1:2)])
myColumnNames <- names(setBySubjectActivity[,-(1:2)])
myColumnNames
dataMelt <- melt(setBySubjectActivity,id=c("subject_id","activity_label_id"),measure.vars=myColumnNames)
head(dataMelt,n=10)
meanData1 <- dcast(dataMelt, activity_label_id ~ variable, mean)
dim(meanData1)
head(meanData1)
write.table(meanData1,file="tidy_data_set.txt",row.names=FALSE)


