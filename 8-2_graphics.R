################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8.1: Graphics                                                   ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## TASK 1 ##
# Load Edgar Anderson's Iris data 


# The following arguments are described in the help page of function 
# "plot.default": xlim, ylim. Use both arguments to tinker with this code and 
# the resulting graph showing morphological variables for Edgar Anderson's Iris 
# species:

plot(iris$Petal.Width, iris$Sepal.Width)


## TASK 2 ##
# Go to the help page for function plot and read the information on these six 
# arguments: type, main, sub, xlab, ylab, asp. Use that information to modify 
# the code above using each of the five arguments. 


## TASK 3 ##
#Consider this change to the code in TASK 2:

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19)

# note the use of argument "bty". Go to the help page for "par" and read about 
# this argument. Change the value given to argument bty in the code above to see 
# what the result is for each posible value of "bty".


## TASK 4 ##
# The follwing code differs from the code provided in TASK 3 only in the 
# use of argument "type":

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19, type="n")

# Read about argument "type" in the help page for "plot" to learn what happened. 
# Then use the code above as a starting point to graph the relationship between 
# sepal width and petal width showing each species with a different symbol and 
# color. See in page 44 of "R for beginners" the list of symbols available 
# through the argument "pch". See also the description of argument "pch" in the 
# help page for function par. To see a list of available colors type "colours()". 
# To complete this TASK you may want to use function "points" and your 
# indexing skills.


## TASK 5 ##
# Add a nice legend to the plot you created in TASK 4, using function 
# "lengend". Learn about this function visiting the respective help page.


## TASK 6 ##
#Examine the data on sepal length and petal width using this code:

summary(iris$Sepal.Length)
summary(iris$Petal.Width)

# Consider carefully the following code. It preduces histograms of sepal length 
# and petal width in the same graph:

hist(iris$Sepal.Length, breaks=seq(0,8,0.5), col="gray70", border="gray40", 
    xlab="", ylab="", main="", xaxt="n", yaxt="n", ylim=c(0,40))
par(new=T)
hist(iris$Petal.Width, breaks=seq(0,8,0.5), density=30, xlab="", ylab="", 
    main="", xaxt="n", yaxt="n", ylim=c(0,40))

# Read in the help page for funtion "par" the information on argument "new". 
# Use functions "axis", "mtext" and "legend" to add axes, axis titles and a 
# legend, respectively.


## TASK 7 ##
# The graph you created in TASK 5 may have one problem: the y axis is too 
# short and cuts one of the histogram bars. Modify the values on the argument 
# "ylim" to fix this first problem. There may be a second problem: the label of 
# the vertical axis may be cut. Use argument "mar" of function "par" to fix this 
# second problem. Read about argument "mar" in the help page of function "par".






