################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 3.1: Objects                                                    ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## OBJECTIVE:
## The objective of this exercise is to become familiar with different types of 
## objects in R. 


rand.1 <- rnorm(100, mean=5, sd=1.5)
# Creates an object with 100 random values taken from a normal distribution with 
# an average of 5 and a standard deviation of 1.5.

## TASK 1: What class of object is this?
## TASK 2: What type of data does it contain?
## TASK 3: What is the length of this object?

## TAKS 4: What are the mean and standard deviation of rand.1

## TASK 5: Re-write rand.1 with another set of 100 random values taken from a 
## normal distribution with an average of 5 and a standard deviation of 1.5.
## TAKS 6: What are the mean and standard deviation of this new version of rand.1.
## is the mean the same as before? Why yes/no?

?as.character
# Opens the help file for function 'as.character'

## TASK 7: Use the function as.character to create a vector named 'rand.2' of 
## characters from objects 'rand.1'.


class(rand.2)
mode(rand.2)
length(rand.2)
# Confirms the changes made to the object.


rand.1
rand.2
## When printing these two objects on the screen, pay attention at how 
## they look different. 


identical(rand.1, rand.2)
## TASK 8: What does the function 'identical' do, and why is this FALSE? 
## TASK 9: Use the function 'as.numeric' to create a new object rand.3 
## back-transforming rand.2 from text to numbers

class(rand.1)
class(rand.3)
identical(class(rand.1), class(rand.3))
# This confirms the change



identical(rand.1, rand.3)
## TASK 10: Can you figure it out why this is still FALSE? This is a lesson to be
## careful when working with your data.


seq.1 <- 1:5
seq.1
## Creates a vector with the sequence 1, 2, 3, 4, 5.


## TASK 11: We want to create a vector of length 10 that is a random sample of 
## numbers from the sequence in 'seq.1'. To do this, we use the function 'sample'. 
## The line below, however, has an error. Fix the problem using the help and the 
## error the line returns. 
sample(x=seq.1, size=10)
 

## TASK 12: Create an object of name 'rand.3' (over-writing the previously created
## object) that is a character vector of length 300 that is a random sample of 
## integers from 1 to 10. 
 
is.numeric(rand.3)
# This should be FALSE.  It tests that the mode of the object is 'numeric', 
# meaning that the data it contains are numbers. 

is.character(rand.3)
# This should be TRUE.   

class(rand.3)
mode(rand.3)
length(rand.3)
# Confirms the class, mode and length of the object you created.  


rand.4 <- as.numeric(rand.3)
# Creates a numeric vector transforming the values in 'rand.3'.

## TASK 13: Create a vector rand.5 by applying the function as.factor to rand.4
## TASK 14: What is the class of rand.5?



plot(rand.4, col="lightgreen")
plot(rand.5, col="blue")
# Although in essence both objects have numbers, whether the object is of class 
# numeric or class factor determines the way the 'plot' function will handle 
# the data.


M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
M.abund
## TASK 15: What does the function 'rpois' do? What is this line of code doing?


class(M.abund)
## TASK 16: Without using R, can you predict what the dimensions of this matrix 
## will be? What its length will be? Confirm your predictions using the 
## functions 'dim' and 'length'.
 

# Let us suppose that the matrix 'M.abund' is a matrix of abundances of species 
# (columns) at various sites (rows). In these matrices, it is useful to have 
# names for the rows and the columns. The following line of code creates names 
# for the columns that represent different species.

## TASK 17: There is a mistake in the line below, read the error message, find the 
## mistake and fix it. 
colnames(M.abund) <- paste("sp", 1:ncol("M.abund"), sep="_")
colnames(M.abund)
M.abund

## TASK 18: Can you predict what will be the output of the following line of code?
class(colnames(M.abund))

## TASK 19: Now, write code to give names to the rows (i.e., sites) of the matrix. 

M.presence <- M.abund > 0
## You will learn more about these operators, but for now, what this line 
## of code is doing is comparing each element of the matrix 'M.abund' to the value 
## of 0, and producing a new matrix of identical dimensions. This new matrix is 
## filled with TRUE and FALSE values, depending on whether the values in the 
## original matrix 'M.abund' are greater than zero or not. 

M.presence
##Confirms that the object looks the way it should. Notice that it 
## inherits the column and row names from the matrix 'M.abund'.

## TASK 20: What will be the class of this object? What will be its mode? 

spp.abund <- colMeans(M.abund)
# The function 'colMeans' calculate the mean values of each column. This produces 
# a vector with the mean number of individuals for each species. 

## TASK 21: What are the names of the elements in this vector? Where did they come 
## from? 


spp.occup <- colSums(M.presence)
# This is a very useful trick: R handles TRUEs like 1s and FALSEs like 0s. So 
# making a sum of the columns in the TRUE/FALSE matrix produces a vector that 
# counts the number of sites where a species is present.

# Now, let€™s see if there is a relationship between abundance and occupancy in 
# this simulated data.
 
LM.abund.occup <- lm(spp.abund~spp.occup)
## TASK 22: What does the function 'lm' do?
## TASK 23: What is the class of this object?  
## TASK 24: Investigate the structure of this object with the function 'str'.
## TASK 25: Use the function 'summary' on this objet to get the results.
## TASK 26: Make a simple scatterplot that corresponds to this analysis using the 
## function plot.

## TASK 27: Make a similar analysis that investigates the relationship between 
## total numbers of individuals at a site with species richness (use rowSums to
## obtain the total number of individuals per site).



getwd()
# Shows the address to the folder that works as the working directory. Unless 
# otherwise specified, files will be saved and read from this folder.

## TASK 28: Create an object named 'path.to.folder' with the address to the 
## workshop folder in your computer:
path.to.folder <- "The address goes here"


path.to.folder
# Print the contents of 'path.to.folder' on the console
## TASK 29: What is the class of path.to.folder?


setwd(path.to.folder)
# Makes the folder in 'path.to.folder' the working directory.

getwd()
# Confirms the change.

?write.table
# Opens the help for the function 'write.table'

write.table(x=M.abund, file="M_abund.txt", sep="\t")
# Writes the table M.abund in a text file, separating fields by a tab. 

rm(M.abund)
## TASK 30: What is the function rm doing? 


sim.matrix <- matrix(rpois(50, 5), nrow=10, ncol=5)
# Creates a matrix of 5 columns and 10 rows, filling it with random values from 
# a Poisson distribution with a mean of 5. 

rownames(sim.matrix) <- paste("site", 1:nrow(sim.matrix), sep="_")
colnames(sim.matrix) <- paste("sp", 1:ncol(sim.matrix), sep="_")
# Creates names for rows and columns.

## TASK 31: Save 'sim.matrix' in your workshop folder using the function 
## 'write.table'. Separate fields by commas. Use any name you'€™d like for the 
## file, but make sure you use the correct file extension: '.txt'.


letters
# 'letters' is a vector containing the alphabet available in R.

L.vector <- sample(c(letters, LETTERS), 50, replace=TRUE)
## TASK 32: What are the class, mode and length of the vector?
## TASK 33: Create a vector with integers from 1 to the length of vector L.vector.
## TASK 34: Use the vector in the previous step to put names to the elements in the 
## vector L.vector

## TASK 35: Create matrix named L that contains the values in L.vector, and that 
## has 5 rows (and as many columns as necessary to hold the data).


###**Download the file: StreblidaeOnBats.txt from the workshop website**###

# Using the following line of code, open the file "StreblidaeOnBats.txt", 
# and save the data into an object named streb.

streb <- read.table(file.choose(), header=TRUE, sep="\t")
# This dataset contains information on the abundance and richness of three 
# species of bat ectoparasites on individual hosts (rows) collected at various 
# localities.

## TASK 36: Without using R, do you know what type of object streb is? Confirm
## your prediction using R.

dim(streb)
# Gives the dimensions of streb.


## TASK 37: How many variables and how many observations are there in this dataset?
## TASK 38: Get the names of the variables in this dataset.


rownames(streb)
# Obtains the names of the rows/observations in the dataset.

## TASK 39: Change the names of the row combining the characters "obs_" with the 
## name of the observation; for example 'obs_1', 'obs_2', etc.
## TASK 40: What is the structure of the dataset â€“ use the function str.
## TASK 41: Make a summary of the dataset -€“ use the function summary.


streb_sex <- streb$Sex
# You will learn more about indexing, but for now, the line above takes the 
# column named 'Sex' in the data frame streb, and puts that data into a new 
# object 'streb_sex'.
## TASK 42: What is the class of streb_sex? 

streb_sex.2 <- as.character(streb$Sex)
## TASK 43: What is the class of streb_sex.2? 

## TASK 44: Can you predict what the following lines of code will produce?
levels(streb_sex)
levels (streb_sex.2)


## TASK 45: Can you predict what the following lines of code will produce?
plot(streb_sex)
plot(streb_sex.2)

## Notice how these two lines print slightly different data
streb_sex
as.character(streb_sex)

## TASK 46: Use the function identical to test that streb_sex and streb_sex.2 have 
## the same data. Do they?

SexMatrix <- cbind(streb_sex, as.character(streb_sex))
# The cbind function concatenates vectors to make matrices, each vector becomes 
# a column ('cbind' = bind columns).

SexMatrix
## TASK 47: What happened with the data in the factor object streb_sex when making 
## a matrix with it? 

## Run the following code, which creates a number of vectors:
V1 <- rnorm(10)
class(V1)

V2 <- rpois(10,  5)
class(V2)

V3 <- sample(letters, 10)
class(V3)

V4 <- sample(c(TRUE, FALSE), 11, replace=TRUE)
class(V4)

## TASK 48: Can you predict why the following will produce an error?
DF <- data.frame(V1, V2, V3, V4)

## TASK 49: Change how V4 was created making it have only 10 elements. Then 
## produce a data frame with vectors V1 to V4. 
## TASK 50: Produce a list with the name DF.list that has the same data as DF, 
## and where each element in the list is one of the vectors V1 to V4.




















################################################################################
### TASK SOLUTIONS                                                           ###
################################################################################

## TASK 1 ##
class(rand.1) # Numeric vector


## TASK 2 ##
mode(rand.1)


## TASK 3 ##
length(rand.1)


## TAKS 4 ##
mean(rand.1)
sd(rand.1)


## TASK 5 ##
rand.1 <- rand(100, mean=5, sd=1.5)


## TAKS 6 ##
mean(rand.1)
sd(rand.1)
# No, because these are independent random draws


## TASK 7 ##
rand.2 <- as.character(rand.1)


## TASK 8 ##
help(identical)
# Tests whether two objects are exactly equal. It is false because one is a 
# numeric vector and the other is a character vector


## TASK 9 ##
rand.3 <- as.numeric(rand.2)


## TASK 10 ##
rand.1 - rand.3
# Differences are close to, but not exactly, zero. In the change of data type
# some precision is lost 


## TASK 11 ##
help(sample)
sample(x=seq.1, size=10, replace=TRUE)


## TASK 12 ##
rand.3 <- as.character(sample(1:10, size=300, replace=TRUE))


## TASK 13 ##
rand.5 <- as.factor(rand.4)


## TASK 14 ##
class(rand.5)


## TASK 15 ##
help(rpois)
# rpois draws random values from a Poisson distribution
M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
                    # 1. Create a vector of 1000 values from a Poisson distribution
                    #    with lambda=1.
                    # 2. Create another vector like in step 1. 
                    # 3. Multiply vectors created in steps 1 and 2.
                    # 4. Put the result of step 3 into a matrix of 50 columns, 
                    #    and as many rows as necessary.


## TASK 16 ##
# 50 columns determined when setting parameter ncol=50
# 20 rows because, with 50 columns, 20 rows are needed to store 1000 values
# length of 1000 because there are 1000 values in this matrix
dim(M.abund)
length(M.abund)


## TASK 17 ## 
# When using *M.abund*, we hope to be accessing the values within the object (matrix). 
# Because it is between quotation marks, we are telling this is a piece of text, 
# not the name of an object
colnames(M.abund) <- paste("sp", 1:ncol(M.abund), sep="_")


## TASK 18 ##
# It will be character because, even though the values inside of *M.abund* are numbers
# the names of *M.abund* are text. Here we are asking for the class of the names, 
# not the class of the values inside the matrix
class(colnames(M.abund))


## TASK 19 ##
rownames(M.abund) <- paste("site", 1:nrow(M.abund), sep="_")


## TASK 20 ##
class(M.presence)
mode(M.presence)


## TASK 21 ##
names(spp.abund)
# These are the sums per column, so the names came from the column names of M.presence


## TASK 22 ##
help(lm)
# lm fits linear models


## TASK 23 ##
class(LM.abund.occup)


## TASK 24 ##
str(LM.abund.occup)


## TASK 25 ##
summary(LM.abund.occup)


## TASK 26 ##
plot(spp.occup, spp.abund, cex=1.5, pch=21, col="black", bg="grey30", 
  xlab="Species Occupancy", ylab="Species Mean Abundance")


## TASK 27 ##
site.density <- rowSums(M.abund)
site.rich <- rowSums(M.presence)

plot(site.density, site.rich, cex=1.5, pch=21, col="black", bg="grey30", 
  xlab="Site Density", ylab="Site Richness")

LM.rich.dens <- lm(site.rich~site.density)
summary(LM.rich.dens)


## TASK 28 ##
path.to.folder <- "C:\\Users\\stello\\Dropbox\\Teaching\\R_Basics_Workshop\\"


## TASK 29 ##
class(path.to.folder)


## TASK 30 ##
help(rm)
# rm removes objects from the R session


## TASK 31 ##
write.table(sim.matrix, file=paste(path.to.folder, "nameIlike.txt", sep=""), sep=",")


## TASK 32 ##
class(L.vector)
mode(L.vector)
length(L.vector)


## TASK 33 ##
seq(from=1, to=length(L.vector), by=1)
# or
1:length(L.vector)


## TASK 34 ##
names(L.vector) <- 1:length(L.vector)


## TASK 35 ##
L <- matrix(L.vector, nrow=5)


## TASK 36 ##
# data.frame. The function *read.table* always produces data.frames
class(streb)


## TASK 37 ##
dim(streb)
# 139 observations
# 13 variables


## TASK 38 ##
colnames(streb)


## TASK 39 ##
rownames(streb) <- paste("obs", 1:nrow(streb), sep="_")


## TASK 40 ##
str(streb)


## TASK 41 ##
summary(streb)


## TASK 42 ## 
class(streb_sex)


## TASK 43 ##
class(streb_sex.2)


## TASK 44 ##
levels(streb_sex) # Will return the levels of the variable
levels(streb_sex.2) # Will return nothing because this is not a factor 


## TASK 45 ##
plot(streb_sex) # Will plot the number of observations per level
plot(streb_sex.2) # Will plot nothing because this is a character vector


## TASK 46 ##
identical(streb_sex, streb_sex.2)


## TASK 47 ##
SexMatrix
# Because matrices can contain only one type of data, numbers were transformed 
# into text


## TASK 48 ##
# Because the last element used to build the data.frame contains 11 rows, when 
# all the others contain 10


## TASK 49 ##
V4 <- sample(c(TRUE, FALSE), 10, replace=TRUE)
DF <- data.frame(V1, V2, V3, V4)


## TASK 50 ##
DF.list <- list(V1, V2, V3, V4)
str(DF.list)






