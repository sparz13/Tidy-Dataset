This is the ReadMe for the Getting and Cleaning Data Course Project of Coursera. 

Starting with all the files from UCR HAR Dataset I first converged all the files together from the train and test folders of the data.

Once I read them in I read the features.txt in and added that to the column names of the train and testdata.

For the descriptive variable names I left them as the features.txt lines because I felt that characterized them the best and gave it easy understanding. 

Then I converged all the subject and activites to the corresponding places using cbind.

Using Rbind I combined test and train sets and added Activites and Subjects to the first two column names respectively.

With a the combined dataset I extracted the mean and standard deviation by using grep to find the indices of features.txt.

With those indices I subsetted the cmbined dataset.

Then I subbed out the numerical code for the activities column with their actual names. 

Lastly using reshape2 I melted and then downcast the dataset into a second, independent tidy data set with the average of each variable for each activity and each subject.

This tidy data is in line with the four principles of a tidy data set.

Each variable measured does have one column.

Each different observation of that variable should be in different row.

There is only one table for each kind of variable.

I do not have multiple tables so we can disregard the fourth principle as it only applies to multiple tables. 

To read my tidy dataset in here it is:

> data <- read.table("SecondSet", header = TRUE)

> View(data)

Thank you!
