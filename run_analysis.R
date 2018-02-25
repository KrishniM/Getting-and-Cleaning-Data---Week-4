#extract the data
setwd("C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset")
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt"
X_train <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Y_train.txt"
Y_train <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt"
subject_train <- read.table(subject_train)
subject_train <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt"
subject_test <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt"
X_test <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Y_test.txt"
Y_test <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\features.txt"
variable_names <- read.table(URL)
URL <- "C:\\R\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt"
activities <- read.table(URL)
#
#
# merge data
x_data <- rbind(X_train, Y_train)
x_data <- rbind(X_train, X_test)
y_data <- rbind(Y_train, Y_test)
subject_data <- rbind(subject_train, subject_test)
#
#std dev
std_dev <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
x_data <- x_data[,std_dev[,1]]
colnames(y_data) <- "activity"
y_data$activityName <- factor(y_data$activity, labels = as.character(activities[,2]))
activityNames <- y_data[,-1]
colnames(x_data) <- variable_names[std_dev[,1],2]
colname (subject_data) <- "subject"
colnames (subject_data) <- "subject"
all_data <- cbind(x_data1, activityNames,subject_data)
mean_calc <- all_data %>% group_by(activityNames,subject) %>% summarize_all(funs(mean))
write.table(mean_calc,"tidydata.txt", row.names =  FALSE, col.names =  TRUE)
