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