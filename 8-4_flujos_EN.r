################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 9-4: Flow control                                               ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops "



################################################################################
### PART 1: Use loops for simple examples of bootstrapping                   ###
################################################################################

## Definition of bootstrapping:
# "In statistics, bootstrapping can refer to any test or metric that relies on 
# random sampling with replacement. Bootstrapping allows assigning measures of 
# accuracy (defined in terms of bias, variance, confidence intervals, prediction 
# error or some other such measure) to sample estimates". - Wikipedia
# http://en.wikipedia.org/wiki/Bootstrapping_(statistics))


###############################
### Bootstrapping Example 1 ###
###############################

## TASK 1 ##
## For this section, we will use data from Blonder et al. (2014). Open the 
## file named "Data_Blonder_etal_2014_PlosBiology_VeinDensityData.csv". This is 
## a coma separated file. Use 'VD.data' as name for the object.


# We should check the first few rows of data:
head(VD.data)

# This data should have 468 rows and 8 columns. Check that this is true: 
dim(VD.data)

# Check the variable names:
colnames(VD.data)


# The main variables of interest here are 'VD' and 'depth'. 'VD' is vein density 
# calculated from fossilized leaves; 'depth' is stratigraphic depth of the 
# fossils, and is a measure of time. 'depth' of 0 corresponds to the KP boundary
# at around 65.5 million years ago when an asteroid hit the earth causing a 
# mass extinction.


# First, we will create a new object 'time.group' to separate fossils of 
# plants that lived before or after the impact of the asteroid:

# Initially, all values are "before": 
time.group <- rep("before", times=nrow(VD.data))

# Then, 'time.group' is set to "after" for values of 'depth' greater than 0:
time.group[VD.data$depth>0] <- "after" 


# This plot should look similar to panel B in figure 2 of Blonder et al. (2014):
plot(VD.data$VD ~ VD.data$depth, type="n", xlab="Stratigraphic Depth", 
  ylab="Vein Density")
  
points(VD.data$VD[time.group=="before"] ~ VD.data$depth[time.group=="before"], 
  pch=21, cex=1.5, col="white", bg="firebrick2")
  
points(VD.data$VD[time.group=="after"] ~ VD.data$depth[time.group=="after"], 
  pch=21, cex=1.5, col="white", bg="dodgerblue2")
  
abline(v=0, lwd=2)


# The mean vein density for fossils before the KP boundary is calculated as:
mean.before <- mean(VD.data$VD[time.group=="before"])
mean.before

# Now, we can use a loop to construct bootstrap confidence intervals around this
# mean. There are multiple methods to do this, we will use the simple percentile
# method. We start by creating a "bootstrap sample". We do this by resampling 
# WITH REPLACEMENT the values of vein density:
boot.sample.before <- sample(VD.data$VD[time.group=="before"], replace=TRUE)

# Note that we use set the argument 'replace' equal to TRUE. Otherwise, the
# result would be the same vector of values but in a randomized order. 

# Now, we can calculate a bootstrap estimate of the mean:
boot.mean.before <- mean(boot.sample.before)

# This will be a number different from the original estimate of the mean:
boot.mean.before
mean.before


# Using this approach and a loop, we can calculate 'n' bootstrap estimates of 
# the mean:
n <- 10000

boot.mean.before <- rep(NA, times=n) # This is an empty vector that will contain 
                                     # the results


## TASK 2 ##
## The loop below is almost ready. Each iteration of the loop is supposed to 
## calculate a bootstrapped estimate of mean and placing it as a different 
## element of the vector 'boot.mean.before'. For example, the first iteration
## should generate the first element of the vector, the second iteration the 
## second element, etc. However, every iteration of the loop is placing 
## the resulting value in the first position of the vector! Correct the mistake
for(i in 1:n)
{
  boot.sample.before <- sample(VD.data$VD[time.group=="before"], replace=TRUE)
  
  boot.mean.before[1] <- mean(boot.sample.before)
}


# Now 'boot.mean.before' has 'n' estimates of the mean, and can be used to 
# approximate the sampling distribution of the mean vein density for the fossils
# before the KP boundary. This figure shows this distribution in relation to
# the original mean value:
hist(boot.mean.before, breaks=100, col="firebrick1", border="firebrick1", 
  main="Mean before KP boundary")
abline(v=mean.before, lwd=2)

# Finally, the percentile method uses the 2.5 and 97.5 percentiles of the 
# distribution of bootstrapped values to calculate 95% confidence intervals: 
CIs.before <- quantile(boot.mean.before, prob=c(0.025, 0.975))


## TASK 3 ##
## Modify the code above to calculate the bootstrap sampling distribution and 
## confidence intervals of mean vein density for fossils AFTER the KP boundary. 
## Note: Use similar names of objects as those above. For example, use 
## 'CIs.after' instead of 'CIs.before' Hint: use rows of the dataset where 
## 'time.group' is equal to "after".


# If you followed the same naming format we can create a barplot showing the 
# means and their corresponding confidence intervals:
bp <- barplot(c(mean.before, mean.after), names=c("Before", "After"), 
  ylim=range(c(0, CIs.before, CIs.after)), ylab="Vein Density")
  
lines(x=bp[c(1,1),1], y=CIs.before, lwd=3)
lines(x=bp[c(2,2),1], y=CIs.after, lwd=3)



###############################
### Bootstrapping Example 2 ###
###############################
# As is evident from the data, there is a significant linear relationship 
# between vein density and stratigraphic depth:
VD.depth.lm <- lm(VD.data$VD ~ VD.data$depth)
summary(lm(VD.depth.lm)) # Note the significant p-value in this regression

# We can use again a scatterplot to see the relationship:
plot(VD.data$VD ~ VD.data$depth, pch=21, cex=1.5, col="white", bg="grey30", 
  lwd=1.5, xlab="Stratigraphic Depth", ylab="Vein Density")
abline(VD.depth.lm, lwd=3, col="goldenrod2")


# Bootstrapping can also be used to construct confidence intervals on regression
# parameters. These are the estimates of the coefficients in the original data:
reg.coeff <- coefficients(VD.depth.lm)
reg.coeff

# For this type of bootstrapping, we will need to separate the predicted values
# of the linear model from the residuals:
pred.VD <- fitted(VD.depth.lm)
resid.VD <- residuals(VD.depth.lm) 

# This is a standardization that is needed of the residuals:
resid.VD <- ( (length(resid.VD)/(length(resid.VD)-1))^(1/2) ) * resid.VD

# We now need to create a bootstrap sample of residuals:
boot.resid.VD <- sample(resid.VD, replace=TRUE)

# Then, a new bootstrapped response variable is created by summing the bootstrap
# sample of residuals to the predicted values:
boot.VD <- pred.VD + boot.resid.VD

# These bootstrapped values of vein density are now used in a new linear model
# and new coefficients are calculated:
boot.VD.depth.lm <- lm(boot.VD ~ VD.data$depth)
boot.reg.coeff <- coefficients(boot.VD.depth.lm)
boot.reg.coeff

# Now, these procedure needs to be repeated 'n' times.


### TASK 4 ##
## Following the steps outlined above, complete the code below to produce 
## bootstrap estimates for the regression coefficients between vein density 
## and stratigraphic depth. Hint: note that the predicted and residual values
## were already calculated, and they do not need to be re-calculated inside 
## the loop. All that needs to be done is to 1) sample with replacement the 
## residuals (i.e., calculate a bootstrap sample of the residuals), 2) create 
## a bootstrapped response by summing bootstrap residuals to predicted, 3) 
## repeat the regression analysis with this response, and 4) save the 
## coefficients.

n <- 5000

# This creates an empty matrix that will be used to store the values of 
# coefficients produced at each iteration of the loop:
boot.reg.coeff <- matrix(NA, nrow=n, ncol=length(reg.coeff))
colnames(boot.reg.coeff) <- names(reg.coeff)

head(boot.reg.coeff)

# This is the bootstrapping loop where 'i' will take values from 1 to 'n':
for(i in 1:n)
{

  ## YOUR CODE GOES HERE ##
  
  # This line of code should store the values of the regression coefficients in
  # row 'i' of the matrix:
  boot.reg.coeff[i,] <- ## YOUR CODE GOES HERE ##

}



# Using the same percentile method, we can calculate 95% confidence intervals
CIs.intercept <- quantile(boot.reg.coeff[,1], prob=c(0.025, 0.975))
CIs.slope <- quantile(boot.reg.coeff[,2], prob=c(0.025, 0.975))

CIs.intercept
CIs.slope

# As can be seen from this analysis, the confidence interval for the slope does 
# not overlap zero. This is one way to conclude that the regression is 
# statistically significant:

# This is the histogram showing the bootstrap sampling distribution of the slope:
hist(boot.reg.coeff[,2], breaks=100, col="firebrick1", border="firebrick1", 
  main="", xlab="Slope")
  
# This polygon delimits the 95% confidence interval:  
polygon(x=CIs.slope[c(1,1,2,2)], y=c(0, n, n, 0), col=gray(0.5, 0.5), 
  border=gray(0.5, 0.5))

# This line shows the position of the original empirical slope:  
abline(v=reg.coeff[2], lwd=2)





################################################################################
### PART 2: Use loops for simple examples of randomization tests             ###
################################################################################

# While bootstrapping (and related techniques) try to estimate the accuracy of 
# a statistic calculated from a sample (e.g. mean), randomization tests aim to
# calculate p-values and effect sizes. This is accomplished by comparing an
# empirical statistic to a distribution of values expected by a particular null
# hypothesis (i.e. the randomization or null distribution). 


###############################
### Randomization Example 1 ###
###############################

# The key question behind Blonder et al.'s study is whether the mass extinction 
# in the KP boundary represented a major selection event. This would mean that 
# the lineages of plants that survived the mass extinction were not a random 
# sample of the lineages that preceded the impact of the asteroid. To test this
# hypothesis, Blonder et al. made the prediction that the mean vein density
# for plants before and after the KP boundary should be significantly different. 
# They used parametric analyses for this comparison; we can do the same with a
# randomization test. 

# This creates a boxplot similar to that in panel B of figure 2
boxplot(VD.data$VD[time.group=="before"], VD.data$VD[time.group=="after"], 
  ylab="Vein Density", names=c("Before", "After"), 
  col=c("firebrick2", "dodgerblue2"))

# This runs the parametric test, a simple t-test. As you can see, it is
# statistically significant (p<0.001):
t.test.res <- t.test(VD.data$VD[time.group=="after"], 
  VD.data$VD[time.group=="before"])
t.test.res

# This isolates the empirical t-statistic:
emp.t <- t.test.res$statistic
emp.t


# If the prediction is that the two groups ("before" and "after") come from two
# different populations with different means, then the null hypothesis in that
# both groups come from the same population. Thus, an algorithm whereby values
# of vein density are randomly assigned among the two groups is a reasonable way
# to produce random (i.e. null) values of the statistic.


# The easiest way to accomplish this random reassignment is to permute the order
# of the vector defining the groups:
rand.time.group <- sample(time.group, replace=FALSE)

# Note that the argument 'replace' is set to FALSE, so that the vector is 
# randomly re-ordered not sampled with replacement.

# This boxplot shows the randomized vein density data:
boxplot(VD.data$VD[rand.time.group=="before"],  
  VD.data$VD[rand.time.group=="after"], ylab="Vein Density", 
  names=c("Before", "After"))

# Now we use the new vector of group assignation to calculate the t-statistic:
rand.t.test.res <- t.test(VD.data$VD[rand.time.group=="before"], 
  VD.data$VD[rand.time.group=="after"])
rand.t <- rand.t.test.res$statistic


# Like before, we need to repeat this procedure a large number of times:
n <- 9999

rand.t <- rep(NA, times=n)

for(i in 1:n)
{
  rand.time.group <- sample(time.group, replace=FALSE)
  
  rand.t.test.res <- t.test(VD.data$VD[rand.time.group=="after"], 
    VD.data$VD[rand.time.group=="before"])

  rand.t[i] <- rand.t.test.res$statistic
}

# Finally, this combines the empirical t-statistic to the randomized values
rand.t <- c(emp.t, rand.t)


# This figure shows the randomized distribution and its relationship with the
# empirical statistic (vertical line):
hist(rand.t, breaks=100, col="firebrick1", border="firebrick1", 
  main="", xlab="t-statistic")
abline(v=emp.t, lwd=2)


# As can be seen from this figure: 1) the distribution of values expected under
# the null hypothesis is centered around zero, and 2) the empirical value seems
# not to belong to this randomized distribution. 

# Now, we can calculate a one-tailed p-value. This tests the alternative
# hypothesis that the empirical t values is higher than expected.
# The p-value is calculated as the proportion of values in the randomized
# distribution that are equal or greater than the empirical:
p.value <- length(which(rand.t>=emp.t)) / length(rand.t)
p.value

# As you can see, there are no random values that are less or equal than the 
# empirical t-statistic, so the p-value is very close to zero. The differences 
# in means between groups are highly statistically significant. The results of 
# the parametric t-test the non-parametric randomization tests coincide. 



###############################
### Randomization Example 2 ###
###############################

# The results above are the same as those found by Blonder et al. However, 
# Blonder et al. failed to consider the effect of a significant positive
# relationship between vein density and stratigraphic depth.

plot(VD.data$VD ~ VD.data$depth, pch=21, cex=1.5, col="white", bg="grey30", 
  lwd=1.5, xlab="Stratigraphic Depth", ylab="Vein Density")
# This plots vein density against stratigraphic depth

abline(VD.depth.lm, lwd=3, col="goldenrod2")
# This shows the regression line

abline(v=0, lwd=3, col="black")
# This shows the cutoff point defining the KP boundary

summary(lm(VD.depth.lm))
# This shows a summary of the regression results


# Because of this positive relationship, any value of stratigraphic depth that 
# is used to divide the data in two parts will produce similar results (higher 
# values after the division than before). 

# Thus, the appropriate null hypothesis seems to need to consider this effect. 
# There are multiple ways to do this, but we can refine the prediction and
# use a randomization test to answer the question: is the difference in mean 
# vein density before and after the KP boundary significantly larger than before 
# and after any other random point in time in the dataset? 

# Like before, we start by calculating an empirical statistic. We can use again
# the t-statistic:
t.test.res <- t.test(VD.data$VD[time.group=="after"], 
  VD.data$VD[time.group=="before"])
  
emp.t <- t.test.res$statistic
emp.t
# This is the t-statistic representing the difference in means before and after
# the KP boundary


# Now, we pick a random stratigraphic depth within the range of possible values:
rand.depth <- runif(n=1, min=min(VD.data$depth), max(VD.data$depth))

# Lets add this random new dividing value to the scatterplot:
abline(v=rand.depth, lwd=2, col="red")

# Using this random value, we split the data in two groups:
rand.time.group <- rep("before", times=nrow(VD.data))
rand.time.group[VD.data$depth>rand.depth] <- "after"

# Finally, we re-calculate the t-statistic using this random time split:
rand.t.test.res <- t.test(VD.data$VD[rand.time.group=="after"], 
  VD.data$VD[rand.time.group=="before"])
  
rand.t <- rand.t.test.res$statistic
rand.t  



## TASK 5 ##
## Following the steps outlined above, complete the code below to produce 
## a randomized distribution of t-statistics. This randomized distribution 
## represents the null hypothesis that values of vein density are divided
## by a randomly chosen values of stratigraphic depth. 
n <- 99999

rand.t <- rep(NA, times=n)

# This is the bootstrapping loop where 'i' will take values from 1 to 'n':
for(## YOUR CODE GOES HERE ##)
{
  ## YOUR CODE GOES HERE ##
}

  
rand.t <- c(emp.t, rand.t)
# This combines the empirical and random values

## TASK 6 ##
## Make a histogram that shows the values of the randomization distribution and
## how they compare to the empirical value. 


## TASK 7 ##
## Calculate a p-value giving the probability that emp.t >= rand.t. Note that 
## the result is now only marginally significant.




















################################################################################
### TASK SOLUTIONS #############################################################
################################################################################

## TASK 1 ##
VD.data <- read.table(file=file.choose(), header=TRUE, sep=",")


## TASK 2 ##
boot.mean.before[i] <- mean(boot.sample.before)


## TASK 3 ##
mean.after <- mean(VD.data$VD[time.group=="after"])

n <- 10000

boot.mean.after <- rep(NA, times=n)

for(i in 1:n)
{
  boot.sample.after <- sample(VD.data$VD[time.group=="after"], replace=TRUE)
  boot.mean.after[i] <- mean(boot.sample.after)
}
 
CIs.after <- quantile(boot.mean.after, prob=c(0.025, 0.975))


## TASK 4 ##
n <- 10000

boot.reg.coeff <- matrix(NA, nrow=n, ncol=length(reg.coeff))
colnames(boot.reg.coeff) <- names(reg.coeff)

head(boot.reg.coeff)

for(i in 1:n)
{
  boot.resid.VD <- sample(resid.VD, replace=TRUE)

  boot.VD <- pred.VD + boot.resid.VD

  boot.VD.depth.lm <- lm(boot.VD ~ VD.data$depth)

  boot.reg.coeff[i,] <- coefficients(boot.VD.depth.lm)
}


  
## TASK 5 ##
for(i in 1:n)
{
  rand.depth <- runif(n=1, min=min(VD.data$depth), max(VD.data$depth))

  rand.time.group <- rep("before", times=nrow(VD.data))
  rand.time.group[VD.data$depth>rand.depth] <- "after"

  rand.t.test.res <- t.test(VD.data$VD[rand.time.group=="after"], 
    VD.data$VD[rand.time.group=="before"])
  
  rand.t[i] <- rand.t.test.res$statistic
}

  

## TASK 6 ##
hist(rand.t, breaks=30, col="firebrick1", border="firebrick1", 
  main="", xlab="t-statistic")
abline(v=emp.t, lwd=2)


## TASK 7 ##
p.value <- length(which(rand.t>=emp.t)) / length(rand.t)
p.value




