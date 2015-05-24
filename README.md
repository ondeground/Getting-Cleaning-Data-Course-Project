# Getting-Cleaning-Data-Course-Project
The Repo with my files for the course project of the Jon Hopkins Coursera course "Getting and Cleaning Data"

In this Repo you will find:

1. An R function called "run_analysis.R"
2. A folder called "UCI HAR Dataset" with all the files of the data set from the UCI Machine Learning Repository. (see K.Bache, and M. Lichman, UCI machine learning repository (Online) archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones,2012)
3. The output of the "run_analysis.R" function, a text file named FinalDS.txt.
4. A Codebook, that describes the output of the "run_analysis.R" function.

In order to test the function, please download the function and the "UCI HAR Dataset" to your working directory.

The script of the function is divided in seven sections.

In the first section, the scrips binds in one file all the relavant files for the test dataset. This files include X_test.txt that contains 2947 samples for 561 features (variables), y_test.txt that contains the idnumber of the corresponding activity and the subject_test.txt that contains the idnumber of the subject that performed the activity. An ID variable was added to quickly identify in the merged dataset tha the subject belong to the test samples.

In the second section, the scrips binds in one file all the relavant files for the train dataset. This files include X_train.txt that contains 7352 samples for 561 features (variables), y_train.txt that contains the idnumber of the corresponding activity and the subject_train.txt that contains the idnumber of the subject that performed the activity. An ID variable was added to quickly identify in the merged dataset tha the subject belong to the train samples.

In section 3 the binded Test and Train files are merged into one dataframe that has 10299 samples and 564 variables.

In section 4 a shorter version of the dataframe is made by exctracting only six variables that correpond to the estimated mean of the body acceleration XYZ time domain signals, and to the estimated standard deviation of the body acceleration XYZ time domain signals. The fixed variables (IDsample, Subjects and Activities) are also preserved. According to the feature.txt file, these variables correspond to the fisrt six columns in the X_test.txt and X_train.txt files. In the merged dataset they are named. V1.2,V2,V3,V4,V5 and V6.

In section 5 descriptive activity names are used to name the activities in the data set.

In section 6 the variables of the short datases are labelled according to the corresponding names listed in the feature.txt file.

In section 7, the final dataset is created, computing the average of each activity and each subject. The result is a dataset with 180 samples and 8 variables. The dataset is written as "FinalDS.txt".





