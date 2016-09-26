################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-7: Flow control                                               ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops "

# One common way to test whether two samples of data come from the same 
# statistical population is non-parametric 'bootstrapping'. This technique uses 
# samples obtained with replacement from empirical data to re-calculate sample 
# statistics, and then create confidence intervals. In this example, we will use 
# a very simple bootstrapping procedure to test whether or not two variables 
# ('Y1 and Y2') have different relationship with a third variable ('X').   



### PART 1. SIMULATING DATA FOR ANALYSES ###

X <- rnorm(100, mean=25, sd=5)
# Creates an object named 'X' with 100 values taken from a normal distribution 
# with mean 25 and standard deviation 5


Y1 <- 2 + 4*X + rnorm(length(X), mean=0, sd=5)
# Creates a variable 'Y1' that is a function of 'X'. This is based on a linear 
# function where the intercept is 2 and slope is 4. 

Y2 <- 10 + 3*X + rnorm(length(X), mean=0, sd=5)
# Creates a variable 'Y2' that is a function of 'X'. This is based on a linear 
# function where the intercept is 10 and slope is 3. 


Y1.X.lm <- lm(Y1~X)
Y1.X.lm

Y2.X.lm <- lm(Y2~X)
Y2.X.lm
# This produces linear models relating the values of 'Y1' and 'Y2' to the values of 'X'.


plot(Y1~X, pch=21, cex=1.5, col="white", bg="olivedrab3", las=1, 
  ylim=range(c(Y1, Y2)))
points(Y2~X, pch=21, cex=1.5, col="white", bg="darkorange", las=1)
# Plots the values of 'Y' agains 'X'. As you can see, Y1~X has a steeper slope 
# (i.e., rises more quickly)



### PART 2. SETTING UP ###

# Often, before starting a loop or a procedure that depends on a loop, it is 
# necessary to define how the loop will work (e.g. the number of iterations), 
# and where the results will be stored 


bootstrap.n <- 9999
# This defines the number of bootstrap samples that will be used


## TASK 1 ##
# Create an empty matrix that will store the coefficients of each repetition of 
# the bootstrapping procedure for the relationship between Y1 and X. It must (1) 
# be named Y1.coefficients, (2) have as many rows as repetitions of the
# bootstrapping, (3) have 2 columns to hold results for the intercept and the 
# slope, and (4) have row names and column names ("Intercept" and "Slope")


Y2.coefficients <- Y1.coefficients
## This creates a similar matrix that will hold results for Y2~X



### PART 3. ONE BOOTSTRAPPING REPETITION ###

# When some code needs to be run multiple times using a loop, it is sometimes 
# easier to start by writing the code as if it was going to be run only once. 
# This section has the code to re-sample the data with replacement, and repeat 
# the linear models with this 'bootstrpped' data.


to.resample.Y1 <- sample(1:length(Y1), replace=TRUE)
# This samples with replacement values from 1 to the length of Y1. In this
# way, it defines which values will be selected with replacement to repeat 
# the linear model. 

## TASK 2 ##
# Write the corresponding line of code for Y2


# Creates new Y and X variables that contain the bootstrapped values. Note that 
# selected values for X must match those selected for Y:
y1.i <- Y1[to.resample.Y1]
x1.i <- X[to.resample.Y1]

## TASK 3 ##
# Write the corresponding lines of code for Y2


# Repeats the linear models with the 'bootstrapped' data
Y1.X.lm.i  <- lm(y1.i~x1.i)
Y2.X.lm.i  <- lm(y2.i~x2.i)


# Saves the 'bootstrapped' coefficients in the first row of the empty matrix
Y1.coefficients[1, ] <- Y1.X.lm.i$coefficients

## TASK 4 ##
# Write the corresponding line of code for Y2



### PART 4. CREATING A BOOTSTRAP PROCEDURE USING A FOR LOOP ###

## TASK 5 ##
## Now that you have and understand the steps that need to take place at each 
## iteration of this randomization procedure, modify the code and place it 
## inside the following 'for loops'. The code needs only minor modifications in 
## this case.

for(i in 1:bootstrap.n)
{
	print(i)

    
    
}



### PART 5. COMPARING THE SLOPES OF Y1 AND Y2 WITH X ###

# Now that you have estimates of the slopes and intercepts from each repetition
# of the bootstrap procedure, you can compare the values obtained for Y1 and for 
# Y2 to see if the test returns the right conclusion. The right conclusion is, 
# of course, 'yes, they are different'. This is so because we created the data,
# by simulation, and know that the coefficients were different. 


## TASK 6 ##
## Use the function quantile to calculate the 2.5% and 97.5% percentiles 
## distributions of bootstrapped values for Y1 and Y2. Put those values into two
## objects named Y1.CI and Y2.CI. These can be used as rought confidence 
## intervals. 

Y1.CI <- quantile(...
Y2.CI <- 

  

par(mfrow=c(1,2))
# Creates a window with panels in 1 row and 2 columns


## TASK 7 ##
## Translate to English (or Spanish) the following lines of code

hist(Y1.coefficients[,"Slope"], main="", xlab="Slope", border="olivedrab3", col=NULL,
  xlim=range(c(Y1.coefficients[,"Slope"], Y2.coefficients[,"Slope"])))
  
hist(Y2.coefficients[,"Slope"], border="darkorange", col=NULL, add=TRUE)

bp.locations <- barplot(c(Y1.X.lm$coefficients[2], Y2.X.lm$coefficients[2]), 
  ylim=c(0, max(c(Y1.coefficients[,"Slope"], Y2.coefficients[,"Slope"]))), 
  col=c("olivedrab3", "darkorange"), border=NA, names=c("Y1", "Y2"), 
  ylab="Slopes (with CIs)")

arrows(x0=bp.locations, y0=c(Y1.CI[1], Y2.CI[1]), y1=c(Y1.CI[2], Y2.CI[2]), 
  x1=bp.locations, angle=90, length=0.1, lwd=2.5, code=3, col=c("grey50"))









################################################################################
### TASK SOLUTIONS #############################################################
################################################################################

## TASK 1 ##
Y1.coefficients <- matrix(NA, nrow=bootstrap.n, ncol=2)
colnames(Y1.coefficients) <- c("Intercept", "Slope")
rownames(Y1.coefficients) <- paste("rand", 1:bootstrap.n, sep="_")


## TASK 2 ##
to.resample.Y2 <- sample(1:length(Y2), replace=TRUE)


## TASK 3 ##
y2.i <- Y2[to.resample.Y2]
x2.i <- X[to.resample.Y2]


## TASK 4 ##
Y2.coefficients[1, ] <- Y2.X.lm.i$coefficients



### PART 4. CREATING A BOOTSTRAP PROCEDURE USING A FOR LOOP ###

## TASK 5 ##
for(i in 1:bootstrap.n)
{
  print(i)

  # Samples with replacement
	to.resample.Y1 <- sample(1:length(Y1), replace=TRUE)
  to.resample.Y2 <- sample(1:length(Y2), replace=TRUE)

  
  # Creates bootstraped Y and X vectors
  y1.i <- Y1[to.resample.Y1]
  x1.i <- X[to.resample.Y1]

  y2.i <- Y2[to.resample.Y2]
  x2.i <- X[to.resample.Y2]
  
  
  # Repeats regressions
  Y1.X.lm.i  <- lm(y1.i~x1.i)
  Y2.X.lm.i  <- lm(y2.i~x2.i)

  
  # Saves coefficients
  Y1.coefficients[i, ] <- Y1.X.lm.i$coefficients # Note the use of 'i' here
  Y2.coefficients[i, ] <- Y2.X.lm.i$coefficients  
}


## TASK 6 ##
Y1.CI <-  quantile(Y1.coefficients[,"Slope"], probs=c(0.025, 0.975) )
Y2.CI <-  quantile(Y2.coefficients[,"Slope"], probs=c(0.025, 0.975) )

  

## TASK 7 ##
hist(Y1.coefficients[,"Slope"], main="", xlab="Slope", border="olivedrab3", col=NULL,
  xlim=range(c(Y1.coefficients[,"Slope"], Y2.coefficients[,"Slope"])))
  # Create a histogram of the values in the column named "Slope" of the object
  # 'Y1.coefficients'. Use for the limits in the x axis the range of values of 
  # the columns named "slope" in objects 'Y1.coefficients' and 'Y2.coefficients'
  
hist(Y2.coefficients[,"Slope"], border="darkorange", col=NULL, add=TRUE)
  # Add a histogram of the values in the column named "Slope" of the object
  # 'Y2.coefficients'. 

bp.locations <- barplot(c(Y1.X.lm$coefficients[2], Y2.X.lm$coefficients[2]), 
  ylim=c(0, max(c(Y1.coefficients[,"Slope"], Y2.coefficients[,"Slope"]))), 
  col=c("olivedrab3", "darkorange"), border=NA, names=c("Y1", "Y2"), 
  ylab="Slopes (with CIs)")
  # Create a barplot using the second element in the vectors Y1.X.lm$coefficients
  # and Y2.X.lm$coefficients. These correspond to the empirical slopes of the
  # regressions. Save the location of the bars in an object named "bp.locations"

arrows(x0=bp.locations, y0=c(Y1.CI[1], Y2.CI[1]), y1=c(Y1.CI[2], Y2.CI[2]), 
  x1=bp.locations, angle=90, length=0.1, lwd=2.5, code=3, col=c("grey50"))
  # Create arrows centered on "bp.locations" and that use Y1.CI and Y2.CI to 
  # define the endpoints of the arrows. This depicts the confidence limits. 






 
