# Practice 3

### Analise the follow atomation backwardElimination function


```R
# Homework analise the follow automation backwardElimination function 
backwardElimination <- function(x, sl) {
  #Set the length of vectors of R object for which a method has been defined.
  numVars = length(x)
  #Go to de first colum to last colum 
  for (i in c(1:numVars)){
    #Building the optimal mode this it uses all columns
    regressor = lm(formula = Profit ~ ., data = x)
    #Extracts model coefficients from objects 
    #Pr(>|t|) gives you the p-value for that t-test (the proportion of the t distribution at that df which is greater than the absolute value of your t statistic).
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    #
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    #Return the last numbers of columns to continue the loop
    numVars = numVars - 1
  }
  #model fitting Returned
  return(summary(regressor))
}
```
