library(dplyr)

## takes in nothing
## reads raw data from the files and performs NO processing
## returns a list where each member represents a file's data set
readDataFiles <- function() {
  
  return(list(
    features = read.table('./UCI HAR Dataset/features.txt'),
    labels = read.table('./UCI HAR Dataset/activity_labels.txt'),
    
    testData = read.table('./UCI HAR Dataset/test/x_test.txt'),
    testLabels = read.table('./UCI HAR Dataset/test/y_test.txt'),
    testSubjects = read.table('./UCI HAR Dataset/test/subject_test.txt'),
    
    trainData = read.table('./UCI HAR Dataset/train/x_train.txt'),
    trainLabels = read.table('./UCI HAR Dataset/train/y_train.txt'),
    trainSubjects = read.table('./UCI HAR Dataset/train/subject_train.txt')    
  ))
  
}

## takes in the list of raw data as returned by 'readDataFiles'
## renames training and test data set columns; adding 'activityId' & 'subjectId'
## returns a merged data set combining training & test data as data.frame
merge <- function(raw) {
  
  # rename columns
  colnames(raw$features) <- c('featureId', 'feature')
  colnames(raw$labels) <- c('activityId', 'activity')
  colnames(raw$testData) <- raw$features[,2]
  colnames(raw$testLabels) <- 'activityId'
  colnames(raw$testSubjects) <- 'subjectId'
  colnames(raw$trainData) <- raw$features[,2]
  colnames(raw$trainLabels) <- 'activityId'
  colnames(raw$trainSubjects) <- 'subjectId'
  
  # bind columns
  test <- cbind(raw$testSubject, raw$testLabels, raw$testData)
  train <- cbind(raw$trainSubject, raw$trainLabels, raw$trainData)
  
  # return merged data set
  return(rbind(test, train))
  
}
