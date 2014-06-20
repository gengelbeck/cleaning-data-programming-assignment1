## 0. Load the training and the test sets to create two data sets.

# Set the working directory
# setwd("project")

# Get the file with the measure names
measure_names <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/features.txt", quote="\"")
names(measure_names) <- c("index", "name")
measure_names$name <- as.character(measure_names$name)

# Create the subject, test, and activity datasets
#-- Load the data
pid_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", col.names="pid")
activity_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", col.names="activity")
measures_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", col.names=measure_names$name)



#- Combine the dataframes
test_ds <- cbind(pid_ds, activity_ds, measures_ds)

# Remove un-needed dataframes
rm(pid_ds); rm(activity_ds); rm(measures_ds)

# Create the training dataset
#-- Load the training datasets 
pid_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", col.names="pid")
activity_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", col.names="activity")

# Set check.names = FALSE to preserve traceability to the orginal data set.   
measures_ds <- read.table("UCI.HAR.Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", col.names=measure_names$name)

#- Combine the dataframes
train_ds <- cbind(pid_ds, activity_ds, measures_ds)

# Remove un-needed dataframes
rm(pid_ds); rm(activity_ds); rm(measures_ds); rm(measure_names)

## 1. Merge the training and the test sets to create one data set.

# We should only need to append the two data frames
# ds1 <- rbind(train_ds, test_ds)

# Since the assignment says "merge", we will "merge" the dataframes
# We need to set all=TRUE since the pids may not overlap between the files.
ds <- merge(train_ds, test_ds, by = intersect(names(train_ds), names(test_ds)), all=TRUE)

# remove the the test and train dataframes
rm(train_ds); rm(test_ds)

# 2. Extract only the measurements on the mean and standard deviation for each measurement (observation)

#- Create a names dataframe to Extract the measures we want
anames <- data.frame(names(ds))
names(anames) <- c("name")
anames$name <- as.character(anames$name) # Change anames$name to a character from a factor


#- Create a column to record the data we wish to keep. Intialize it to false.
anames$keep <- FALSE

#- Keep the pid for each row
anames$keep[anames$name == "pid"] <- TRUE

#- Keep the activity for each row
anames$keep[anames$name == "activity"] <- TRUE

#- Keep the means
anames$keep[grep('\\.mean\\.', anames$name)] <- TRUE

#- Keep the statdard deviations
anames$keep[grep('\\.std\\.', anames$name)] <- TRUE

#- Simplify the dataframe to pid, .mean., .std. variables
ds <- ds[,anames$name[anames$keep]]


# 3. Uses descriptive activity names to name the activities in the data set
#-- 1 WALKING
#-- 2 WALKING_UPSTAIRS
#-- 3 WALKING_DOWNSTAIRS
#-- 4 SITTING
#-- 5 STANDING
#-- 6 LAYING
ds$activity[ds$activity == 1] <- "walking"
ds$activity[ds$activity == 2] <- "walking_upstairs"
ds$activity[ds$activity == 3] <- "walking_downstairs"
ds$activity[ds$activity == 4] <- "sitting"
ds$activity[ds$activity == 5] <- "standing"
ds$activity[ds$activity == 6] <- "laying"

# make activity a factor
ds$activity <- as.factor(ds$activity)

# 4. Appropriately label the data set with descriptive activity names.
# I think I have done this using the measure names from the orginal dataset.
# The measure names could be clearer, but they are documented and leaving them makes tracability easier.


# 5. Create a second, independent tidy data set with the mean of each variable for each activity and each subject.
nds <- aggregate(ds[,3:3:length(ds)], by=list(pid = ds$pid,activity = ds$activity), FUN=mean)
for (name in 3:length(names(nds))) {
  names(nds)[name] <- paste0("mean.",names(nds)[name],))
}
# 5. Create a tidy dataset for the means of the variables as a tab-delimited data file.
write.table(nds, file="har_activities_summary.txt", sep="\t")

