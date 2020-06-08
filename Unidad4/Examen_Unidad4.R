#Get de filepath data
setwd("/Users/fernando/Documents/mineria/mineria_datos/Unidad4")
#returns an absolute filepath representing the current working directory
getwd()
#get .csv file and assigned to dataset
iris <- read.csv("iris.csv")
iris = iris[1:4]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(iris, i)$withinss)


plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = iris, centers = 3)
y_kmeans = kmeans$cluster

# Visualising the clusters
# install.packages('cluster')
library(cluster)
clusplot(iris,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'clouster',
         ylab = 'Petal length')
