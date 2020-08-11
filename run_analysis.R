source('functions.R')

## read all data files if not already in-memory
if (!exists('rawData')) rawData <- readDataFiles()

## Answers 1 & 4
## rename columns then merge test & train measurement data into a combined data set
allData <- merge(rawData)

## Answer 2
## extract only the measurements on the mean and std
out <- select(allData, contains(c('subjectId','activityId','mean()','std()'), ignore.case = T))

## Answer 3
## use descriptive activity names to name the activities in the data set
out <- out %>%
  inner_join(rawData$labels, by = c('activityId' = 'V1')) %>%
  rename(activityName = V2) %>%
  select(contains(c('subjectId','activityName','mean()','std()'), ignore.case = T))

## Answer 5
## create a second, independent tidy data set with the average of each variable
## for each activity and each subject then Write output to 'tidy.txt'
tidy <- out %>% group_by(subjectId, activityName) %>% summarise_all(mean)
write.table(tidy, "tidy.txt", row.name = F)
