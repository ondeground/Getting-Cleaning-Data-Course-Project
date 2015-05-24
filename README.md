# Getting-Cleaning-Data-Course-Project
The Repo with my files for the course project of the Jon Hopkins Coursera course "Getting and Cleaning Data"

In this Repo you will find:

1. An R function called "run_analysis.R"
2. A folder called "UCI HAR Dataset" with all the files of the data set from the UCI Machine Learning Repository. (see K.Bache, and M. Lichman, UCI machine learning repository (ONline) archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones,2012.
3. The output of the "run_analysis.R" function, a text file named FinalDS.txt.
4. A Codebook, that describes the output of the "run_analysis.R" function.

In order to test the function, please download the function and the "UCI HAR Dataset" to your working directory.

The script of the function is divided in seven sections.
In the first section, the scrips binds in one file all the relavant files for the test dataset. This files include X_test.txt that contains 2947 samples for 561 features (variables), y_test.txt that contains the idnumber of the corresponding activity and the subject_test.txt that contains the idnumber of the subject that performed the activity. An ID variable was added to quickly identify in the merged dataset tha the subject belong to the test samples.
In the second section, the scrips binds in one file all the relavant files for the train dataset. This files include X_train.txt that contains 7352 samples for 561 features (variables), y_train.txt that contains the idnumber of the corresponding activity and the subject_train.txt that contains the idnumber of the subject that performed the activity. An ID variable was added to quickly identify in the merged dataset tha the subject belong to the train samples.

In the third section the binded Test and Train files are merged into one dataframe that has 10299 samples and 564 variables.

In the first section, the scrips binds in one file all the relavant files for the test and train datasets.

how the function loads and manipulates the data from the experiment to create a tidy data set  that meets the requeriments of the project.
