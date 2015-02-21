# load packages and save main directory
library (plyr)
library (reshape2)
wd <- getwd()

# load training data
setwd("train")
xtrain <- read.table("x_train.txt")
ytrain <- read.table("y_train.txt")
strain <- read.table("subject_train.txt")

# load test data
setwd(wd)
setwd("test")
xtest <- read.table("x_test.txt")
ytest <- read.table("y_test.txt")
stest <- read.table("subject_test.txt")

# merge test and training data
xmerged <- rbind(xtest, xtrain)

# load features data and apply on data set
setwd(wd)
feat <- read.table("features.txt")
colnames(xmerged) <- feat$V2

# merge label data and apply on data set
ymerged <- rbind(ytest, ytrain)
act <- read.table("activity_labels.txt")
ymerged$V1 <- as.factor(ymerged$V1)
levels(ymerged$V1) <- act$V2
xmerged[,"activity"] <- ymerged

# merge subject data and apply on data set
smerged <- rbind(stest, strain)
xmerged[,"subject"] <- smerged

# subsettting and writing to txt file
colstd<-xmerged[,grep('std',names(xmerged))]
colmean<-xmerged[,grep('mean',names(xmerged))]
colMean<-xmerged[,grep('Mean',names(xmerged))]
activities<-xmerged[,grep('activity',names(xmerged))]
subjects<-xmerged[,grep('subject',names(xmerged))]
DFsub <- cbind(colmean, colMean, colstd, activities, subjects)
DFmelt <- melt(DFsub, id.vars=c("subjects", "activities"), value.name="value")
SubActVarMean <- dcast(DFmelt, subjects+activities ~ variable, mean)
write.table(SubActVarMean, "analysis.txt", row.name=FALSE, sep="\t")

# clean environment
rm(wd)
rm(xtrain)
rm(ytrain)
rm(xtest)
rm(ytest)
rm(xmerged)
rm(feat)
rm(ymerged)
rm(smerged)
rm(act)
rm(colstd)
rm(colmean)
rm(colMean)
rm(stest)
rm(strain)
rm(DFmelt)
rm(DFsub)
rm(SubActVarMean)
rm(activities)
rm(subjects)