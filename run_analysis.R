## Starting from the UCI HAR Dataset 2 as the working directory
## Reading in all of the Test Pieces of the Dataset

test_subjects <- read.table("test/subject_test.txt")
test_activities <- read.table("test/y_test.txt")
test_data <- read.table("test/X_test.txt")

## Reading in all of the Train Pieces of the Dataset

train_subjects <- read.table("train/subject_train.txt")
train_activities <- read.table("train/y_train.txt")
train_data <- read.table("train/X_train.txt")

## Reading in the features.txt

features <- read.table("features.txt")

## Combining the Train Dataset together

colnames(train_data) <- features[,2]
train <- cbind(train_activities, train_subjects, train_data)

## Combining the Test Dataset together

colnames(test_data) <- features[,2]
test <- cbind(test_activities, test_subjects, test_data)

## Combining both sets to one and adding names of first two columns

dataset <- rbind(train, test)
names(dataset)[1] <- "Activities"
names(dataset)[2] <- "Subjects"

## Taking a vector of all mean + standard deviation measurements
## Add 2 to account for activities and subjects columns 

vec<- grep("mean\\(\\)|std\\(\\)", features[,2]) + 2

## Extracting measurements of the mean and standard deviation

dat <- dataset[, c(1,2,vec)]


## Naming all the Activity names using sub

dat$Activities <- sub(1, "WALKING", dat$Activities)
dat$Activities <- sub(2, "WALKING_UPSTAIRS", dat$Activities)
dat$Activities <- sub(3, "WALKING_DOWNSTAIRS", dat$Activities)
dat$Activities <- sub(4, "SITTING", dat$Activities)
dat$Activities <- sub(5, "STANDING", dat$Activities)
dat$Activities <- sub(6, "LAYING", dat$Activities)

## creating the second data set must use reshape2 
datmelt <- melt(dat, id=c("Activities", "Subjects"), measure.vars = 
                        names(dat[,3:length(dat)]))

tidy <- dcast(datmelt, Activities + Subjects ~ variable,mean)
