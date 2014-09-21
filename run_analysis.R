main <- function(){
# Source dplyr package
library(dplyr)

# Loads all the data components into the environment
x_test <- read.table("test/X_test.txt")
x_train <- read.table("train/X_train.txt")
names <- read.table("features.txt")
activities <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))
subjects <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))

# Adjusts the name of the subjects dataframe
colnames(subjects) <- "subject"

# Adds descriptive names for the activities
toconv <- read.table("activity_labels.txt")
colnames(activities) <- "activity"
mutate(activities, activity=toconv[activity,2])

# Function merges all previous bits of data into one frame.  
# See image from forum for better idea of what this looks like.
assembleData <- function(x_test, x_train, names, subjects, activities){
  df <- rbind(x_train, x_test)
  colnames(df) <- names[,2]
  df <- cbind(subjects, activities, df)
  df
}
assembleData(x_test, x_train, names, subjects, activities)

# Determines columns of interest and moves them into a new df, subset
gamma <- union(grep("mean", colnames(df)), grep("std", colnames(df)))
subset <- df[,c(562, 563, gamma)]

# Fixes subset's ugly column names
names(subset) <- gsub("\\(\\)", "", names(subset),)
names(subset) <- gsub("-", "", names(subset),)
names(subset) <- gsub("BodyBody", "Body", names(subset),)
names(subset) <- gsub("mean", "Mean", names(subset),)
names(subset) <- gsub("std", "Std", names(subset),)

# Writes to a file
write.table(subset, file="tidy.txt", row.names=FALSE)
}

main()
