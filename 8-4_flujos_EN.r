################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-4: Flow control: bootstrapping and randomization              ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops to build bootstrap confidence intervals and
## randomization tests.

## WORKING DIRECTORY:
## This exercise reads a file from the "Datasets" folder, so your working
## directory must be the workshop folder (the one that contains "Datasets").

## NOTE: earlier versions of this exercise used the vein-density dataset of
## Blonder et al. (2014), which is not part of this repository. It now uses the
## New World bat dataset, which has the same shape: a response variable, a
## continuous predictor, and a threshold that splits the data in two groups.


################################################################################
### PART 1: Use loops for simple examples of bootstrapping                   ###
################################################################################

## Definition of bootstrapping:
# "In statistics, bootstrapping can refer to any test or metric that relies on
# random sampling with replacement. Bootstrapping allows assigning measures of
# accuracy (defined in terms of bias, variance, confidence intervals, prediction
# error or some other such measure) to sample estimates". - Wikipedia


###############################
### Bootstrapping Example 1 ###
###############################

## TASK 1 ##
## The file below has bat species richness in 100 x 100 km cells across the New
## World, together with several environmental variables. It is tab-separated,
## with column names in the first row. Open it and check its dimensions.

bat.data <- read.table("Datasets/data_batsenviroamerica.txt", header = TRUE,
                       sep = "\t")

head(bat.data)
dim(bat.data)
colnames(bat.data)

# We drop the cells with no bats at all, which are mostly high-latitude cells
# where the species simply do not reach:
bat.data <- bat.data[bat.data$richness > 0, ]
dim(bat.data)


# The two variables of interest are 'richness' and 'latitude'. To make the
# analysis symmetric between hemispheres we use ABSOLUTE latitude, i.e.
# distance from the equator:
bat.data$abslat <- abs(bat.data$latitude)


# First, we create a new object 'zone' that separates tropical from
# extratropical cells. The Tropic of Cancer sits at 23.43 degrees:

zone <- rep("tropical", times = nrow(bat.data))
zone[bat.data$abslat > 23.43] <- "extratropical"

table(zone)


# This plot shows richness against distance from the equator:
plot(bat.data$richness ~ bat.data$abslat, type = "n",
     xlab = "Absolute latitude (degrees)", ylab = "Bat species richness")

points(bat.data$richness[zone == "tropical"] ~
       bat.data$abslat[zone == "tropical"],
       pch = 21, cex = 0.8, col = "white", bg = "firebrick2")

points(bat.data$richness[zone == "extratropical"] ~
       bat.data$abslat[zone == "extratropical"],
       pch = 21, cex = 0.8, col = "white", bg = "dodgerblue2")

abline(v = 23.43, lwd = 2)


# The mean richness for tropical cells is:
mean.trop <- mean(bat.data$richness[zone == "tropical"])
mean.trop

# Now we can use a loop to build bootstrap confidence intervals around this
# mean. There are several methods; we use the simple percentile method. We start
# by creating one "bootstrap sample", resampling the richness values WITH
# REPLACEMENT:
boot.sample.trop <- sample(bat.data$richness[zone == "tropical"],
                           replace = TRUE)

# Note that 'replace' must be TRUE. Otherwise the result would be the same
# vector of values in a shuffled order, and every bootstrap mean would be
# identical to the original one.

# Now we can calculate a bootstrap estimate of the mean:
mean(boot.sample.trop)
mean.trop
# These two numbers are close but not equal.


# Using this approach and a loop, we can calculate 'n' bootstrap estimates:
n <- 10000

boot.mean.trop <- rep(NA, times = n) # Empty vector that will hold the results


## TASK 2 ##
## The loop below is almost right. Each iteration is supposed to calculate one
## bootstrapped mean and store it in a DIFFERENT element of 'boot.mean.trop':
## the first iteration in the first element, the second in the second, and so
## on. Look at the index inside the square brackets. What would go wrong if it
## said [1] instead of [i]? (It is fixed here so the file runs.)
for (i in 1:n)
{
  boot.sample.trop <- sample(bat.data$richness[zone == "tropical"],
                             replace = TRUE)

  boot.mean.trop[i] <- mean(boot.sample.trop)
}


# Now 'boot.mean.trop' holds 'n' estimates of the mean, and approximates the
# sampling distribution of mean tropical richness:
hist(boot.mean.trop, breaks = 100, col = "firebrick1", border = "firebrick1",
     main = "Mean richness, tropical cells", xlab = "Mean richness")
abline(v = mean.trop, lwd = 2)

# Finally, the percentile method uses the 2.5 and 97.5 percentiles of the
# bootstrap distribution as a 95% confidence interval:
CIs.trop <- quantile(boot.mean.trop, prob = c(0.025, 0.975))
CIs.trop


## TASK 3 ##
## Below is the same procedure for the EXTRATROPICAL cells. Read it, run it, and
## explain what each line does. Then answer: do the two confidence intervals
## overlap?

mean.extra <- mean(bat.data$richness[zone == "extratropical"])

boot.mean.extra <- rep(NA, times = n)

for (i in 1:n)
{
  boot.sample.extra <- sample(bat.data$richness[zone == "extratropical"],
                              replace = TRUE)

  boot.mean.extra[i] <- mean(boot.sample.extra)
}

CIs.extra <- quantile(boot.mean.extra, prob = c(0.025, 0.975))
CIs.extra


# A barplot showing the two means and their confidence intervals:
bp <- barplot(c(mean.trop, mean.extra), names = c("Tropical", "Extratropical"),
              ylim = range(c(0, CIs.trop, CIs.extra)),
              ylab = "Mean bat species richness",
              col = c("firebrick2", "dodgerblue2"), border = NA)

lines(x = bp[c(1, 1), 1], y = CIs.trop, lwd = 3)
lines(x = bp[c(2, 2), 1], y = CIs.extra, lwd = 3)


###############################
### Bootstrapping Example 2 ###
###############################
# There is a strong linear relationship between richness and distance from
# the equator:
rich.lat.lm <- lm(bat.data$richness ~ bat.data$abslat)
summary(rich.lat.lm) # Note the very small p-value

plot(bat.data$richness ~ bat.data$abslat, pch = 21, cex = 0.8, col = "white",
     bg = "grey30", xlab = "Absolute latitude (degrees)",
     ylab = "Bat species richness")
abline(rich.lat.lm, lwd = 3, col = "goldenrod2")


# Bootstrapping can also be used to build confidence intervals on regression
# parameters. These are the coefficients estimated from the original data:
reg.coeff <- coefficients(rich.lat.lm)
reg.coeff

# For this kind of bootstrap we separate the values predicted by the model from
# the residuals:
pred.rich <- fitted(rich.lat.lm)
resid.rich <- residuals(rich.lat.lm)

# The residuals need this standardization:
resid.rich <- sqrt(length(resid.rich) / (length(resid.rich) - 1)) * resid.rich

# One bootstrap sample of residuals:
boot.resid <- sample(resid.rich, replace = TRUE)

# A new bootstrapped response is built by adding the resampled residuals to the
# predicted values:
boot.rich <- pred.rich + boot.resid

# These bootstrapped values go into a new linear model, giving new coefficients:
boot.lm <- lm(boot.rich ~ bat.data$abslat)
coefficients(boot.lm)

# Now this procedure needs to be repeated 'n' times.


### TASK 4 ##
## Read the loop below and explain, line by line, how it implements the four
## steps described above: 1) resample the residuals with replacement, 2) build a
## bootstrapped response by adding them to the predicted values, 3) refit the
## regression, and 4) store the coefficients.
## Then answer: why are 'pred.rich' and 'resid.rich' computed OUTSIDE the loop?

n <- 2000

# An empty matrix that will hold the coefficients of every iteration:
boot.reg.coeff <- matrix(NA, nrow = n, ncol = length(reg.coeff))
colnames(boot.reg.coeff) <- names(reg.coeff)

head(boot.reg.coeff)

for (i in 1:n)
{
  boot.resid <- sample(resid.rich, replace = TRUE)

  boot.rich <- pred.rich + boot.resid

  boot.lm <- lm(boot.rich ~ bat.data$abslat)

  # This line stores the coefficients in row 'i' of the matrix:
  boot.reg.coeff[i, ] <- coefficients(boot.lm)
}


# Using the percentile method again, we get 95% confidence intervals:
CIs.intercept <- quantile(boot.reg.coeff[, 1], prob = c(0.025, 0.975))
CIs.slope <- quantile(boot.reg.coeff[, 2], prob = c(0.025, 0.975))

CIs.intercept
CIs.slope

# The confidence interval for the slope does not overlap zero. That is one way
# of concluding that the regression is statistically significant.

hist(boot.reg.coeff[, 2], breaks = 100, col = "firebrick1",
     border = "firebrick1", main = "", xlab = "Slope")

# This polygon marks the 95% confidence interval:
polygon(x = CIs.slope[c(1, 1, 2, 2)], y = c(0, n, n, 0), col = gray(0.5, 0.5),
        border = gray(0.5, 0.5))

# And this line marks the original empirical slope:
abline(v = reg.coeff[2], lwd = 2)



################################################################################
### PART 2: Use loops for simple examples of randomization tests             ###
################################################################################

# While bootstrapping tries to estimate the accuracy of a statistic calculated
# from a sample (e.g. a mean), randomization tests aim at p-values and effect
# sizes. They do it by comparing an empirical statistic against a distribution
# of values expected under a particular null hypothesis.


###############################
### Randomization Example 1 ###
###############################

# The question is whether the tropics hold more bat species than the rest of the
# New World. The prediction is that mean richness should differ between the two
# zones. We can test it with a parametric t-test, and also with a randomization
# test.

boxplot(bat.data$richness[zone == "tropical"],
        bat.data$richness[zone == "extratropical"],
        ylab = "Bat species richness", names = c("Tropical", "Extratropical"),
        col = c("firebrick2", "dodgerblue2"))

# The parametric test. As you can see, it is highly significant:
t.test.res <- t.test(bat.data$richness[zone == "tropical"],
                     bat.data$richness[zone == "extratropical"])
t.test.res

# This isolates the empirical t-statistic:
emp.t <- t.test.res$statistic
emp.t


# If the prediction is that the two groups come from populations with different
# means, then the null hypothesis is that both come from the SAME population.
# So an algorithm that randomly reassigns richness values between the two groups
# is a reasonable way of producing null values of the statistic.

# The easiest way to do that reassignment is to permute the vector that defines
# the groups:
rand.zone <- sample(zone, replace = FALSE)

# 'replace' is FALSE here: we want to REORDER the vector, not resample it.

boxplot(bat.data$richness[rand.zone == "tropical"],
        bat.data$richness[rand.zone == "extratropical"],
        ylab = "Bat species richness", names = c("Tropical", "Extratropical"))
# Note how the difference between boxes essentially disappears.

rand.t.test.res <- t.test(bat.data$richness[rand.zone == "tropical"],
                          bat.data$richness[rand.zone == "extratropical"])
rand.t.test.res$statistic


# Now we repeat this a large number of times:
n <- 999

rand.t <- rep(NA, times = n)

for (i in 1:n)
{
  rand.zone <- sample(zone, replace = FALSE)

  rand.t.test.res <- t.test(bat.data$richness[rand.zone == "tropical"],
                            bat.data$richness[rand.zone == "extratropical"])

  rand.t[i] <- rand.t.test.res$statistic
}

# This adds the empirical statistic to the randomized values:
rand.t <- c(emp.t, rand.t)


hist(rand.t, breaks = 100, col = "firebrick1", border = "firebrick1",
     main = "", xlab = "t-statistic")
abline(v = emp.t, lwd = 2)

# Two things are visible: 1) the null distribution is centred on zero, and
# 2) the empirical value is nowhere near it.

# A one-tailed p-value: the proportion of randomized values greater than or
# equal to the empirical one.
p.value <- sum(rand.t >= emp.t) / length(rand.t)
p.value

# The smallest p-value this test can produce is 1/(n+1), because the empirical
# value is always counted as one of the values in the distribution.
1 / length(rand.t)


###############################
### Randomization Example 2 ###
###############################

# The result above is not very informative, because richness declines steadily
# with latitude. ANY cut-off would give the same qualitative answer: more
# species on the equator side than on the pole side.

plot(bat.data$richness ~ bat.data$abslat, pch = 21, cex = 0.8, col = "white",
     bg = "grey30", xlab = "Absolute latitude (degrees)",
     ylab = "Bat species richness")
abline(rich.lat.lm, lwd = 3, col = "goldenrod2")
abline(v = 23.43, lwd = 3, col = "black")

# So the null hypothesis needs to take that gradient into account. We can refine
# the question: is the difference in mean richness on either side of the Tropic
# of Cancer LARGER than the difference on either side of any other latitude?

# The empirical statistic is the same as before:
emp.t

# Now we pick a random latitude within the observed range:
rand.lat <- runif(n = 1, min = min(bat.data$abslat), max = max(bat.data$abslat))
rand.lat

abline(v = rand.lat, lwd = 2, col = "red")

# And use it to split the data in two groups:
rand.zone <- rep("tropical", times = nrow(bat.data))
rand.zone[bat.data$abslat > rand.lat] <- "extratropical"

# Finally we recalculate the t-statistic with this random split:
rand.t.test.res <- t.test(bat.data$richness[rand.zone == "tropical"],
                          bat.data$richness[rand.zone == "extratropical"])
rand.t.test.res$statistic


## TASK 5 ##
## The loop below builds the randomization distribution for this second null
## hypothesis. Read it and explain how it differs from the loop in Example 1:
## what exactly is being randomized in each case?

n <- 999

rand.t <- rep(NA, times = n)

for (i in 1:n)
{
  rand.lat <- runif(n = 1, min = min(bat.data$abslat),
                    max = max(bat.data$abslat))

  rand.zone <- rep("tropical", times = nrow(bat.data))
  rand.zone[bat.data$abslat > rand.lat] <- "extratropical"

  # A split very close to either end leaves one group almost empty, and t.test
  # fails when a group has fewer than two values. 'try' lets the loop carry on:
  res <- try(t.test(bat.data$richness[rand.zone == "tropical"],
                    bat.data$richness[rand.zone == "extratropical"]),
             silent = TRUE)

  if (!inherits(res, "try-error")) rand.t[i] <- res$statistic
}

# Some iterations may have failed, so we drop the NAs before continuing:
rand.t <- rand.t[!is.na(rand.t)]

rand.t <- c(emp.t, rand.t)


## TASK 6 ##
## Make a histogram showing the randomization distribution and where the
## empirical value falls in it.

hist(rand.t, breaks = 50, col = "firebrick1", border = "firebrick1",
     main = "", xlab = "t-statistic")
abline(v = emp.t, lwd = 2)


## TASK 7 ##
## Calculate the p-value: the proportion of randomized values greater than or
## equal to the empirical one. Compare it with the p-value of Example 1 and
## explain, in a sentence, why they differ so much.

p.value <- sum(rand.t >= emp.t) / length(rand.t)
p.value

## TASK 8 ##
## Under this second null hypothesis the Tropic of Cancer is no longer special:
## many random cut-offs produce a t-statistic as large as the empirical one.
## What does that tell you about the original question? Write your answer as a
## comment below.
