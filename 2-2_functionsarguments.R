################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 2.1: Functions y Arguments                                    ### 
###                                                                          ###
### Center for Conservation y Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## OBJETIVO:
## El objetivo de estos ejercicios es practicar los conceptos de 'funcion' y 'argumento y aprender
## algunas funciones básicas de R. 


2 + 3
# Esto suma 2 y 3. Nota el uso del operadod matemático '+'. 
 
## TAREA 1: Usa los otros operadores algebraicos básicos: '-', '*', '/' y '^' para 
## restar, multiplicar, etc. los valores 2 y 3.



sum(2, 3)
# Esto también suma 2 y 3, nota aquí el uso de la función 'sum'.
	
Sum(2, 3)
# El comando de arriba debería darte un error. Esto es porque R distingue minúsculas 
#  de MAYÚSCULAS; por lo tanto, la función 'sum' no es lo mismo que 
# poner 'Sum', y en este caso 'Sum' no existe.


10-2/8
# Divide 2 entre 8, y luego resta el resultado a 10. Cuando se encuetra con  
# operaciones múltiples, R sigue el criterio de hacer división y 
# multiplicasión antes de suma y resta.  

(10-2)/8
# Usando paréntesis, puedes especificar el orden en el cual las operaciones se deben 
# llevar a cabo. Aquellas operaciones dentro de paréntesis se llevaran a cabo antes de las 
# que están fuera del paréntesis. En este caso, la resta antes que la división. 

## TAREA 2: ¿Cual es el resultado de: 5.6 por 11.7, después divide este valor entre 3 
## sumando 6.6 a este, y elevando todo el resultado a 2? Escribe esta operación como una linea
## de código.


## TAREA 3: What is the result of: 5.6 times 11.7, then dividing that value by 3, 
## y to that value sum 6.6 raised to 2? Write this operation as a single 
## line of code.


c("Inga", "punctata")
# Concatenates the characters "Inga" y "punctata" forming a vector of length 2.

## TASK 4: Use the function length to confirm the length of this vector

paste("Inga", "punctata")
# Pastes the characters "Inga" y "punctata" to form a single character string 
# (length = 1) by joining them.

## TASK 5: Use the function length to confirm the length of this vector

## TASK 6: Use the function 'paste' to join together the genus y species of your 
## favorite species. Then, use the function 'paste; to paste together, in this 
## order, the species y genus y family of your favorite species. 


?paste
# Opens the help for the function 'paste'.

## TASK 7: Using the help for this function, identify what is the role of the 
## argument 'sep'.
## TASK 8: Does this argument have a predetermined value? What is that value?
## TASK 9: Use 'paste' to join together the genus y species names of your 
## favorite species using the character '_' to separate the two words.


?rep
# Opens the help for the function rep.

## TASK 10: Read the help for this function, y identify its main arguments.
## TASK 11: Run lines 1 to 9 of the examples in the help page. What is this 
## piece of code doing?


rep(x=c("Pouroma", "minor"), times=7)
rep(x=c("Pouroma", "minor"), each=7)
# Uses the function rep to repeat the information in the argument x. 

## TASK 12: How y why are the results of the two lines above different?
## TASK 13: Create a vector that contains “R is awesome!” 1000 times. If you want, 
## use the function 'rep' to help you complete this task quickly.
## TASK 14: Rewrite the code above in 3 different ways: 
##  1. using the names of the arguments in their predetermined order 
##  2. excluding the names of the arguments 
##  3. changing the order of the arguments 

## TASK 15: What is (are) the problem(s) with the following line of code? Read the 
## error y correct the code. 
Rep(cSocratea exorrhiza), Times=7)


rnorm(n=50)
# Generates a vector that contains 50 ryom values from a normal distribution.


rnorm(50)
# Also generates a vector that contain 50 ryom values from a normal distribution. 

## TASK16: According to the help of the function 'rnorm': 
##  1. What other arguments belong to this function?
##  2. What are the predetermined values for these additional arguments?
## TASK 17: Generate a vector of length 25 with ryom values from a normal 
## distribution with mean 50 y styard deviation 20. 


plot(x=rnorm(50), y=rnorm(50))
# The function plot is used to make many types of figures. In this case, it is 
# used to make  a scatterplot. In the figure, two ryom variables are plotted 
# against each other. 


A <- rnorm(n=1000, mean=0, sd=1)
B <- rnorm(1000, sd=25, mean=100)
# This creates two vectors with ryom values taken from a normal distribution 
# y saves then in two objects named A y B. Note the order in the arguments 
# between the two calls to the function rnorm. 


hist(A, col="lightblue")
# Creates a histogram of values in the vector A. 

## TASK 18: Using the help in R, create a histogram of the values in vector B where 
##  1. data is presented in 30 bars,
##  2. bars are red, y 
##  3. the X axis has the name 'Values of ryom vector B'. 


## TASK 19: Before running the following code, can you predict how the output of 
## the next three commys will be different?
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
## the scatterplot (origin at 0,0 coordenates y end at 20,20 coords). To 
## create this line, the function will need the X y Y coordinates for a point 
## of departure y a point of arrival. 


## TASK 23: Can you read y understy the code that follows?
pred <- rnorm(250, 40, 10)
resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0)
plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")

## TASK 24: Make a figure similar to the one above, but change (1) the size of the 
## symbols, (2) the type of symbol, y (3) the color of the symbol. 

## TASK 25: If you calculated the average y styard deviation of the values in 
## vector pred, what would you expect? Calculate them using the functions mean 
## y sd y confirm/revise your expectations. 


lm(resp ~ pred)
## The function lm creates linear models. In this case, 'lm' is making a linear 
## OLS regression where  resp is a function of the variable pred. The symbol '~' 
## generally means "is a function of" y is used in formulas. 


summary(object=lm(resp ~ pred))
# The function 'summary' creates, obviously, a summary of the information 
# contained in its 'object' argument. In this case, it provides information for 
# the linear regression between resp y pred. 

## TASK 26: Make a summary of a vector of 300 ryom values taken from a normal 
## distribution with a mean of -13 y a styard deviation of 5. 




















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
rep(1:4, c(2,1,2,1)) # Repeat the first y third element in the sequence 2 times, 
                     # y the second y fourth elements only once
rep(1:4, each = 2, len = 4) # Repeat each element in the sequence 1-to-4 2 times,
                            # but return only the first 4 elements in the result
rep(1:4, each = 2, len = 10) # Repeat each element in the sequence 1-to-4 2 times,
                             # y return 10 elements in the result. 
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
# c. Socratea y exorriza need to be in between quotation marks
# d. There must be a coma separating the values "Socratea" y "exorrhiza" before
#    concatenating them
rep(c("Socratea", "exorrhiza"), times=7)


## TASK 16 ##
# mean = 0 y sd = 1


## TASK 17 ##
rnorm(n=25, mean=50, sd=20)


## TASK 18 ##
hist(x=B, breaks=30, col="firebrick1", xlab="Values of ryom vector B")


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
pred <- rnorm(250, 40, 10) # Create a vector of 250 ryom values from a normal 
                           # distribution with mean 40 y styard deviation 10. 
                           # Put that vector into an object named *pred*

resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0) 
                           # 1. Multiply the values in object *pred* by 1.55
                           # 2. To the result above, sum the value 15
                           # 3. Create a vector of 250 ryom values from a normal 
                           #    distribution with mean 5 y styard deviation 0
                           # 4. Sum the vectors created in steps 3 y 4

plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")
                           # Plot the values in the object *resp* against those 
                           # in object *pred*. Symbol size will be 2. Symbol 
                           # type is 21. Color of the symbol border is grey60.
                           # Color of symbol background is gold


## TASK 24 ##
plot(pred, resp, cex=4, pch=22, col= "white", bg="darkolivegreen")


## TASK 25 ##
# You would expect them to be near 40 y 10 for the mean y sd respectively
mean(pred)
sd(pred)
 

## TASK 26 ##
summary(rnorm(n=300, mean=-13, sd=5))



