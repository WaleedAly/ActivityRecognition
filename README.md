# Read Me

#### Description of analysis files


* **functions.R**

1. readDataFiles: reads all raw data files into a list, no processing is performed.
2. merge: renames the columns and returns a data set that is the union of test and train data sets.

* **run_analysis.R**

1. executes 'readDataFiles()' to read raw data once.
2. executes 'merge()' on the raw data.
3. extracts a subset of the merged data set for mean & std variables.
4. adds activity description by performing an inner join with 'activity_labels'.
5. summarizes the data set by calculating the mean for each variable; grouping by subject id & activity.
