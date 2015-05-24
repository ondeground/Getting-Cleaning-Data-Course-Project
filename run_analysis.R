run_analysis<-function(){
# IMPORTANT, in order to load the data files needed for the project, 
# it is assumed that the file "UCI HAR Dataset.zip" has been unzipped 
# in your working directory and it has NOT been modified.
                
##Part one: build the test dataset
        
TestDS<-read.table("./UCI HAR Dataset/test/X_test.txt")
TestActs<-read.table("./UCI HAR Dataset/test/y_test.txt")
TestSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
Test<-data.frame(TestSubjects,TestActs,TestDS)
Test$ID<-"TEST"                          ## This new variable is to identify which subjects belong to the test dataset.
##Part two: build the train dataset

TrainDS<-read.table("./UCI HAR Dataset/train/X_train.txt")
TrainActs<-read.table("./UCI HAR Dataset/train/y_train.txt")
TrainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
Train<-data.frame(TrainSubjects,TrainActs,TrainDS)
Train$ID<-"TRAIN"                       ## This new variable is to identify which subjects belong to the train dataset.

##Part three: merge the train & test to create a complete dataset
CompleteDS<-rbind(Test,Train)

##Part four: Extracts only the measurements on the mean and standard deviation for each measurement
        ### The values of the mean and standard deviation for each measurement correspond 
        ### to the first six variables  (columns) of the X_test.txt and the X_train.txt files. 
        ### In my merged file (CompleteDS) these columns are named V1.2,V2,V3,V4,V5 and V6. 
        ### Variable V1 correspond to subjects id number and V1.1 to activities.

library(dplyr)
CompleteDS<-tbl_df(CompleteDS)
ShortDS<-CompleteDS %>% select (ID, V1,V1.1,V1.2,V2,V3,V4,V5,V6)

##Part five: Use descriptive activity names to name the activities in the data set
ShortDS$V1.1[ShortDS$V1.1==1]<-"WALKING"
ShortDS$V1.1[ShortDS$V1.1==2]<-"WALKING_UPSTAIRS"
ShortDS$V1.1[ShortDS$V1.1==3]<-"WALKING_DOWNSTAIRS"
ShortDS$V1.1[ShortDS$V1.1==4]<-"SITTING"
ShortDS$V1.1[ShortDS$V1.1==5]<-"STANDING"
ShortDS$V1.1[ShortDS$V1.1==6]<-"LAYING"

##Part six: Labels the data set with descriptive names. The names were taken from the featurel.txt file. 
        ### If I had fully understood what this signals and measurements mean, maybe I would 
        ### have figured out better names for the variables.
ShortDS<-ShortDS %>% rename(SubjectID=V1, Activity=V1.1, tBodyAccMeanX=V1.2, tBodyAccMeanY=V2, tBodyAccMeanZ=V3, tBodyAccStdX=V4, tBodyAccStdY=V5, tBodyAccStdZ=V6)

##Part seven: From the dataset created in step 6, a second, independent tidy dataset with the average of each variable for each activity and each subject is created.
ShortDS<- ShortDS %>% group_by(SubjectID,Activity)
TidyDS<- ShortDS %>% summarize(mean(tBodyAccMeanX), mean(tBodyAccMeanY),mean(tBodyAccMeanZ), mean(tBodyAccStdX),mean(tBodyAccStdY),mean(tBodyAccStdZ))
write.table(TidyDS,file="FinalDS.txt",row.names=F)



##Bonus code: Use proper random human names to honor the volunteers who performed the activities to produce the data
TidyDS$SubjectID[TidyDS$SubjectID==1]<-"Ximena"
TidyDS$SubjectID[TidyDS$SubjectID==2]<-"Manuel"
TidyDS$SubjectID[TidyDS$SubjectID==3]<-"Shannon"
TidyDS$SubjectID[TidyDS$SubjectID==4]<-"Uma"
TidyDS$SubjectID[TidyDS$SubjectID==5]<-"Alejandro"
TidyDS$SubjectID[TidyDS$SubjectID==6]<-"Ulises"
TidyDS$SubjectID[TidyDS$SubjectID==7]<-"Regina"
TidyDS$SubjectID[TidyDS$SubjectID==8]<-"Hans"
TidyDS$SubjectID[TidyDS$SubjectID==9]<-"Piero"
TidyDS$SubjectID[TidyDS$SubjectID==10]<-"Francesca"
TidyDS$SubjectID[TidyDS$SubjectID==11]<-"Ana"
TidyDS$SubjectID[TidyDS$SubjectID==12]<-"Lourdes"
TidyDS$SubjectID[TidyDS$SubjectID==13]<-"Florian"
TidyDS$SubjectID[TidyDS$SubjectID==14]<-"Mariana"
TidyDS$SubjectID[TidyDS$SubjectID==15]<-"Jennifer"
TidyDS$SubjectID[TidyDS$SubjectID==16]<-"Alice"
TidyDS$SubjectID[TidyDS$SubjectID==17]<-"Jochen"
TidyDS$SubjectID[TidyDS$SubjectID==18]<-"Lee"
TidyDS$SubjectID[TidyDS$SubjectID==19]<-"Juan"
TidyDS$SubjectID[TidyDS$SubjectID==20]<-"Mercedes"
TidyDS$SubjectID[TidyDS$SubjectID==21]<-"Iria"
TidyDS$SubjectID[TidyDS$SubjectID==22]<-"Yvette"
TidyDS$SubjectID[TidyDS$SubjectID==23]<-"Claudia"
TidyDS$SubjectID[TidyDS$SubjectID==24]<-"Paul"
TidyDS$SubjectID[TidyDS$SubjectID==25]<-"Brad"
TidyDS$SubjectID[TidyDS$SubjectID==26]<-"Jacinta"
TidyDS$SubjectID[TidyDS$SubjectID==27]<-"Clemente"
TidyDS$SubjectID[TidyDS$SubjectID==28]<-"Guillermo"
TidyDS$SubjectID[TidyDS$SubjectID==29]<-"Blanca"
TidyDS$SubjectID[TidyDS$SubjectID==30]<-"Karina"
TidyDS <- TidyDS %>% rename(SubjectName=SubjectID)
}

