
# Getting_and_Cleaning_Data_ProjectAssignment
Project assignment for Data Science Coursera (Getting and Cleaning Data)
#### About: The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

### Output: To tidy up the input files into "Human Activity Recognition Using Smartphones Dataset".

### Data used for the project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Consists of the following files to be used to construct the data set:
1. Features.txt
2. Activity_labels.txt
3. X_train.txt
4. X_test.txt
5. Y_train.txt
6. Y_test.txt
7. Subject_train.txt
8. Subject_test.txt

### Details of the function [run_analysis.R]
1. Merges the training and the test sets to create one data set, e.g. reads X_train.txt and X_test.txt and merge into one data set.
2. Subset the mean and standard deviation for each measurement.
3. Reads in activity labels resulting in a data set of combines subject,features and activity data.
4. Labels the data set with descriptive variable names
5. Outputs to the tidy data set.

Download the data from the link and extract the above mentioned text files into the working directory. Run run_analysis.R to product the 
tidy data set.
