#0 Read all the data

#activity_labels <- read.table("activity_labels.txt")
#features <- read.table("features.txt")

#subject_test <- read.table("./test/subject_test.txt")
#X_test <- read.table("./test/X_test.txt")
#y_test <- read.table("./test/y_test.txt")

#subject_train <- read.table("./train/subject_train.txt")
#y_train <- read.table("./train/y_train.txt")
#X_train <- read.table("./train/X_train.txt")

#1 Merge train & test data
allTrain <- cbind(subject_train,y_train,X_train)
allTest <- cbind(subject_test,y_test,X_test)
allMerged <- rbind(allTrain,allTest)

#2 Extract only mean & standard deviation columns
onlyMeanSd <- grepl("mean\\()|std\\()",features$V2) ##Get logical vector marking all mean() and std() fields 
onlyMeanSd <- c(TRUE,TRUE,onlyMeanSd) #Appending TRUEs the vector to retain the subject and activity columns
allMerged_onlyMeanSd <- allMerged[,onlyMeanSd] #Subsetting dataset with only subject, activity, and the mean/std fields

#3 Update with descriptive Activity names
activity_coln <- allMerged_onlyMeanSd$V1.1 #selecting col with activity numbers only
activity_coln <- sapply(activity_coln,function(x) activity_labels[activity_labels$V1 == x,]$V2) #replacing activity number with activity name

#4 Update with descriptive Variable (Column) names
featurelist_meansd <- grep("mean\\()|std\\()",features$V2,value=TRUE) #list of names of all the mean & std features 
colnames(allMerged_onlyMeanSd) <- c("subject_id","activity",featurelist_meansd) #updating column names

#5 Final data set!
library(dplyr)
finalData <- tbl_df(allMerged_onlyMeanSd) #Convert dataframe to dplyr format
finalGroup <- group_by(finalData,activity,subject_id) #Group data by subject and activity
finalSummary <- summarise_each(finalGroup, funs(mean)) #Calculate mean for each data column, grouped by each activity and subject

#X Write out the final dataset
write.table(finalSummary,row.names = FALSE, file = "GettingAndCleaningDataCourseProject.txt")
