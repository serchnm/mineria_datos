# Practice 1

### Change the example dataset done in class


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

### Predicting the Test set results

```R
5   7   8  10  15  21  24  26  31  38  39  40  43  45  53  55  57  58  61  65  75  79  80  83  88  92 
  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
 97  98 100 106 110 111 112 113 115 128 132 136 137 138 139 150 159 161 163 166 169 172 173 177 189 193 
  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
195 196 199 201 205 207 209 210 211 212 213 223 225 232 234 238 253 257 258 259 265 266 268 269 275 278 
  0   1   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   1   1   1   0   0   0   1   0   0 
281 287 289 295 296 299 300 303 306 307 309 316 325 331 334 346 347 348 356 358 362 375 389 390 394 396 
  0   0   0   0   0   0   1   0   1   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0 
406 407 419 423 424 425 429 436 443 446 448 449 454 455 459 460 465 470 480 482 483 484 486 488 490 492 
  0   0   0   0   0   0   0   1   0   1   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0 
493 495 511 516 517 518 523 525 533 538 539 546 561 568 570 571 573 582 583 588 589 594 598 600 603 610 
  0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   1 
613 615 620 621 623 626 629 632 635 641 649 652 658 659 662 665 675 680 682 683 695 703 704 708 712 725 
  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0 
730 733 746 747 749 751 754 764 769 771 773 782 786 791 796 798 799 804 808 813 825 834 840 842 845 850 
  0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1 
853 858 860 862 866 868 872 874 875 879 883 885 886 889 891 
  0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 
```
### Making the Confusion Metrix

```R
   y_pred
      0   1
  0 137   0
  1  67  19
```


### Visualization the Training set result

![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/age.png)

![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/fare.png)


![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/LRTR.png)

![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Practicas/Simple%20Linear%20Regression/LRT.png)


