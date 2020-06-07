#Get de filepath data
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Examen")
#returns an absolute filepath representing the current working directory
getwd()
#get .csv file and assigned to dataset
moviesExam <- read.csv("Project-Data.csv")


#Selected only the columns we need and assigned a the new dataset
moviesExam <- moviesExam[c(3, 6, 8, 18)]
#Select criteria of  the data we need
genere <- c("action", "adventure", "animation", "comedy", "drama")
studio <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
movies$Year <- factor(movies$Year)


#Install the library
library(ggplot2)
#Make the filter only need the "genere and studio" we selected 
moviesExam <- moviesExam[moviesExam$Genre %in% genere, ]
moviesExam <- moviesExam[moviesExam$Studio %in% studio, ]

moviesExam$Genre <- factor(moviesExam$Genre)
moviesExam$Studio <- factor(moviesExam$Studio)

#To see the first data of the dataset to check the changes we made
head(moviesExam)

#Now we can make the first plot with X = genre in de Y = Gross % US and size of dots budget
moviesExam <- ggplot(moviesExam, aes(x=Genre, y=Gross...US, 
                                    size=Budget...mill.))

#And the final step we put the color of dots whit the Studio colum and set the size of the lines 
#and alpha 
moviesExam + geom_jitter(aes(color=Studio)) + geom_boxplot(size=.4, alpha=0.5)

#In this graph you can see the most of concentration of Studios it's in the genre of Action
#in the many of these movies the Budget it's 200 or more, also we can #see the higher budget and lower and the studio with more movies its #WB