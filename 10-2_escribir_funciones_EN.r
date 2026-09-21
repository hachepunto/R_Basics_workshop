################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 10-2: Writing your own functions                                ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################


## TASK 1 ##
# Use the following code to generate a list
L1 <- list(c(0.01, 3.1), c(0.02, 4.0), c(0.05, 3.5), c(0.01, 2.9), c(0.03, 3.1), c(0.04, 3.4)) 
# examine the list and its properties 
L1
class(L1)
mode(L1)
length(L1)
str(L1)

# Visit and study the help page for function "lapply"
?lapply

# Use function "lapply" to determine whether each element in L1 is larger
# than 2. Write your own function and use it as argument "FUN" in "lapply". The
# result should be a list of the same length as L1.


## TASK 2 ##
# Define your working directory using function "setwd". Verify it with "getwd".
# The path is different on every computer, so this line is commented out:
# setwd("/path/to/your/R_Basics_workshop")
getwd()

## NOTE: earlier versions of this exercise used a Nicaragua plant-checklist file
## that is not part of this repository. It now uses the Drosophila expression
## table in "Datasets", which has the same shape for this purpose: many rows,
## each belonging to one of a few groups.

# Your working directory must be the workshop folder (the one that contains
# "Datasets").
expr <- read.table("Datasets/rpkm_clase.tab", header = TRUE, sep = "\t")

# examine some properties of the resulting data frame
head(expr)
str(expr)

# Use function "tapply" to determine the number of genes on each chromosome in
# 'expr'. Write your own function and use it as argument "FUN" in "tapply". If
# you need guidance, look at EXAMPLE 3 in presentation 10-1.


## TASK 3 ##
# See EXAMPLE 2 in presentation 10-1. Modify the function "my.twosam" so that it
# returns a p-value in addition to the t-value.
# Hint: a function can only return ONE object, so you will need to put both
# values into a list or a named vector. The degrees of freedom you need are
# n1 + n2 - 2, and the function that turns a t-value into a p-value is 'pt'.


## TASK 4 ##
# Carefully study and use the code below. It defines a function that incorporates 
# environmental stochasticity in Ricker's model of population growth. 
# Environmental stochasticity is variability in population growth rate due to 
# temporal variation in environmental conditions (not to be confused with 
# demographic stochasticity which is sampling variation in births and deaths). 
# The function below assumes that temporal variation in population growth rates 
# can be approximately described by a normal distribution. The model includes 
# the following parameters:
# "nzero" is the initial population size
# "r" is the mean population growth rate (again, population growth rate is 
#  assumed to vary according to a normal distribution)
# "es" is the standard deviation of population growth rate, thus representing 
#  the magnitude of environmental stochasticity 
# "K" is carrying capacity
# "time" is the is the total number of time units over which the dynamics of the 
#  population are modeled

#create "my.second.ricker.fun"
my.second.ricker.fun <- function(nzero, r, es, K, time)
{
	N <- numeric(time+1)
	N[1] <- nzero
	r.es <- rnorm(time, r, es)
	for(i in 1:time)
	{
		N[i+1] <- N[i]*exp(r.es[i]*(1 - (N[i]/K)))
	}
	Time <- 0:time
	plot(Time, N, type="l", xlim=c(0, time), ylim=c(0,K+10), cex.axis=1.5, 
	    cex.lab=1.5, bty="n", lwd=2)
	abline(h=K, lty=3, col="red")
}

#use "my.second.ricker.fun"
# Every call draws a new set of random growth rates, so every run looks
# different. 1000 runs with a pause of 0.1 s each would take almost two minutes,
# so we use 20 here and only pause when there is somebody watching.
for(j in 1:20)
{
	my.second.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, time=100)
	if (interactive()) Sys.sleep(0.1)
}


## TASK 5 ##
# Modify the function above (my.second.ricker.fun) so that the value returned by 
# the function is a vector with the population size at each time step. Type 
# help("function") to visit the help page for functions used to write your own 
# functions. Make sure to carefully read the section "Details" of the help page.


## TASK 6 ##
# Write a loop that i) runs 1000 iterations of the function you created in 
# TASK 5 and ii) captures all the 1000 vectors produced (each vector 
# containing the population size at each time step of each iteration). Show in 
# a single plot the population dynamics produced in all 1000 iterations.

## TASK 7 ##
# The loop you wrote in TASK 6 simulated 1000 iterations of the temporal 
# dynamics of a population. Write code to determine the number of iterations in 
# which the population went extinct (i.e., reached population size near zero).
# Note that the function produces real numbers, which could make sense when measuring
# population size in certain units (e.g., biomass), but can be arbitrarily small.
# Therefore, you will need to define a population size threshold below which extinction
# occurs. 

## TASK 8 ##
# Modify the function "my.second.ricker.fun" (see TASK 4) to incorporate 
# stochastic variation in carrying capacity "K" through time, assuming that stochastic variation
# in "K" can be reasonably represented by a normal distribution. Then write a loop to run 1000 
# iterations and plot the population dynamics of each iteration.


################################################################################
### SOLUTIONS ##################################################################
################################################################################

## The solutions to this exercise live in a separate file:
##
##     soluciones/10-2_escribir_funciones_EN_solutions.r
##
## Try it on your own first and use that file afterwards to check your work. It
## re-runs this exercise by itself, so you can open it in a clean session:
##
##     source("soluciones/10-2_escribir_funciones_EN_solutions.r")
