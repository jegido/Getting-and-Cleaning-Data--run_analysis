### run_analysis

Getting and Cleaning Data: Course Project

The purpose of this project is to demonstrate your ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that 
can be used for later analysis.  

You will be required to submit: 
1) a tidy data set as described below 
2) a link to a Github repository with your script for performing the analysis 
3) a code book that describes the variables, the data, and any transformations 
or work that you performed to clean up the data called CodeBook.md. 

In this repo there are three file:

* README.md 
* run_analysis.R 
* CodeBook.md 

### README.md
This file.

### run_analysis.R
Code to run in R. This script does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

I assume that the data are in the directory "UCI HAR Dataset" and that
in the point 2 the literals 'mean' and the 'std' may be in any 
part of the name of the variables.

Executing all lines in order we obtain two data frames:

* 'alldata' with all subjects and the selected variables.
* 'average' with 30*6 rows (30 subjects, 6 activities) and the selected variables.
This data frame is exported a 'average.txt'. 
It can be read using the read.table function in R.

There are code for controlling the load and verify the results and 
it remove intermediate files.

The 'run_analysis.R' script is well-documented and there are in-line comments 
which explain each step taken to transform the data. 

### CodeBook.md 
File to describe the data which can be found in 'average.txt'.
