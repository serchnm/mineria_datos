# Examen


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
### Make the filter only need the "genere and studio" we selected 

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

In this graph you can see the most of concentration of Studios it's in the genre of Action in the many of these movies the Budget it's 200 or more, also we can #see the higher budget and lower and the studio with more movies its WB
