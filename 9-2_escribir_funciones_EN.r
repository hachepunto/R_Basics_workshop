################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 9-2: Writing your own functions                                ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
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

# vist and study the help page for function "lapply"
?lapply

# use function "lapply" to determine if each element in L1 is larger than 2.
# Write a function and use it as argument "FUN" in "lapply". The result
# should be a list of the same the same length as L1. 


## TASK 2 ##
# Define your working directory using function "setwd". Verify the working 
# directory using function "getwd".
setwd("C:/_transfer/R_Basics_Workshop/St_Louis_May_2016/Drafts/Day2") #this is the working directory at Ivan's laptop
getwd()

# Use function "read.csv" to create a data frame called "Nicaragua.data" with the 
# data in file "NicaraguaData.csv" (available in the workshop website). 
Nicaragua.data <- read.csv("NicaraguaData.csv", sep = ",", header=T)
#examine some properties of the resulting dataframe 
head(Nicaragua.data)
str(Nicaragua.data)

# use function "tapply" to determine the number of species in each genus in Nicaragua.data,
# write a function and use it as argument "FUN" in "tapply". If you need to, get guidance
# from EXAMPLE 3 in presentation on "writing your own functions".


## TASK 3 ##
# See EXAMPLE 4 in presentation on "writing your own functions". Modify the function
# "my.twosam" to yield a p-value, in addition to the t-value.


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
for(j in 1:1000)
{
	my.second.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, time=100)
	Sys.sleep(0.1)
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
# population size in certain units (e.g., biomass), but can be arbitraritly small.
# Therefore, you will need to define a population size threshold below which extinction
# occurs. 

## TASK 8 ##
# Modify the function "my.second.ricker.fun" (see TASK 4) to incorporate 
# stochastic variation in carrying capacity "K" through time, assuming that stochastic variation
# in "K" can be reasonably represented by a normal distribution. Then write a loop to run 1000 
# iterations and plot the population dynamics of each iteration.



################################################################################
################################################################################
################################################################################
################################################################################
### TASK ANSWERS ###############################################################
################################################################################
################################################################################
################################################################################
################################################################################

## TASK 1 ##
#sorry, no answer this time

## TASK 2 ##
#sorry, no answer this time

## TASK 3 ##
#sorry, no answer this time

## TASK 4 ##
#you already hav the answer

## TASK 5 ##
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
	return(N)
}


## TASK 6 ##
my.results.N <- matrix(NA, 1000,101)
for(j in 1:1000)
{
	my.results.N[j,] <- my.second.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, time=100)
	#Sys.sleep(0.1)
}
#examine the results
my.results.N[1:5, 1:5]

plot(0:100, my.results.N[1,], type="n", ylim=range(my.results.N), xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
for(i in 1:1000)
{
	points(0:100, my.results.N[i,], type="l", ylim=range(my.results.N))
}
abline(h=30, lty=3, col="red")


## TASK 7 ##
#define a population size threshold, below which a population is considered extinct,
#say 0.001
extinction.threshold <- 0.001
#create a vector that will capture a value of 1 when a population goes extinct and zero otherwise
extinct <- rep(NA, times=nrow(my.results.N))
#use a loop to determine which populations went extinct
for(i in 1:nrow(my.results.N))
{
	extinct[i] <- (sum(my.results.N[i,]<=extinction.threshold))>0
}
#examine the results
summary(extinct)
sum(extinct)
#determine the rows of "my.results.N" that correspond to populations that went extinct
which(extinct)
#plot the population size through time for the cases in which the population went extinct
plot(0:100, my.results.N[which(extinct)[1],], type="l", xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
abline(h=extinction.threshold, lty=3, col="red")
plot(0:100, my.results.N[which(extinct)[2],], type="l", xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
abline(h=extinction.threshold, lty=3, col="red")


## TASK 8 ##
The model we will create includes the following parameters:
# "nzero" is the initial population size
# "r" is the mean population growth rate (again, population growth rate is 
#  assumed to vary according to a normal distribution)
# "es" is the standard deviation of population growth rate, thus representing 
#  the magnitude of environmental stochasticity 
# "K" is the mean of the carrying capacity
# "Ks" stochastic variation in carrying capacity "K" through time
# "time" is the is the total number of time units over which the dynamics of the 
#  population are modeled

#create "my.third.ricker.fun" according to the model above
my.third.ricker.fun <- function(nzero, r, es, K, Ks, time)
{
	N <- numeric(time+1)
	N[1] <- nzero
	r.es <- rnorm(time, r, es)
	K.es <- rnorm(time, K, Ks)
	for(i in 1:time)
	{
		N[i+1] <- N[i]*exp(r.es[i]*(1 - (N[i]/K.es)))
	}
	Time <- 0:time
	plot(Time, N, type="l", xlim=c(0, time), ylim=c(0,K+10), cex.axis=1.5, 
	    cex.lab=1.5, bty="n", lwd=2)
	abline(h=K, lty=3, col="red")
	return(N)
}

#try out the the function
my.third.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, Ks=2, time=100)

#run 100 iterations 
R.N <- matrix(NA, 1000,101)
for(j in 1:1000)
{
	R.N[j,] <- my.third.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, Ks=2, time=100)
	#Sys.sleep(0.1)
}
#examine the results
R.N[1:5,1:5]

#plot the population dynamics of each iteration
plot(0:100, R.N[1,], type="n", ylim=range(R.N), xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
for(i in 1:1000)
{
	points(0:100, R.N[i,], type="l", ylim=range(my.results.N))
}
abline(h=30, lty=3, col="red")

