library(plyr) #to define for using join()
library(reshape2) #to define for using melt() and dcast()

#Read data for subject test and train data.
subject_test <- read.table("subject_test.txt", col.names = c("Subject"))
subject_train <- read.table("subject_train.txt", col.names = c("Subject"))
#Combine both test and train data into one data frame.
subject_all <- rbind(subject_train, subject_test)


#Read in features data from test and train.
feature_test <- read.table("X_test.txt")
feature_train <- read.table("X_train.txt")
#Combine both test and train data
feature_all <- rbind(feature_test, feature_train)

#Read in information for the features.
feature_list <- read.table("features.txt", col.names = c("index", "feature_labels"))
#Create 1D character vector containing the feature labels from feature_list data frame.
feature_labels <- feature_list$feature_labels
#Create logical vector taking columns which have mean() and std()
feature_subset <- grepl('mean\\(\\)|std\\(\\)', feature_labels)
#Create a character vector containing features with mean and standard deviation in their name
feature_list <- as.character(feature_labels[feature_subset])

#Rename columns in feature_all
colnames(feature_all) <- feature_labels
#Extract only mean() and std() columns from feature_all
feature_all <- feature_all[,feature_subset]

#Read in activities for train and test
activity_test <- read.table("Y_test.txt")
activity_train <- read.table("Y_train.txt")
#Combine both test and train data
activity_all <- rbind(activity_test, activity_train)
colnames(activity_all) <- "activityLabel"

#Change the activity values' description using the activity label file.
activity_labels <- read.table("activity_labels.txt", sep =" ",col.names = c("activityLabel", "Activity"))
activity_all <- join(activity_all, activity_labels, by = "activityLabel", type="left")
activity_all$activityLabel <- NULL

#Combine Activities, Subjects and Features into one data frame
combine_all <- cbind(feature_all, activity_all, subject_all)

#Melt data frame for reshaping
melt_combine_all <- melt(combine_all, id=c("Subject", "Activity"), measure.vars = feature_list)

#Reshape into tidy data frame by mean
final_tidy_data <- dcast(melt_combine_all, Activity + Subject ~ variable, mean)

#Reorder by Subject and Activity
final_tidy_data <- final_tidy_data[order(final_tidy_data$Subject, final_tidy_data$Activity),]

#Reindex 
rownames(final_tidy_data) <- 1:nrow(final_tidy_data)
final_tidy_data <- final_tidy_data[,c(2,1,3:63)]

write.table(final_tidy_data, file = "tidy_data.txt")
