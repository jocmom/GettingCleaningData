# Coursera - Getting and Cleaning Data: Course Project

## Introduction

This repository contains my course project for the Coursera course 
"Getting and Cleaning data". It contains the following files/folders

- "run_analysis.r" script file - performing some Getting and Cleaning Data skills
- "tidyData.txt" file - script result
- "codebook.md" file - describing the variables, the data, and transformations 

## Requirements

- Download UCI HAR Dataset 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Extract the dataset to the folder "Dataset". This folder must be located in 
the same folder as the "run_analysis.r" script


## The dataset

The dataset represent data collected from the accelerometers from the Samsung 
Galaxy S smartphone. A full description is available at the site where the data 
was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
It contains several txt files which are further described in the downloaded 
"Readme.txt"


## The script

The "run_analysis.R" script does the following steps:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each 
  measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with
the average of each variable for each activity and each subject.


## The CodeBook

The CodeBook.md file explains the transformations performed and the resulting 
data and variables.
