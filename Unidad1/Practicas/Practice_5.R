#Practice 5 Filter the requested data using the Demographic CSV file 

#Setting the working directory
setwd('/home/saulsp96/Documents/DataMining-master/DataMining-master/Dataframes')
#Print the working directory
getwd()
#Removes the stats object
rm(stats)
#Import the data from the CSV file to the stats val
stats <- read.csv("Demographic-Data.csv")

#Practice 

#Filter countries by Low income 
stats[stats$Income.Group == "Low income",] 

#Filter countries by Lower middle income 
stats[stats$Income.Group == "Lower middle income",]

#Filter countries by Upper middle income 
stats[stats$Income.Group == "Upper middle income",] 

#Filter by countrie Malta 
stats[stats$Country.Name == "Malta",]

#Filter by countrie Qatar 
stats[stats$Country.Name == "Qatar",] 

#Filter by countrie Netherlands 
stats[stats$Country.Name == "Netherlands",] 

#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]
