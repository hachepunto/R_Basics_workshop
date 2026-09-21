################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-7: Flow control - SOLUTIONS                                   ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## This file holds the solutions to the exercise. It is NOT the file you hand
## in: work on "8-7_flujos_EN.r" and use this one only to check your answers.

## MIND THE WORKING DIRECTORY:
## Even though this file lives in the "soluciones" folder, your working
## directory must be the workshop folder (the one above, which contains
## "Datasets" and "soluciones"). R resolves paths against the working directory,
## not against the location of the file. In RStudio: Session > Set Working
## Directory > Choose Directory, and pick the workshop folder.

if (!file.exists("8-7_flujos_EN.r")) {
  stop("Wrong working directory.\n",
       "  You are in: ", getwd(), "\n",
       "  It should be the workshop folder, the one containing 'Datasets'.")
}

## This line re-runs the exercise, so that every object the solutions need
## exists.
source("8-7_flujos_EN.r")


## TASK 1 ##
# The matrix needs one ROW per bootstrap repetition (that is where each
# iteration writes its result) and one COLUMN per coefficient. A linear model
# with one predictor has two coefficients, intercept and slope, so 2 columns.
# With a single column the line 'Y1.coefficients[i, ] <- ...' would fail,
# because it tries to write two values into one slot.


## TASK 2 ##
# Y1 and Y2 must be resampled INDEPENDENTLY. If both used the same draw, the two
# bootstrap distributions would be correlated by construction and the comparison
# between slopes would be meaningless.


## TASK 3 ##
# Each Y has to travel with its own X. If you paired 'y2.i' with 'x1.i' you
# would be regressing values that never occurred together, destroying the
# relationship you are trying to estimate.


## TASK 4 ##
# Already solved in the body above.


## TASK 5 ##
# Already solved in the body above. The key detail is the index: writing
# 'Y1.coefficients[1, ]' would overwrite the first row on every iteration and
# leave the rest of the matrix full of NAs.


## TASK 6 ##
# The two intervals do not overlap, so we conclude that the slopes really are
# different, which is the right answer: we simulated the data with slopes 4
# and 3.
Y1.CI
Y2.CI


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






 
