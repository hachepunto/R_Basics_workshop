################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 10-2: Writing your own functions - SOLUTIONS                    ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## This file holds the solutions to the exercise. It is NOT the file you hand
## in: work on "10-2_escribir_funciones_EN.r" and use this one only to check your answers.

## MIND THE WORKING DIRECTORY:
## Even though this file lives in the "soluciones" folder, your working
## directory must be the workshop folder (the one above, which contains
## "Datasets" and "soluciones"). R resolves paths against the working directory,
## not against the location of the file. In RStudio: Session > Set Working
## Directory > Choose Directory, and pick the workshop folder.

if (!file.exists("10-2_escribir_funciones_EN.r")) {
  stop("Wrong working directory.\n",
       "  You are in: ", getwd(), "\n",
       "  It should be the workshop folder, the one containing 'Datasets'.")
}

## This line re-runs the exercise, so that every object the solutions need
## exists.
source("10-2_escribir_funciones_EN.r")


################################################################################
################################################################################
################################################################################

## TASK 1 ##
# 'lapply' applies the function to each ELEMENT of the list, and each element
# here is a vector of two numbers, so the result is a list of logical vectors of
# length 2.
lapply(L1, function(x) x > 2)

# If what you wanted was one TRUE/FALSE per element, you have to say how to
# summarize the two values, for example with 'any' or 'all':
lapply(L1, function(x) any(x > 2))

# And 'sapply' simplifies that to a plain vector:
sapply(L1, function(x) any(x > 2))


## TASK 2 ##
# The function receives the vector of gene ids belonging to one chromosome, and
# returns how many there are:
tapply(expr$flybase_id, expr$chr, function(x) length(x))

# 'length' on its own does exactly the same, no need to wrap it:
tapply(expr$flybase_id, expr$chr, length)

# And 'table' is the idiomatic way of counting by group:
table(expr$chr)


## TASK 3 ##
my.twosam.2 <- function(y1, y2)
{
    n1 <- length(y1)
    n2 <- length(y2)

    yb1 <- mean(y1)
    yb2 <- mean(y2)

    s1 <- var(y1)
    s2 <- var(y2)

    # Pooled variance and degrees of freedom
    s  <- ((n1-1)*s1 + (n2-1)*s2) / (n1+n2-2)
    df <- n1 + n2 - 2

    tst <- (yb1 - yb2) / sqrt(s*(1/n1 + 1/n2))

    # Two-tailed p-value
    p <- 2 * pt(-abs(tst), df = df)

    # A function returns a single object, so both values go into a list:
    return(list(t = tst, df = df, p.value = p))
}

data(iris)
PL.versi <- iris$Petal.Length[iris$Species == "versicolor"]
PL.seto  <- iris$Petal.Length[iris$Species == "setosa"]

my.twosam.2(PL.versi, PL.seto)

# Compare against R's own function (with var.equal=TRUE, which is the pooled
# variance version we implemented):
t.test(PL.versi, PL.seto, var.equal = TRUE)


## TASK 4 ##
# You already have the answer in the body of the exercise.

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

# Same precaution as above: use only the finite values to set the axis limits.
sum(!is.finite(my.results.N))
rango.finito.1 <- range(my.results.N[is.finite(my.results.N)])

plot(0:100, my.results.N[1,], type="n", ylim=rango.finito.1, xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
for(i in 1:1000)
{
	# A very transparent black lets you see where the trajectories pile up:
	points(0:100, my.results.N[i,], type="l", col=adjustcolor("black", alpha.f=0.05))
}
abline(h=30, lty=3, col="red")


## TASK 7 ##
#define a population size threshold, below which a population is considered extinct,
#say 0.001
extinction.threshold <- 0.001
#create a vector that will capture a value of 1 when a population goes extinct and zero otherwise
extinct <- rep(NA, times=nrow(my.results.N))
#use a loop to determine which populations went extinct.
#'na.rm=TRUE' is needed because a diverged run contains NaN, and NaN<=x is NA.
for(i in 1:nrow(my.results.N))
{
	extinct[i] <- sum(my.results.N[i,] <= extinction.threshold, na.rm=TRUE) > 0
}
#examine the results
summary(extinct)
sum(extinct)
#determine the rows of "my.results.N" that correspond to populations that went extinct
filas.extintas <- which(extinct)
filas.extintas

# WATCH OUT: with these parameters (r=0.1, es=0.5, K=30) extinction below a
# threshold of 0.001 is RARE, and on many runs no population goes extinct at
# all. In that case 'filas.extintas' is empty, 'filas.extintas[1]' is NA, and
# plotting row NA gives "need finite 'ylim' values". Always check that there is
# something to plot before plotting it:

if (length(filas.extintas) == 0) {
  cat("No population went extinct in this run.\n")
  cat("Try a lower growth rate or a larger environmental stochasticity,\n")
  cat("for example r = 0, es = 1, and extinction becomes common.\n")
} else {
  #plot the population size through time for the cases that went extinct
  for (fila in head(filas.extintas, 2)) {
    plot(0:100, my.results.N[fila,], type="l", xlab="Time",
         ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n",
         main=paste("Run", fila))
    abline(h=extinction.threshold, lty=3, col="red")
  }
}

# With these other parameters extinction is frequent, so the plots above do get
# drawn:
resultados.2 <- matrix(NA, 200, 101)
for (j in 1:200)
{
  resultados.2[j,] <- my.second.ricker.fun(nzero=1, r=0, es=1, K=30, time=100)
}
extinct.2 <- apply(resultados.2, 1, function(x) sum(x <= 0.001, na.rm=TRUE) > 0)
sum(extinct.2) # number of runs that went extinct out of 200


## TASK 8 ##
# The model we will create includes the following parameters:
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
		# NOTE the [i] on K.es: it is a VECTOR with one carrying capacity per time
		# step, just like r.es. Writing 'N[i]/K.es' (without the index) divides by
		# the whole vector and silently produces nonsense.
		N[i+1] <- N[i]*exp(r.es[i]*(1 - (N[i]/K.es[i])))
	}
	Time <- 0:time
	plot(Time, N, type="l", xlim=c(0, time), ylim=c(0,K+10), cex.axis=1.5, 
	    cex.lab=1.5, bty="n", lwd=2)
	abline(h=K, lty=3, col="red")
	return(N)
}

#try out the function
my.third.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, Ks=2, time=100)

#run 1000 iterations 
R.N <- matrix(NA, 1000, 101)
for(j in 1:1000)
{
	R.N[j,] <- my.third.ricker.fun(nzero=1, r=0.1, es=0.5, K=30, Ks=2, time=100)
}
#examine the results
R.N[1:5,1:5]

# WATCH OUT: with a stochastic carrying capacity the Ricker model can blow up.
# If a run happens to combine a large population with a small K and a strongly
# negative growth rate, the exponent becomes large and positive and the
# population overflows to Inf, and then to NaN. This is a property of the MODEL,
# not a bug in the code, but it does break anything that calls 'range':
sum(!is.finite(R.N))                      # how many non-finite values
sum(apply(R.N, 1, function(x) any(!is.finite(x)))) # how many runs diverged

# So we compute the limits over the finite values only:
rango.finito <- range(R.N[is.finite(R.N)])
rango.finito

#plot the population dynamics of each iteration
plot(0:100, R.N[1,], type="n", ylim=rango.finito, xlab="Time", ylab="Population size", cex.axis=1.5, cex.lab=1.5, bty="n")
for(i in 1:1000)
{
	points(0:100, R.N[i,], type="l", col=adjustcolor("black", alpha.f=0.05))
}
abline(h=30, lty=3, col="red")
