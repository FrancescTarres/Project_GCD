# GCD_Project

Repository for the Project of Getting and Cleaning Data Course

# Description of the directory

The directory contains the results and software of the final project that corresponds to the Getting and Cleaning Data Course in Coursera.

The main files in the repository are:

* Readme.md: This file, containing explanations about contents, program and tidy data characteristics
* run_analysis.R: Script with the code implement to develop the project
* Final_Tidy_Data.txt: Text file containing the final data obtained in the project.
* A directory with the original UCI HAR Dataset: It is necessary to execute the script.
* Other auxiliary files from RStudio project and git

# Some comments about the script to solve the project

The script reads the features and activity tables for using these names when later labelling the columns of the dataset or the activities.

After that it reads the three files of activity, subject and data and constructs three different frames containing these data. These frames are binded in column form in order to have a single frame containing all the training dataset. This frame contains several columns and one sample for every row.

The same process is applied for reading the test data.

Training and test data are binded by rows, obtaining a single file with all the data. To this file the names of the variables are appended in order to have a good description of the contents of each column

Finally, the columns containing the sequence "mean" or "std" are selected. The rest of columns are deleted.

The last part consist in using the library dplyr in order to group the data frame by identity and activity and calculate the mean of every data to simplify the archive. The final data frame is saved with the name Final_Tidy_Data.txt

# Description of the Tidy Data File Contents

The final tidy data file obtained in this project is a summary of the data files given in the UCI HAR Dataset

The final data is grouped by the number of the individual (first column). the second column contains the activity been realized by the individual. The following 79 columns contain the information of the mean value obtained for every field in any activity and individual. The selected variables are all the variables in the original file which represent a mean measure or the standard deviation of the measure. The names of the variables are inserted in the header of the file and correspond to the same names given in the original dataset. The physical value that each variable is represented may be found in the original description of the dataset.
