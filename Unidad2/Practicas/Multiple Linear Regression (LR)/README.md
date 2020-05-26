# Practice 2

### Visualize the siple liner regression model with R.D.Spend 


```R
getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Practicas/Practica1")
getwd()

# Importing the dataset
datasetPractice <- read.csv('data.csv')
datasetPractice <- datasetPractice[ -c(1,3:5,7:9,11,12) ]

#Delete NA data
datasetPractice$Age[is.na(datasetPractice$Age)] <- 0
#Set Levels
datasetPractice$Survived = factor(datasetPractice$Survived, levels = c(0, 1))

#View headers
head(datasetPractice)


# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(datasetPractice$Survived, SplitRatio = 0.75)
training_set <- subset(datasetPractice, split == TRUE)
test_set <- subset(datasetPractice, split == FALSE)

# Feature scaling
training_set[, 2:3] <- scale(training_set[, 2:3])
test_set[, 2:3] <- scale(test_set[, 2:3])


# Fitting Logistic Regression to Training set
classifier = glm(formula = Survived ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-1])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 1], y_pred)
cm

# 
library(ggplot2)
ggplot(training_set, aes(x=Age, y= Survived)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Fare, y=Survived)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Survived)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Fare, y=Survived)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualization the Training set result
# install.packages('ElemStatLearn') No work for me, 
# manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20    12M
# Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
X2 = seq(min(set[, 3]) - 1, max(set[, 3]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Fare', 'Age')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -1],
     main = 'Logistic Regression (Training set)',
     xlab = 'Fare', ylab = 'Age',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 1] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
X2 = seq(min(set[, 3]) - 1, max(set[, 3]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Fare', 'Age')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -1],
     main = 'Logistic Regression (Test set)',
     xlab = 'Fare', ylab = 'Age',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 1] == 1, 'green4', 'red3'))
```


### Siple liner regression model with R.D.Spend 


```R
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset )
summary(regressor)

```

### Output

```R
> summary(regressor)

Call:
lm(formula = Profit ~ R.D.Spend, data = dataset)

Residuals:
   Min     1Q Median     3Q    Max 
-34351  -4626   -375   6249  17188 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 4.903e+04  2.538e+03   19.32   <2e-16 ***
R.D.Spend   8.543e-01  2.931e-02   29.15   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 9416 on 48 degrees of freedom
Multiple R-squared:  0.9465,    Adjusted R-squared:  0.9454 
F-statistic: 849.8 on 1 and 48 DF,  p-value: < 2.2e-16
```



