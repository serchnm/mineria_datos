# Practice 1

### Change the example dataset done in class


```R
getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Practicas/Simple Linear Regression")
getwd()

# Importing the dataset
dataset <- read.csv('data.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Survived, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Survived ~ Fare,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Fare, y=training_set$Survived),
             color = 'red') +
  geom_line(aes(x = training_set$Fare, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Fare vs Survived (Training Set)') +
  xlab('Fare') +
  ylab('Survived')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$Fare, y=test_set$Survived),
             color = 'red') +
  geom_line(aes(x = training_set$Fare, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Fare vs Survived (Test Set)') +
  xlab('Fare') +
  ylab('Survived')
```



### Visualization the Training set result

![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/TrainingSet.png)

![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/TestSet.png)




