
install.packages("naivebayes")
install.packages("e1071")
library(e1071)
library(naivebayes)
library(caTools)


getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Examen")
getwd()

dataset <- read.csv("Social_Network_Ads.csv")
dataset = dataset[3:5]



set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


mod <- naiveBayes(as.factor(Purchased) ~ ., data = training_set)
mod

pred <- predict(mod, test_set)
matrix <- table(pred,test_set$Purchased)
pred
matrix <- table(pred,test_set$Purchased)
matrix
plot(matrix)