##  
##  Course Id: getdata-033
##  Date: 23 Oct 2015
##  
##  Assumptions:
##  ~~~~~~~~~~~~
##  
##  1. Data is downloaded and unzipped into <working dir>/c3projDataset
##  

run_analysis <- function(){

  
  # Part-1: verify the data set path 
  setwd("C:/Users/pphilipose/Documents/r_working_dir")
  if(! dir.exists("./UCI HAR Dataset")) { stop ("Data dir missing. Program terminated")}
 
  
  # part-2: get labels & features 
  actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  features <- read.table("./UCI HAR Dataset/features.txt")
  
  # Part-3: filtering for features on mean and standard deviation only
  reqFeatures <- grep("-(mean|std)\\(\\)", features[, 2])
  reqFeaturesNames <- features[reqFeatures,2] # getting names
  reqFeaturesNames <- gsub('-mean', 'Mean', reqFeaturesNames)
  reqFeaturesNames <- gsub('-std', 'Std', reqFeaturesNames)
  reqFeaturesNames <- gsub('[-()]', '', reqFeaturesNames)
  
  #Part-4 - Loading the data sets
  # load the training datasets
  dsTraining <- read.table("UCI HAR Dataset/train/X_train.txt")[reqFeatures]
  dsTrainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
  dsTrainSub <- read.table("UCI HAR Dataset/train/subject_train.txt")
  dsAllTrain <- cbind(dsTrainSub, dsTrainAct, dsTraining)
  
  # load the test datasets
  dsTesting <- read.table("UCI HAR Dataset/test/X_test.txt")[reqFeatures]
  dsTestAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
  dsTestSub <- read.table("UCI HAR Dataset/test/subject_test.txt")
  dsAllTest <- cbind(dsTestSub, dsTestAct, dsTesting)
  
  # Part-5: merging testing and training datasets with labels
  dsAllData <- rbind(dsAllTrain, dsAllTest)
  colnames(dsAllData) <- c("Subject", "Activity", reqFeaturesNames)
  
  # activities & subjects into factors
  dsAllData$Activity <- factor(dsAllData$Activity, levels = actLabels[,1], labels = actLabels[,2])
  dsAllData$Subject <- as.factor(dsAllData$Subject)
  
  # Part-6: melting data recasting the dataframe
  library(reshape2)
  
  dsAllDataMelted <- melt(dsAllData, id = c("Subject", "Activity"))
  dsAllDataMean <- dcast(dsAllDataMelted, Subject + Activity ~ variable, mean)
  
  write.table(dsAllDataMean, "tidy.txt", row.names = FALSE, quote = FALSE)
  
} # end function
