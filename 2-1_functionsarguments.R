################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 2.1: Functions and Arguments                                    ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## OBJECTIVE:
## The objective of this excersise is to practice the concepts of 'function' and 
## 'argument', and learn some basic functions in R. 


2 + 3
# This sums 2 and 3. Note the use of the mathematical operator '+'. 
 
## TASK 1: Use the other basic algebraic operators: '-', '*', '/' and '^' to 
## substract, multiply, etc. the values 2 and 3.



sum(2, 3)
# This also sums 2 and 3, note here the use of the function 'sum'.
	
Sum(2, 3)
# The above command should give you an error. This is because R distinguishes 
# lower case from UPPER case; consequently, the function 'sum' is not the same 
# as 'Sum', and in this case 'Sum' does not exist.


10-2/8
# Divides 2 in 8, and then subtracts that value from 10. When presented with 
# multiple operations, R follows the standard of making division and 
# multiplication before summation or subtraction.  

(10-2)/8
# Using the parenthesis, you can specify the order in which operations must be 
# carried out. Operations within parentheses are performed before operations 
# outside parentheses. In this case, the subtraction is done before the division. 

## TASK 2: What is the result of: 5.6 times 11.7, then dividing that value by 3, 
## summing 6.6 to it, and rising that result to 2? Write this operation as a 
## single line of code.

## TASK 3: What is the result of: 5.6 times 11.7, then dividing that value by 3, 
## and to that value sum 6.6 raised to 2? Write this operation as a single 
## line of code.


c("Inga", "punctata")
# Concatenates the characters "Inga" and "punctata" forming a vector of length 2.

## TASK 4: Use the function length to confirm the length of this vector

paste("Inga", "punctata")
# Pastes the characters "Inga" and "punctata" to form a single character string 
# (length = 1) by joining them.

## TASK 5: Use the function length to confirm the length of this vector

## TASK 6: Use the function 'paste' to join together the genus and species of your 
## favorite species. Then, use the function 'paste; to paste together, in this 
## order, the species and genus and family of your favorite species. 


?paste
# Opens the help for the function 'paste'.

## TASK 7: Using the help for this function, identify what is the role of the 
## argument 'sep'.
## TASK 8: Does this argument have a predetermined value? What is that value?
## TASK 9: Use 'paste' to join together the genus and species names of your 
## favorite species using the character '_' to separate the two words.


?rep
# Opens the help for the function rep.

## TASK 10: Read the help for this function, and identify its main arguments.
## TASK 11: Run lines 1 to 9 of the examples in the help page. What is this 
## piece of code doing?


rep(x=c("Pouroma", "minor"), times=7)
rep(x=c("Pouroma", "minor"), each=7)
# Uses the function rep to repeat the information in the argument x. 

## TASK 12: How and why are the results of the two lines above different?
## TASK 13: Create a vector that contains “R is awesome!” 1000 times. If you want, 
## use the function 'rep' to help you complete this task quickly.
## TASK 14: Rewrite the code above in 3 different ways: 
##  1. using the names of the arguments in their predetermined order 
##  2. excluding the names of the arguments 
##  3. changing the order of the arguments 

## TASK 15: What is (are) the problem(s) with the following line of code? Read the 
## error and correct the code. 
Rep(cSocratea exorrhiza), Times=7)


rnorm(n=50)
# Generates a vector that contains 50 random values from a normal distribution.


rnorm(50)
# Also generates a vector that contain 50 random values from a normal distribution. 

## TASK16: According to the help of the function 'rnorm': 
##  1. What other arguments belong to this function?
##  2. What are the predetermined values for these additional arguments?
## TASK 17: Generate a vector of length 25 with random values from a normal 
## distribution with mean 50 and standard deviation 20. 


plot(x=rnorm(50), y=rnorm(50))
# The function plot is used to make many types of figures. In this case, it is 
# used to make  a scatterplot. In the figure, two random variables are plotted 
# against each other. 


A <- rnorm(n=1000, mean=0, sd=1)
B <- rnorm(1000, sd=25, mean=100)
# This creates two vectors with random values taken from a normal distribution 
# and saves then in two objects named A and B. Note the order in the arguments 
# between the two calls to the function rnorm. 


hist(A, col="lightblue")
# Creates a histogram of values in the vector A. 

## TASK 18: Using the help in R, create a histogram of the values in vector B where 
##  1. data is presented in 30 bars,
##  2. bars are red, and 
##  3. the X axis has the name 'Values of random vector B'. 


## TASK 19: Before running the following code, can you predict how the output of 
## the next three commands will be different?
plot(A,  B)
plot(y=A,  x=B)
plot(x=B, y=A)

A <- 1:20 
# Re-rewrites object A, not with the sequence: 1, 2, 3,..., 20.

## TASK 20: Create another object of name 'a' with the same sequence, but use the 
## function 'seq'.

## TASK 21: Create a figure where you relate the values of 'A' with the values of 
## vector 'a' – meaning create a scatterplot. 

## TASK 22: Use the function 'lines' to create line of 1:1 correspondence on top of 
## the scatterplot (origin at 0,0 coordenates and end at 20,20 coords). To 
## create this line, the function will need the X and Y coordinates for a point 
## of departure and a point of arrival. 


## TASK 23: Can you read and understand the code that follows?
pred <- rnorm(250, 40, 10)
resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0)
plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")

## TASK 24: Make a figure similar to the one above, but change (1) the size of the 
## symbols, (2) the type of symbol, and (3) the color of the symbol. 

## TASK 25: If you calculated the average and standard deviation of the values in 
## vector pred, what would you expect? Calculate them using the functions mean 
## and sd and confirm/revise your expectations. 


lm(resp ~ pred)
## The function lm creates linear models. In this case, 'lm' is making a linear 
## OLS regression where  resp is a function of the variable pred. The symbol '~' 
## generally means "is a function of" and is used in formulas. 


summary(object=lm(resp ~ pred))
# The function 'summary' creates, obviously, a summary of the information 
# contained in its 'object' argument. In this case, it provides information for 
# the linear regression between resp and pred. 

## TASK 26: Make a summary of a vector of 300 random values taken from a normal 
## distribution with a mean of -13 and a standard deviation of 5. 




















################################################################################
### TASK SOLUTIONS #############################################################
################################################################################

## TASK 1 ##
2 + 3
2 - 3
2 * 3
2 % 3
2 ^ 3


## TASK 2 ##
((5.6 * 11.7)/3 + 6.6)^2


## TASK 3 ##
(5.6 * 11.7)/3 + 6.6^2


## TASK 4 ##
length(c("Inga", "punctata"))


## TASK 5 ##
length(paste("Inga", "punctata"))


## TASK 6 ##
paste("Chrotopterus", "auritus")


## TASK 7 ##
# sep: a character string to separate the terms.


## TASK 8 ##
# sep = " "


## TASK 9 ##
paste("Chrotopterus", "auritus", sep="_")


## TASK 10 ##
# x, times, length.out, each


## TASK 11 ##
rep(1:4, 2) # Repeat the sequence 1-to-4 2 times 
rep(1:4, each = 2) # Repeat each element in the sequence 1-to-4 2 times
rep(1:4, c(2,2,2,2)) # Repeat each element in the sequence 1-to-4 2 times
rep(1:4, c(2,1,2,1)) # Repeat the first and third element in the sequence 2 times, 
                     # and the second and fourth elements only once
rep(1:4, each = 2, len = 4) # Repeat each element in the sequence 1-to-4 2 times,
                            # but return only the first 4 elements in the result
rep(1:4, each = 2, len = 10) # Repeat each element in the sequence 1-to-4 2 times,
                             # and return 10 elements in the result. 
rep(1:4, each = 2, times = 3) # Repeat each element in the sequence 2 times, THEN
                              # repeat that result 3 times


## TASK 12 ##
rep(x=c("Pouroma", "minor"), times=7) # Repeats the vector 7 times
rep(x=c("Pouroma", "minor"), each=7) # Repeat each element in the vector 7 times


## TASK 13 ##
rep(x="R is awesome", times=1000)


## TASK 14 ##
rep(x="R is awesome", times=1000)
rep("R is awesome", 1000)
rep(times=1000, x="R is awesome")


## TASK 15 ## 
# a. Function is rep not Rep
# b. Function c not followed by (
# c. Socratea and exorriza need to be in between quotation marks
# d. There must be a coma separating the values "Socratea" and "exorrhiza" before
#    concatenating them
rep(c("Socratea", "exorrhiza"), times=7)


## TASK 16 ##
# mean = 0 and sd = 1


## TASK 17 ##
rnorm(n=25, mean=50, sd=20)


## TASK 18 ##
hist(x=B, breaks=30, col="firebrick1", xlab="Values of random vector B")


## TASK 19 ## 
plot(A,  B) # A in x axis, B in y axis
plot(y=A,  x=B) # B in x axis, A in y axis
plot(x=B, y=A) # B in x axis, A in y axis


## TASK 20 ##
a <- seq(from=1, to=20, by=1)


## TASK 21 ##
plot(a, A)


## TASK 22 ##
lines(x=c(1,20), y=c(1,20), col="red")


## TASK 23 ##
pred <- rnorm(250, 40, 10) # Create a vector of 250 random values from a normal 
                           # distribution with mean 40 and standard deviation 10. 
                           # Put that vector into an object named *pred*

resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0) 
                           # 1. Multiply the values in object *pred* by 1.55
                           # 2. To the result above, sum the value 15
                           # 3. Create a vector of 250 random values from a normal 
                           #    distribution with mean 5 and standard deviation 0
                           # 4. Sum the vectors created in steps 3 and 4

plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")
                           # Plot the values in the object *resp* against those 
                           # in object *pred*. Symbol size will be 2. Symbol 
                           # type is 21. Color of the symbol border is grey60.
                           # Color of symbol background is gold


## TASK 24 ##
plot(pred, resp, cex=4, pch=22, col= "white", bg="darkolivegreen")


## TASK 25 ##
# You would expect them to be near 40 and 10 for the mean and sd respectively
mean(pred)
sd(pred)
 

## TASK 26 ##
summary(rnorm(n=300, mean=-13, sd=5))



