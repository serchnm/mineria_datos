getwd()
setwd("/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/MachineLearning/MultipleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )

summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Assigment: visualize the siple liner regression model with R.D.Spend 

# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred

?summary

# Homework analise the follow automation backwardElimination function 
backwardElimination <- function(x, sl) {
  #Set the length of vectors of R object for which a method has been defined.
  numVars = length(x)
  #Go to de first colum to last colum 
  for (i in c(1:numVars)){
    #Building the optimal mode use all colums
    regressor = lm(formula = Profit ~ ., data = x)
    #Extracts model coefficients from objects 
    #Pr(>|t|) gives you the p-value for that t-test (the proportion of the t distribution at that df which is greater than the absolute value of your t statistic).
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    #
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    #Return the  last numbers of colums to continue de loop
    numVars = numVars - 1
  }
  #Return model fitting 
  return(summary(regressor))
}

SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
#This functions need the data and 
backwardElimination(training_set, SL)
