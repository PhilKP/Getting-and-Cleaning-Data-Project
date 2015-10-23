# Getting-and-Cleaning-Data-Project
Project work for the course "Getting &amp; Cleaning Data" of Coursera


The R script, `run_analysis.R`, does the following:

1. Set the working directory and verify if the directory with the data set is avaiable.
2. Load the activity labels and feature
3. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4. Loads the activity and subject data for each dataset, and merges those columns with the dataset
5. Merges the two datasets and converts the `Activity` and `Subject` columns into factors
6. Creates a tidy dataset that consists of the mean of each variable for each subject and activity pair.

The end result is written into the file `tidy.txt`.

