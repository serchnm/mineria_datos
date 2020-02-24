# mineria_datos

#Practice_1


#Practice_2
#Find 20 more functions in R and make an example of it.

#1 builtins() shows all the functions already in the system
builtins()

#2 cat prints the argument
x = "Hola"
cat(x)

#3 c is a generic function which combines its arguments
a = c(1:5,67,"next",3.1415)
a

#4 length return the number of elements in vector
length(a)

#5 append adds elements to a vector
append(a,15:20,after=length(a))

#6 range returns the minimun and the maximum of x
z <-  c(1:6,8,25:42)
range(z)

#7 paste concatenates vectors after to converting to characters
paste(1:12)

#8 sign returns the signs of the corresponding elements
sign(-2:3)

#9 sort Sorts the elements of a vector
sort(z)

#10 seq Creates a sequence (1 -> 10, spaced by 0.4)
seq(1,10,0.5)

#11 rev lists the elements of "z" in reverse order
rev(z)

#12 sequence Creates a vector of sequence
v <- sequence(c(1:10))

#13 identical tests if two objects are exactly equal
identical(1,"1") #False
identical(1,1) #True

#14 tolower, toupper converts string to lower/upper case letters
tolower("STRING")
toupper("string")

#15 order returns a sorted list of elements in vector
order(z)

#16 Get the value of the environment variable "x"
Sys.getenv(x)

#17 Sys.time Returns system time
Sys.time()

#18 Sys.Date return system date
Sys.Date()

#19 getwd Returns the working directory
getwd()

#20 setwd Sets the working directory
setwd(dir = '/home/saulsp96/Documents/mineria_datos/Unidad1')



#Practice_3
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, digits = 2)
tax 

#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin

#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M