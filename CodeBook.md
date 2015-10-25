## Project work towards Getting and Cleaning Data

###1 Description
This project work is towards partial completion of **Getting and Cleaning Data** course from Johns Hopkins. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The output is a tidy data set that can be used for later analysis

###1.1 Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###1.2 Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### 2 Program Logic

###2.1 Part-1.
Verify if the directory with the Data set is available in the R working directory. The program will terminate in case it is missing, with appropriate error message.


###2.2 Part-2
Get the the Activity (descriptive) and Features from the following files of the downloaded data
- features.txt
- activity_labels.txt

###2.3 Part-3
Filter the needed fetures of **Mean** and **Standard Deviation** out of the rest along with their index.

###2.4 Part-4
Load the Training and testing datasets.

Following files are used to source the training dataset:

- subject_train.txt
- x_train.txt
- y_train.txt

Following files are used to source the testing datasets:

- subject_test.txt
- x_test.txt
- y_test.txt


###2.5 Part-5
Merge the training & testing datasets. Building the resulting dataset with the Identifiers

- **Subject** - The Id of the test subject
- **Activity** - The type of activity being performed at the time of measurements
- **Features** - Filtered features with the only the Mean and Standard Deviation 

Finally converting the Subjects and Activities to Factors


###2.6 Part-6
Reshaping by melting the dataset by taking **Subjects** and **Activities** as the Ids. 
And then casting the dataframe with rest of the variables, by its mean across **Subjects** and **Activities**

###2.7 Part-7
Write the result into **tidy.txt**

### Activity Description

| **#**     | **Activities**           		 | **Description**													|
| :---: |:---------------------------|:-------------------------------------------------------------|
| 1 	| WALKING 					 | Subject was walking during the test 							|
| 2 	| WALKING_UPSTAIRS       	 | Subject was walking up a staircase during the test 			|
| 3 	| WALKING_DOWNSTAIRS      	 | Subject was walking down a staircase during the test 		|
| 4 	| SITTING      	 			 | Subject was sitting during the test 							|
| 5 	| STANDING  		      	 | Subject was standing during the test							|
| 6 	| LAYING 			      	 | Subject was laying down during the test						|


**End**
