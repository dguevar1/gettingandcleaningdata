# Getting and Cleaning Data
Repository use for course project in Getting And Cleaning Data. Below, a description of how run_analysis.R works is provided.

# Descriptin of run_analysis.R
For the course project, the file run_analysis.R was created. The file produces a tidy data set from a collection of raw data files taken from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" by [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

The data use for the project is available here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note, the file run_analysis.R must be placed inside the UCI HAR Dataset folder once the file is unzipped as it uses relative paths to load files.

The general work flow of the run_analysis.R script is as follows:

- Load the training set files using the read.table function.
- Combine each dataset into a larger training set data frame.
- Load the testing set files using the read.table function.
- Combine each dataset into a larger testing set data frame.
- Use the merge function to combine both training and testing sets into one
- Use melt and dcast functions to find the mean of each variable with respect to subject_id and activity_label
- Write out the final tidy data set to a text file
  