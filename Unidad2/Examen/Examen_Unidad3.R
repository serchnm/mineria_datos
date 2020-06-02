#Install libraries 
install.packages("naivebayes")
install.packages("e1071")
install.packages("ElemStatLearn")
library(e1071)
library(naivebayes)
library(caTools)
library(ElemStatLearn)


getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Examen")
getwd()

dataset <- read.csv("Social_Network_Ads.csv")
dataset = dataset[3:5]


# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))


# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


# Fitting Naive Bayes to the Training set
model = naiveBayes(x = training_set[-3], y = training_set$Purchased)

#Predict the Test set results - Naive Bayes
pred = predict(model, newdata = test_set[-3])

#Confusion Matrix
matrix = table(test_set[, 3], pred)
matrix

#Visualising the Training set results - Naive Bayes


X1 = seq(min(training_set[, 1]) - 1, max(training_set[, 1]) + 1, by = 0.01)
X2 = seq(min(training_set[, 2]) - 1, max(training_set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
# just giving a name to the X and Y 
colnames(grid_set) = c('Age', 'EstimatedSalary')

# here we use the classifier to predict the result of each of each of the pixel bits noted above
y_grid = predict(model, newdata = grid_set)

#plot the actual data 
plot(training_set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2)) # this bit creates the limits to the values plotted this is also a part of the MAGIC as it creates the line between green and red
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
# here we run through all the pred data and use if else to color the dots
# note the dots are the real data, the background is the pixel by pixel determination of y/n
# graph the dots on top of the background give you the image
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(training_set, pch = 21, bg = ifelse(training_set[, 3] == 1, 'green4', 'red3'))



X1 = seq(min(test_set[, 1]) - 1, max(test_set[, 1]) + 1, by = 0.01)
X2 = seq(min(test_set[, 2]) - 1, max(test_set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)
plot(test_set[, -3], main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(test_set, pch = 21, bg = ifelse(test_set[, 3] == 1, 'green4', 'red3'))

