---
title: "CodeBook.md"
author: "Dany Guevara"
date: "Saturday, February 21, 2015"
output: html_document
---

This code book serves to describe the variables used in tidy_data_set.txt file produced by run_analysis.R.

## Background
run_analysis.R processes the raw data files from "Human Activity Recognition Using Smartphones Dataset Version 1.0" by [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

The experiment consisted of having 30 volunters do several activities while wearing a smarthphone on the waist. Data was collected from the Samsung Galaxy S II smartphone the 30 participants used to do the experiment.

## Activities
The activity label_id is an enumeration of the type of activities done by participants: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## Data collected from phone
The sensor signals from the smartphone's accelerometer and gyroscope are described as features and represent raw signals along the X,Y,and Z axis.

## Data Set Availability

The dataset comes with an excellent readme.txt, features_info.txt, features.txt, and activity_labels.txt files that were used to make sense of the raw data files. The dataset is available from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Tidy Data Set Summary

The tidy data set includes mean values for all the features (sensor signals) that were collected while project participants did the various physical activities.




