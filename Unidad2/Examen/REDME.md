
```R
getwd()
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad2/Examen")
getwd()

moviesExam <- read.csv("Project-Data.csv")



moviesExam <- moviesExam[c(3, 6, 8, 18)]
genere <- c("action", "adventure", "animation", "comedy", "drama")
studio <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")
head(moviesExam)
library(ggplot2)

moviesExam <- moviesExam[moviesExam$Genre %in% genere, ]
moviesExam <- moviesExam[moviesExam$Studio %in% studio, ]

moviesExam <- ggplot(moviesExam, aes(x=Genre, y=Gross...US, 
                                    size=Budget...mill.))


moviesExam + geom_jitter(aes(color=Studio)) + geom_boxplot(size=.4, alpha=0.5)
```
