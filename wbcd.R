setwd("D:/ML/R/KNN")
#library(readr)
wbcd <- read.csv(file.choose())

View(wbcd)
str(wbcd)
dim(wbcd)
class(wbcd)
# Id column can be removed 
wbcd <- wbcd[-1]
dim(wbcd)
# count of types of cancer 


table(wbcd$diagnosis)
str(wbcd$diagnosis)
# Converting the diagnosis into factor and assigning M as Malignant and B as Benign
wbcd$diagnosis <- 
  factor(wbcd$diagnosis,levels = c("B","M"),labels = c("Benign","Malignant"))
# count of B and M
table(wbcd$diagnosis)
# Proportions of B and M
round(prop.table(table(wbcd$diagnosis))*100,digits=2)
357/569
# rest of the data contains 3 different measures of 10 characteristics
summary(wbcd[c("radius_mean","area_mean","smoothness_mean")])
# From the above data it seems that area will show more influence than smoothness. So we will normalize the data
# Rather than applying each element individually we will use "lapply()" function in R which 

wbcd_n <- as.data.frame(scale(wbcd[,2:31]))
class(wbcd_n)

summary(wbcd_n[c("radius_mean","area_mean","smoothness_mean")])

# for predicting the accuracy of the model we will first split the data into training and testing 
# training - 469 and test data contains -100 data
# [ row column ] <- syntax

X_train <- wbcd_n[1:469,]

dim(X_train)
X_test <- wbcd_n[470:569,]
dim(X_test)

# we will exclude the target variables from training and test data sets. For training we need to store
# these into factor vectors



Y_train <- wbcd[1:469,1]
Y_train <- as.data.frame(Y_train)
Y_train <- as.factor(Y_train[[1]])
class(Y_train)
str(Y_train)
Y_test <- wbcd[470:569,1]
Y_test <- as.data.frame(Y_test)
Y_test<-as.factor(Y_test[[1]])
dim(Y_test)
class(Y_test)
str(Y_test)
# class package for classification which is a k-nn implementation and we will use knn() to to implement
# knn algorithm. knn() takes 4 parameters - train,test,class,k
library(class)
knnmodel <- knn(X_train,X_test,Y_train,k=10) # sqrt(469) generalized k-value odd number 
#knn(input_train,input_test,output_train,k=12)

knnmodel # PV
Y_test # AV
class(knnmodel)
# choosing an odd number elimates the chance of getting tie

# evaluating the model performance
# wbcd_test_pred vector should match with wbcd_test_labels
# By crosstable function from gmodels package
library(gmodels)
# cross table
CrossTable(Y_test, knnmodel)
knnmodel <- knn(X_train,X_test,Y_train,k=5) # sqrt(469) generalized k-value odd number 
mean(Y_test== knnmodel)

