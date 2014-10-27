CodeBook
========
This file describes the variables, the data and transformations that have been performed to clean up the data.  
     
Original Dataset:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The run_analysis.R script performs the following steps to clean up the data:   
1. Read features.txt and store it in features dataframe (561 columns)
2. Make feature names consistent, removing not required characters and every word starts with a big letter
3. Read activity labels and store it activities dataframe (6 columns), WALKING...RUNNING...
4. Read train and test data and already add feature names through read.table() function
5. Merge train and test data in tableX dataframe
6. Just keep mean and standard deviation columns
7. Read corresponding activities as index for each test and train observation 
8. Get labels for each index
9. Merge labels in tableX dataframe
10. Read corresponding subjects 1..30
11. Merge subjects in tableX dataframe
12. Creates a second, independent tidy data set avgTable with the average of each variable for each activity and each subject
13. Save tidy data set to tidydata.txt
14. Return tidy data set
 
