# Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:
#   
# Create an R script that will count how many of these numbers fall between -1 and 1 and divide
# by the total quantity of N
# 
# You know that E(X) = 68.2%
# Check that Mean(Xn)->E(X) as you rerun your script while increasing N
# 
# Hint:
# 1. Initialize sample size

x<-rnorm(50)
y <- dnorm(x,mean = 0, sd = 1)
plot(x,y)
# 2. Initialize counter
count <- 0
Resultado <- 0
# 3. loop for(i in rnorm(size))
for(i in rnorm(50))
{
  count <- count+1
  print(count)
  # 4. Check if the iterated variable falls
  if(i<=1&&i>=-1){
    print(i)
    print("^ este esta entre -1 y 1")
    # 5. Increase counter if the condition is true
    Resultado <- Resultado +1
  }
  else
  {
    print(i)
    print("este no esta en el rango")
  }
}
# 6. return a result <- counter / N
Res <- Resultado/count
print(Res)