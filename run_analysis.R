#	Getting and Cleaning Data Course Project

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Read data files into memory for processing.
# Note: This step assumes that the project data has been downloaded and 
# extracted to the "./UCI HAR Dataset" directory. 

	trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
	trainY <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
	trainX <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
	testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
	testY <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
	testX <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
	features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
	activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

# Review uploaded data
	dim(trainSub); dim(trainY); dim(trainX)
	dim(testSub); dim(testY); dim(testX)
	dim(features); dim(activityLabels)

# 1. Merge files
	subjects <- rbind(trainSub,testSub)
	allY <- rbind(trainY,testY)
	allX <- rbind(trainX,testX)
	
	dim(subjects); dim(allY); dim(allX)				# show dimension
	rm(trainSub,testSub,trainY,testY,trainX,testX)	# remove old files

# 2. Extract measurements on the mean and standard deviation 
# I do the extraction if the word is in any part of the label.
	tmp <- sort(c(grep("mean",features[,2]),grep("std",features[,2])))
	features_sel <- features[tmp,]
	allX_sel <- allX[,features_sel[,2]]
	colnames(allX_sel) <- features_sel$V2		# names to variables
	
	dim(features_sel); dim(allX_sel)			# show dimension
	rm(tmp,features,allX,features_sel)			# remove old files

# 3. Uses descriptive activity names to name the activities in the data set
	alldata <- cbind(subjects, allY, allX_sel)
	alldata[,2] <- factor(alldata[,2], labels=activityLabels$V2)
	
	rm(subjects,allY,allX_sel,activityLabels)	# remove old files

# 4. Appropriately labels the data set with descriptive activity names. 
	colnames(alldata)[1:2] <- c("Suject", "Activity")
	
	dim(alldata); alldata[1:3,1:5]				# check file

# 5. Creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 
	average <- aggregate(alldata[,3:ncol(alldata)],
						list(alldata$Activity,alldata$Suject),
						mean)
	colnames(average)[1:2] <- c("Activity","Subject")	# recovers names
	write.table(average, "average.txt", row.name=FALSE)
	
	dim(average); average[1:8,1:4]				# = 30 subjects, 6 activities
	
