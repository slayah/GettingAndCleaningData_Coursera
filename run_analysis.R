library(data.table)
library(reshape2)
library(plyr)
library(dplyr)

X_test<-read.table("dataset/test/X_test.txt")
X_train<-read.table("dataset/train/X_train.txt")
Y_test<-read.table("dataset/test/Y_test.txt")
Y_train<-read.table("dataset/train/Y_train.txt")
features<-read.table("dataset/features.txt")
activities <- read.table("dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))
test_subject_id <- read.table("dataset/test/subject_test.txt")
train_subject_id <- read.table("dataset/train/subject_train.txt")

features<-features$V2
colnames(X_train) <- features
colnames(X_test) <- features
colnames(test_subject_id) <- "subject_id"
colnames(train_subject_id) <- "subject_id"
colnames(Y_test) <- "activity_id"
colnames(Y_train) <- "activity_id"

###########PART 1#####################

X_test <- cbind(test_subject_id , Y_test , X_test)
X_train <- cbind(train_subject_id , Y_train , X_train)
data <- rbind(X_train,X_test)
data <- unique(data)

######################################

###########PART 2#####################

mean_index <- grep("mean",names(data),ignore.case=TRUE)
mean_columns <- names(data)[mean_index]
std_index <- grep("std",names(data),ignore.case=TRUE)
std_columns <- names(data)[std_index]
mean_std<-data[,c("subject_id","activity_id",mean_columns,std_columns)]

######################################

###########PART 3 & 4#####################

mean_std_act <- merge(activities,mean_std,by.x="activity_id",by.y="activity_id",all=TRUE)

######################################

###########PART 5#####################

melt_data <- melt(mean_std_act,id=c("activity_id","activity_name","subject_id"))
mean_data <- dcast(melt_data,activity_id + activity_name + subject_id ~ variable,mean)
write.table(mean_data,"tidy_data.txt",row.names = FALSE)
write.table(colnames(mean_data),"features.txt",row.names = FALSE)

######################################


#head(mean_data)
#head(melt_data)
#colnames(mean_std_act)
#colnames(data)
#nrow(X_train)
#nrow(X_test)
#nrow(data)

#head(test_subject_id)
#head(train_subject_id)
#head(X_train)

#head(Y_train)