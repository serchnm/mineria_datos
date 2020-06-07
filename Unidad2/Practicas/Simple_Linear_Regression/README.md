# Practice 1

### Change the example dataset done in class

In this example can you see the prediction of the persons who survived in Titanic depending on the Fare buyed

```R
getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Practicas/Simple Linear Regression")
getwd()
```

### Importing the dataset
```R
dataset <- read.csv('data.csv')
```
### Splitting the dataset into the Training set and Test set and Install.packages('caTools')

```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Survived, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

### Fitting Simple Linear Regression to the Training set

```R
regressor = lm(formula = Survived ~ Fare,
               data = dataset)
summary(regressor)
```

### Predicting the Test set results

```R
y_pred = predict(regressor, newdata = test_set)
```

### Visualising the Training set results

```R
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Fare, y=training_set$Survived),
             color = 'red') +
  geom_line(aes(x = training_set$Fare, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Fare vs Survived (Training Set)') +
  xlab('Fare') +
  ylab('Survived')
```

### Visualising the  results
```R
ggplot() +
  geom_point(aes(x=test_set$Fare, y=test_set$Survived),
             color = 'red') +
  geom_line(aes(x = training_set$Fare, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Fare vs Survived (Test Set)') +
  xlab('Fare') +
  ylab('Survived')
```



### Visualization 

--
![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple_Linear_Regression/TrainingSet.png)
--
![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple_Linear_Regression/TestSet.png)
--



