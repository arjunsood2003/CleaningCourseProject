---
title: "Codebook for CleaningDataCourse Project on Coursera"
author: "Arjun Sood"
date: "10 June 2017"
output: html_document
---

##Metadata Dictionary: 
###Peek into the variables used in the code 

####activity_labels  
data.frame [ 6 x 2 ]  
*Links class labels with Activity Name*  
$ V1: int 1 2 3 4 5 6  
$ V2: Factor w/ 6 levels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
  
####features  
data.frame [ 561 x 2 ]  
*List of all features*  
$ V1: int  1 2 3 4 5 6 7 8 9 10 ...  
$ V2: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)"  
*refer features_info.txt for full details*
  
####X_train  
data.frame [ 7352 x 561 ]  
*Training data of all features*  
$ V1  : num  0.289 0.278 0.28 0.279 0.277 ...  
$ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  
*till $V561*


####y_train  
data.frame [ 7352 x 1 ]  
*Training activity labels among {1,2,3,4,5,6}*  
$ V1: int  5 5 5 5 5 5 5 5 5 5 ...


####subject_train  
data.frame [ 7352 x 1 ]  
*Subject ID of the person who performed the particular activity among the 21 training persons out of 30 {1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30}*  
$ V1: int  1 1 1 1 1 1 1 1 1 1 ...


####X_test  
data.frame [ 2947 x 561 ]  
*Test data of all features*  
$ V1  : num  0.289 0.278 0.28 0.279 0.277 ...  
$ V2  : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  
*till $V561*


####y_test  
data.frame [ 2947 x 1 ]  
*Test activity labels among {1,2,3,4,5,6}*  
$ V1: int  5 5 5 5 5 5 5 5 5 5 ...


####subject_test  
data.frame [ 2947 x 1 ]  
*Subject ID of the person who performed the particular activity among the 9 test persons out of 30 {2,4,9,10,12,13,18,20,24}*  
$ V1: int  2 2 2 2 2 2 2 2 2 2 ...


####allTrain  
data.frame [ 7352 x 563 ]  
*Combined training data, training activity labels, and training subject IDs*  
$ V1  : int  1 1 1 1 1 1 1 1 1 1 ... *subject IDs*  
$ V1  : int  5 5 5 5 5 5 5 5 5 5 ... *activity labels*    
$ V1  : num  0.289 0.278 0.28 0.279 0.277 ... *features data*   
*till $V561*


####allTest  
data.frame [ 2947 x 563 ]  
*Combined test data, test activity labels, and test subject IDs*  
$ V1  : int  2 2 2 2 2 2 2 2 2 2 ... *subject IDs*  
$ V1  : int  5 5 5 5 5 5 5 5 5 5 ... *activity labels*    
$ V1  : num  0.257 0.286 0.275 0.27 0.275 ... *features data*  
*till $V561*


####allMerged  
data.frame [ 10299 x 563 ]  
*Combined all test and train data*  
$ V1  : int  1 1 1 1 1 1 1 1 1 1 ...  *subject ids*
$ V1  : int  5 5 5 5 5 5 5 5 5 5 ...  *activity labels*
$ V1  : num  0.289 0.278 0.28 0.279 0.277 ...  *features data*
*till $V561*


####onlyMeanSd  
logi [ 1 x 563 ] TRUE TRUE TRUE TRUE TRUE TRUE ...  
*Logical vector marking select features which have "mean()" or "std()" calculations as TRUE. Rest FALSE* 


####allMerged_onlyMeanSd  
data.frame [ 10299 x 68 ]  
*Subsetting table to keep only Mean and Standard Deviation features data*  
$ subject_id                 : int  1 1 1 1 1 1 1 1 1 1 ...  
$ activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...  
$ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...  
$ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  

####featurelist_meansd  
chr [1:66] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" ...  
*List of the descriptive names of all the mean & std features*  
*For full details of feature nomenclature, refer features_info.txt*


####finalData  
Classes 'tbl_df', 'tbl' and 'data.frame' [ 10299 x 68 ]  
*dplyr compatible variable converted from regular R dataframe, storing all data*  
$ subject_id                 : int  1 1 1 1 1 1 1 1 1 1 ...  
$ activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...  
$ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...  
$ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  


####finalGroup  
Classes 'grouped_df', 'tbl_df', 'tbl' and 'data.frame' [ 10299 x 68 ]  
*Final data grouped by subject_id and activity label*  
$ subject_id                 : int  1 1 1 1 1 1 1 1 1 1 ...  
$ activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...  
$ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...  
$ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...

 
####finalSummary  
Classes 'grouped_df', 'tbl_df', 'tbl' and 'data.frame' [ 180 x 68 ]  
*Final data summarized for each subject and activity with mean values for features*  
$ activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...  
$ subject_id                 : int  1 2 3 4 5 6 7 8 9 10 ...  
$ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ...  
$ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
