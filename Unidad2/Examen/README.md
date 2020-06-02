# Exam Unit 2


### Get de filepath data

```R
setwd("PATH_TO_FILE/Unidad2/Examen")
```
### Returns an absolute filepath representing the current working directory

```R

getwd()

```
### get .csv file and assigned to dataset

```R
moviesExam <- read.csv("Project-Data.csv")
```
### Selected only the columns we need and assigned a the new dataset

```R
moviesExam <- moviesExam[c(3, 6, 8, 18)]
```
### Select criteria of  the data we need

```R
genere <- c("action", "adventure", "animation", "comedy", "drama")
studio <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
```
### Install the library

```R
library(ggplot2)
```
### We create  the filter for the only data we need "genre and studio" 

```R
moviesExam <- moviesExam[moviesExam$Genre %in% genere, ]
moviesExam <- moviesExam[moviesExam$Studio %in% studio, ]
```
### To see the first data of the dataset to check the changes we made

```R
head(moviesExam)
```

### Now we can make the first plot with X = genre in de Y = Gross % US and size of dots budget

```R
moviesExam <- ggplot(moviesExam, aes(x=Genre, y=Gross...US, 
                                    size=Budget...mill.))
```

### And the final step we put the color of dots whit the Studio colum and set the size of the lines and alpha 

```R
moviesExam + geom_jitter(aes(color=Studio)) + geom_boxplot(size=.4, alpha=0.5)
```
# Conclusion

### Visualization 

--
![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Examen/plot.png)
--

In this graph you can see the most concentration of Studios it's in the genre of Action in the many of these movies the Budget it's 200 or more, also we can see the higher budget and lower and the studio with more movies its WB


# Exam Unit 3


### Install libraries 
```R
install.packages("naivebayes")
install.packages("e1071")
install.packages("ElemStatLearn")
library(e1071)
library(naivebayes)
library(caTools)
library(ElemStatLearn)
```
### Get de filepath data

```R
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Examen")
```

### Returns an absolute filepath representing the current working directory

```R
getwd()
```
### get .csv file and assigned to dataset

```R
dataset <- read.csv("Social_Network_Ads.csv")

```

#### Selected only the columns we need and assigned a the new dataset

```R
dataset = dataset[3:5]
```


### Encoding the target feature as factor

```R
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```

### Splitting the dataset into the Training set and Test set

```R
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
### Feature Scaling

```R
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
### Fitting Naive Bayes to the Training set

```R
model = naiveBayes(x = training_set[-3], y = training_set$Purchased)
```
### Predict the Test set results - Naive Bayes

```R
pred = predict(model, newdata = test_set[-3])
```

### Confusion Matrix

```R
matrix = table(test_set[, 3], pred)
matrix
```
#### Output

```R
   pred
     0  1
  0 57  7
  1  7 29
```

## Visualising the Training set results - Naive Bayes

```R
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
```

--
![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Examen/NB_Training.png)
--

## Visualising the Test set results - Naive Bayes

```R
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
```
--
![alt text](https://github.com/FerFuentes/mineria_datos/blob/Unidad2/Unidad2/Examen/NB_Test.png)
--
