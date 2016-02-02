# Getting And Cleaning Data Course Project
Running from January 18 – February 22 2016

# Source of data
Unzip data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder "dataset"

# Running the analysis
source('run_analysis.R')

# How run_analysis.R works
  - The code for all parts of the questions has been labelled in the code as "Part x"
  - The initial code does some preprocessing and extracts all the data into meaningful variables
  - The code under Part 1 merges the test and training data
  - The code under Part 2 gets the column names on mean and std deviation for a measurement
  - The code under Part 3 & 4 gives meaningful activity labels by merging with the activity_labels dataset.
  - The code under part 5 creates the final tidy dataset

# Tidy Dataset
  - The code generates a file called tidy_data.txt which contains subject_id,activity_id and the average of all the measures for the given values of subject_id,activity_id

