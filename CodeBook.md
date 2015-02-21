#Project codebook

####This codebook describes the data, variables and transformation used/done within the run_analysis.R file in this repo

#Data used

####The data used is
[Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "Datasetzip")

This zip file construction is as following

####Main folder files

*  README file
*  Features info
*  Features
*  activity_labels

	####Subfolder "test"
	* subject_test
	* X_test
	* Y_test
	* Inertial Signals folder

	####Subfolder "train"
	* subject_train
	* X_train
	* Y_train
	* Inertial Signals folder

The readme file and the features info file describe the full data in the zip file. The "Inertial Signal" folders are not used.

#Transformations applied to the original data set

1) The data, subjects and activity label values are merged individual and than the three are combined.

2) The activity labels are transformed to descriptive values.

3) The columns which concern a standard deviation, a average, a activity and a subject number are individually extracted from the set and combined together.

4) This new data set is molten and casted in such way that the final dataframe shows

Subject / Activity / Variable / Value

-> The varialbe is the standard deviation or mean variable from the original set.

-> The value is the mean of each per activity per subject.

#Variables used:
wd -> initial working directory

xtrain -> training data set

ytrain -> training data label values

strain -> training subject numbers

xtest -> test data set

ytest -> test data label values

stest -> test subject numbers

xmerged -> merged data set

feat -> name list of variable of the data set

ymerged -> merged labels

smerged -> merged subject numbers

act -> activity labels

colstd -> subsetted standarddeviation columns from the main set

colmean -> subsetted mean columns from the main set

colMean -> subsetted Mean (with capital M) columns from the main set

activities -> subsetted activities column from the main set

subjects -> subsetted subjects column from the main set

DFsub -> dataframe with all the subsetted columns combined

DFmelt -> molten dataframe of the subsetted columns

SubActVarMean -> dcasted the molten dataframe in such way that the data is ordered by subject number, activity and mean of the other columns (extracted means and std's of the original data set)
