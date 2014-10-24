# Getting and cleaning data course project
run_analysis <- function() {
    # use "dplyr" library for fast joins
    library(dplyr)
    library(tidyr)
    ############################################################################
    # get 561 features
    features <-read.table("./Dataset/features.txt", 
                           header = FALSE, 
                           col.names = c("idx", "label"), 
                           stringsAsFactors = FALSE)
    # cleanup feature names, remove "-", "(", ")" characters
    features$label <- gsub(",|-|\\(|\\)", "", features$label)
    # make feature names consistent
    features$label <- gsub("mean", "Mean", features$label)
    features$label <- gsub("std", "Std", features$label)
    features$label <- gsub("gravity", "Gravity", features$label)
    #features$label <- gsub(",|-", "_", features$label)    
    ############################################################################    
    # get 6 activities     
    activities <- read.table("./Dataset/activity_labels.txt",
                              header = FALSE, 
                              col.names = c("id", "label"), 
                              stringsAsFactors = FALSE)
    ############################################################################
    # get test and training sensor values and step4 is easy to implement with
    # the "col.names" parameter of read.table()
    # step4: appropriately labels the data set with descriptive variable names.
    testX <-read.table("./Dataset/test/X_test.txt", 
                       header = FALSE, 
                       col.names = features$label,
                       colClasses = "numeric")
    
    trainX <-read.table("./Dataset/train/X_train.txt", 
                        header = FALSE, 
                        col.names = features$label,
                        colClasses = "numeric")
    # step1: merge test, train rows
    tableX <- rbind_list(testX, trainX)
    # step2: extract only the measurements on the mean and standard deviation
    isStdOrMeanMeasurement <- names(tableX) %in% grep("Mean|Std", 
                                                      names(tableX), 
                                                      value = TRUE)
    tableX <- tableX[, isStdOrMeanMeasurement]
    ############################################################################
    #get corresponding activities
    testActivities <- read.table("./Dataset/test/y_test.txt",
                                 header = FALSE, 
                                 col.names = c("id"))
    testActivities <- inner_join(testActivities, activities, by = "id")
    trainActivities <- read.table("./Dataset/train/y_train.txt",
                                  header = FALSE, 
                                  col.names = c("id"))    
    trainActivities <- inner_join(trainActivities, activities, by = "id")
    # merge test, train activity rows
    tableActivities <- rbind(testActivities, trainActivities)
    # step3: descriptive activity names to name the activities in the data set
    tableX$activity <- tableActivities$label
    ############################################################################
    # get corresponding subjects
    testSubjects <- read.table("./Dataset/test/subject_test.txt",
                               header = FALSE, 
                               col.names = c("subject"))
    trainSubjects <- read.table("./Dataset/train/subject_train.txt",
                                header = FALSE, 
                                col.names = c("subject")) 
    # merge test,train subject rows
    tableSubjects <- rbind(testSubjects, trainSubjects)
    # add column to table
    tableX$subject <- tableSubjects$subject
    ############################################################################
    # step5: From the data set in step 4, creates a second, independent tidy
    # data set with the average of each variable for each activity and each 
    # subject.
    avgTable <- 
        tableX %>%
        group_by(activity, subject) %>%
        summarise_each(funs(mean))
    # save tidy data
    write.table(avgTable, file="tidyData.txt", row.names = FALSE)
    ############################################################################
    avgTable
                          
}