---
title: "ReadMe"
author: "Arjun Sood"
date: "10 June 2017"
output: html_document
---

This document helps explain how the steps of the assignment have been followed:
  
  
_**Step 0: Reading the files**_  
- The working directory is assumed to be the 'UCI HAR Dataset' directory (unzipped folder)  
- All relevant files are read as tables into variables with names similar to the file names, using read.table command   
- The tables read in are: activity_labels, features, training data (3 files), test data (3 files)  
  
  
_**Step 1: Merging all data**_  
- cbind function is used to left-append subject and activity lists to the features data table  
- This is done for test and training data each  
- allTest and allTrain files are obtained  
- allTest is appended below allTrain using rbind function, to arrive at allMerged data set     
- allMerged has 10299 rows (7352 training data + 2947 test data) and 563 columns (561 features data columns + 1 activity labels column + 1 subject ID column) *refer Codebook for details*  
  
  
_**Step 2: Extract mean and standard deviation data only**_   
- the features list is searched using grepl command to identify variables containing 'mean()' or 'std()'. Please note: 'meanFrequncy()' has purposely not been included, as per my understanding  
- The logical vector returned in saved in variable 'onlyMeanSd'  
- Two 'TRUE' values are left appended to onlyMeanSd to ensure that the first two columns (i.e. activity labels and subject ID) do not get dropped   
- The data table is now subsetted using this logical vector to keep required columns only   
- Resultant table is stored as allMerged_onlyMeanSd   
   
   
_**Step 3: Replace activity labels in table with descriptive activity names**_  
- Using sapply command, each activity label from the data table's column is searched within the activity_labels variable and the activity name is returned and replaced in the data table  
  
  
_**Step 4: Update with descriptive column names**_ 
- the grep command is used to retrieve names of features that contain the mean() or sd() metrics. This is saved in a variable called featureslist_meansd  
- the dataset's columns are updated to reflect the data they contain, starting with "subject_id", "activity", and the set of all feature names. For detailed understanding of the feature names, please refer features_info.txt  
  
  
_**Step 5: Obtain final data set with mean values for each subejct and activity** _ 
- The dataframe is converted into a more usable dplyr table_df  
- It is then grouped by subject and activity using the group_by function   
- The summarize_each function is used to summarize all the features data columns by the groups defined    
  
  
_**Step X: Write out the final file**_  
- The final file is written out as "GettingAndCleaningDataCourseProject.txt"  
  
  
  
**Hope these explanations are helpful. For more details on the variables, please refer Codebook.md. For more information on the feature variables, refer features_info.txt **

