################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 7.1: Object manipulation (and a bit on graphics)                ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

### INTRODUCTION ###############################################################
# In this exercise you will explore values of the predictor variables for model 
# IGM2 (the model discussed in exercise 5.1). You will use a dataset with 
# values of annual rainfall (Ran, in mm), minimum monthly potential 
# evapotranspiration (PETmin, in milimeters) and elevation range (TOPOG, in 
# meters) for areas across the Western Neotropics. 


#### TASK 1. ###
# Define your working directory using function "setwd". Verify the working 
# directory using function "getwd".


#### TASK 2. ###
# Use function "read.table" to create a data frame called "neo_IGM2" with the 
# data in file "data_neotropicooccidente_igm2.txt" (available in the workshop 
# website). This file has values separated by comas and columns with headings. 
# The file contains values of Ran, PETmin and TOPOG for various Neotropical 
# areas. Each area is identified by a number (column "Point.id") and coordinates 
# "Lat" and "Lon"). This coordinates are geographically projected so that they 
# correspond to the center of equal area grid cells (i.e., they are not latitude 
# longitude values in decimal degrees). Each area is 100 km x 100 km. Once you 
# have the data frame, examine the first five rows typing: "neo_IGM2[1:5,]".   


#### TASK 3. ###
# The data frame "neo_IGM2" has various geographic areas missing values for Ran, 
# PETmin or TOPOG values. These areas show "NA" rather than numeric values under 
# various columns. The following code uses function "plot" along with rectangular
# brackets (for indexing) to visualize all areas in "neo_IGM2". Then it uses
# function points with rectangular brackets (for indexing) to distinguish areas
# with numeric values for Ran, PETmin and TOPOG.   

plot(neo_IGM2[,2], neo_IGM2[,3])
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


#### TASK 4. ###
# To better represent the Western Neotropics use argument "asp=1" of function 
# "plot." Read about this argument in the help page for function "plot".

plot(neo_IGM2[,2], neo_IGM2[,3], asp=1)
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


#### TASK 5. ###
# Use and study the following code to examine the relationship between Ran and 
# PETmin across the Neotropics:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")
#or
plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")

#### TASK 6. ###
# Carry out a modified version of TASK 5 using arguments "cex.axis" and "cex.lab". Use and 
# study this code:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", cex.axis=1.5, cex.lab=1.5)


#### TASK 7. ###
# Inspect the relationship between Ran and the natural logarithm of TOPOG using 
# function "plot".


#### TASK 8. ###
# View the relationship between PETmin and the natural logarithm of TOPOG using 
# function "plot"


#### TASK 9. ###
# Calculate the range of the values of Ran using function "range". See help for 
# function "range". Study this code:

range(neo_IGM2[!is.na(neo_IGM2[,4]),4])


#### TASK 10. ###
# a researcher attempts to obtain the range of values of Ran across the 
# Neotropics using this code:

range(neo_IGM2[,4])

# There is a problem. See? Describe the problem and solve it. Read the help page 
# for function "range".


#### TASK 11. ###
# Calculate the range of values of PETmin.


#### TASK 12. ###
# Calculate the range of values of TOPOG


#### TASK 13. ###
# Carry out modified versions of TASKS 3 to 12 using operator "$" and the names of the columns 
# of "neo_IGM2". By example, for TASK 3, use this code:

plot(neo_IGM2$Lon, neo_IGM2$Lat)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], pch=19)


#### TASK 14. ###
# There is yet another way to access the variables in a data frame: using rectangular 
# brackets and the variable name in quotation marks:

neo_IGM2["Lon"]

# However, there is a difference between neo_IGM2[,2] and neo_IGM2$Lon, on the 
# one hand, and neo_IGM2["Lon"] on the other hand. What is it? See page 11 of 
# "R for beginners". This difference can be seen using this code:

class(neo_IGM2[,2])
class(neo_IGM2$Lon)
class(neo_IGM2["Lon"])

is.vector(neo_IGM2[,2])
is.vector(neo_IGM2$Lon)
is.vector(neo_IGM2["Lon"])

attributes(neo_IGM2[,2])
attributes(neo_IGM2$Lon)
attributes(neo_IGM2["Lon"])


#### TASK 15. ###
# Use the following code to observe some of the consequences of the difference 
# between neo_IGM2[,2] and neo_IGM2$Lon, on the one hand, and neo_IGM2["Lon"]
# on the other. Read carefully the error message after the third line of code 
# and explain the problem.

plot(neo_IGM2[,2], neo_IGM2[,3])
plot(neo_IGM2$Lon, neo_IGM2$Lat)
plot(neo_IGM2["Lon"], neo_IGM2["Lat"])


#### TASK 16. ###
# Use rectangular brackets (for indexing) to extract from "neo_IGM2" only areas with 
# numerical values of Ran, PETmin, y TOPOG. Save the result in a data frame 
# named "Neot.occ.IGM2". Use and study this code:

Neot.occ.IGM2 <- neo_IGM2[!is.na(neo_IGM2[,4]),]
Neot.occ.IGM2[1:5,]

# Now the code to examine certain relationships is simpler. By example, for 
# TASK 3 use:

plot(neo_IGM2[,2], neo_IGM2[,3])
points(Neot.occ.IGM2[,2], Neot.occ.IGM2[,3], pch=19)


#### TASK 17. ###
# Use the function "read.table" to create a data frame named "neo_COL" with data 
# from the file "neotropicooccidente_col.txt" (available in the workshop website. 
# Under the column "Especimenes" of the file "data_neotropicooccidente_col.txt" you
# will find the number of herbarium specimens that have been collected in
# various Neotropical areas. A researcher wants to use these specimens to 
# calculate species richness in various areas to test predictions derived from 
# the IGM2. Each area is identified with a number under column "Point.id" and 
# coordinates ("Lat" y "Lon"). As before the coordinates are projected. Keep in 
# mind that the columns in file "neotropicooccidente_col.txt" have headers and 
# that values are separated by commas. After creating the data frame, examine 
# the first five rows typing "neo_COL[1:5,]"   


#### TASK 18. ###
# Data frame "neo_COL" has geographic areas for which there is no information 
# on the number of specimens available. These areas have "NA" instead of 
# a numeric value in column "Especimenes". Use square brackets (for indexing) to 
# extract from the data frame "neo_COL" only numeric values for "Especimenes". 
# Store the results in a data frame named "Neot.occ.COL". Examine your result by 
# looking at the first five rows typing "Neot.occ.COL[1:5,]".  


#### TASK 19. ###
# What are the dimensions of "Neot.occ.IGM2" and "Neot.occ.COL"? Use function 
# "dim". Do "Neot.occ.IGM2" and "Neot.occ.COL" have the same number of rows?


#### TASK 20. ###
# Use function "identical", in combination with square brackets (for indexing), 
# to determine if the first three columns of "Neot.occ.IGM2" are identical to 
# the respective columns of "Neot.occ.COL".


#### TASK 21. ###
# If the three first columns of "Neot.occ.IGM2" are identical to those of 
# "Neot.occ.COL", proceed to consolidate the data into a single data frame.
# Otherwise, examine your code to discover the cause of differences. Consolidate 
# the data frames into a single data frame named "Neot.occ". Use function "cbind" 
# to join all columns of "Neot.occ.IGM2" to the fourth column of "Neot.occ.COL". 

Neot.occ <- cbind(Neot.occ.IGM2, Neot.occ.COL[,4])

#examine the first five rows of your result:

Neot.occ[1:5,]

# Change the name of the last column of "Neot.occ" using function "colnames". 
# First use this code to see the column names of "Neot.occ":

colnames(Neot.occ)

#Use square brackets (for indexing) to see the name you will change:

colnames(Neot.occ)[7]

#now change the name using operator "assign":

colnames(Neot.occ)[7] <- "Especimenes"

#See the result:

Neot.occ[1:5,]

#Examine the attributes of "Neot.occ", and make sure that it is a data frame:

attributes(Neot.occ)


#### TASK 22. ###
# Examine the distribution of the number of specimens in areas included in 
# "Neot.occ" using function "summary". 


#### TASK 23. ###
# How many areas are there in "Neot.occ" with less than 500 herbarium specimens?
# What is the proportion of the areas in "Neot.occ" with less than 500 herbarium 
# specimens?


#### TASK 24. ###
# How many areas are there in "Neot.occ" with less than 1000 herbarium specimens?
# What is the proportion of the areas in "Neot.occ" with less than 1000 
# herbarium specimens?
# How many areas are there in "Neot.occ" with less than 2000 herbarium 
# speciments?
# What is the proportion of the areas in "Neot.occ" with less than 2000 
# herbarium specimens?
# How many areas are there in "Neot.occ" with less than 3000 herbarium speciments?
# What is the proportion of the areas in "Neot.occ" with less than 3000 
# herbarium specimens?


#### TASK 25. ###
#Create a map of the areas included in "Neot.occ" using the following code:

plot(Neot.occ[,2], Neot.occ[,3], asp=1, xlab="Longitude (m)", ylab="Latitude (m)", cex.axis=1.5, cex.lab=1.5)


### TASK 26. ###
# Use funtion "points" to distinguish (in the map you created) areas with at least 
# 3000 herbarium specimens. A researcher plans to use these areas to test 
# preditions derived from the IGM2, given they are relatively well sampled. OK, 
# 3000 specimens is not much for areas of 100 km x 100 km (that is the size of 
# the areas in "Neot.occ"), but it is relatively high for the Neotropics.


#### TASK 27. ###
# Examine the relationship between Ran and PETmin across the areas in "Neot.occ" 
# using function plot in combination with square brackets (for indexing).


#### TASK 28. ###
# Use function "points" to distinguish (in the figure you created in TASK 
# 27) areas with at least 3000 herbarium specimens. If the researcher were to 
# focus on these areas, would she be missing any significant portion of the 
# environmental space defined by Ran and PETmin?


#### TASK 29. ###
# Examine the relationship between Ran and the natural logarithm of TOPOG 
# across the areas in "Neot.occ" using function plot and square brackets for 
# indexing. Use function "points" to distinguish areas with at least 3000 
# herbarium specimens. If the researcher were to focus on these areas with at 
# least 3000 specimen records, would she be missing major areas of the 
# environmental space defined by Ran and TOPOG?


#### TASK 30. ###
# Examine the relationship between PETmin and the natural logarithm of TOPOG 
# across the areas in "Neot.occ" using function plot and square brackets. Use 
# function "points" to distinguish areas with at least 3000 herbarium specimens 
# and determine if the researcher would be missing major sections of the 
# environmental space defined by PETmin and TOPOG.


#### TASK 31. ###
# Calculate the range of Ran, PETmin and TOPOG for areas in "Neot.occ" that have 
# at least 3000 herbarium specimens.



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
setwd("C:/_transfer/R_Basics_Workshop/St_Louis_May_2015/Drafts/Day2") #this is the wrking directory at Ivan's laptop
getwd()


## TASK 2 ##
neo_IGM2 <- read.table("data_neotropicooccidente_igm2.txt", header=T, sep=",")
neo_IGM2[1:5,]
#or
head(neo_IGM2) #have a look at the help page of function "head"

## TASK 3 ##
# you already have the answer


## TASK 4 ##
# you already have the answer


## TASK 5 ##
# you already have the answer


## TASK 6 ##
# you already have the answer


## TASK 7 ##
plot(neo_IGM2[,4], log(neo_IGM2[,6]), pch=19, xlab="Ran (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 


## TASK 8 ##
plot(neo_IGM2[,5], log(neo_IGM2[,6]), pch=19, xlab="PETmin (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)


## TASK 9 ##
# you already have the answer


## TASK 10 ##
range(neo_IGM2[!is.na(neo_IGM2[,4]),4])
#or
range(neo_IGM2[,4], na.rm=T)


#### TASK 11. ###
range(neo_IGM2[!is.na(neo_IGM2[,5]),5])
#or
range(neo_IGM2[,5], na.rm=T)


#### TASK 12. ###
range(neo_IGM2[!is.na(neo_IGM2[,6]),6])
#or
range(neo_IGM2[,6], na.rm=T)


#### TASK 13. ###

plot(neo_IGM2$Lon, neo_IGM2$Lat, asp=1)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], pch=19)

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", cex.axis=1.5, cex.lab=1.5)

plot(neo_IGM2$Ran, log(neo_IGM2$TOPOG), pch=19, xlab="Ran (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

plot(neo_IGM2$PETmin, log(neo_IGM2$TOPOG), pch=19, xlab="PETmin (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

range(neo_IGM2$Ran[!is.na(neo_IGM2$Ran)])
#or
range(neo_IGM2$Ran, na.rm=T)

range(neo_IGM2$PETmin[!is.na(neo_IGM2$PETmin)])
#or
range(neo_IGM2$PETmin, na.rm=T)

range(neo_IGM2$TOPOG[!is.na(neo_IGM2$TOPOG)])
#or
range(neo_IGM2$TOPOG, na.rm=T)


#### TASK 14. ###
#The attributes of the original object are kept when elements of an object are accessed using names, a procedure
#best referred to as "subsetting". In contrast, the attributes of the original object are not kept when rectangular
#brackets (for indexing), or the operator "$", are used to access elements of an object. The latter procedure
#is thus referred to as "extraction".


#### TASK 15. ###
# you already have the answer


#### TASK 16. ###
# you already have the answer


#### TASK 17. ###
neo_COL <- read.table("data_neotropicooccidente_col.txt", header=T, sep=",")
neo_COL[1:5,]
#or
head(neo_COL) #have a look at the help page of function "head"


#### TASK 18. ###
Neot.occ.COL <- neo_COL[!is.na(neo_COL$Especimenes),]
Neot.occ.COL[1:5,]
head(Neot.occ.COL)


#### TASK 19. ###
dim(Neot.occ.IGM2)
dim(Neot.occ.COL)
#Yes, "Neot.occ.IGM2" and "Neot.occ.COL" do have the same number of rows.


#### TASK 20. ###
identical(Neot.occ.IGM2[,1:3], Neot.occ.COL[,1:3])

#### TASK 21. ###
# you already have the answer


#### TASK 22. ###
summary(Neot.occ$Especimenes)


#### TASK 23. ###
#number of areas with less than 500 herberium specimens:
sum(Neot.occ$Especimenes<500)
#proportion of areas with less than 500 herberium specimens:
sum(Neot.occ$Especimenes<500)/length(Neot.occ$Especimenes)


#### TASK 24. ###
# areas with less than 1000 herbarium specimens
sum(Neot.occ$Especimenes<1000)
# proportion of the areas in "Neot.occ" with less than 1000 
# herbarium specimens?
sum(Neot.occ$Especimenes<1000)/length(Neot.occ$Especimenes)

# areas with less than 2000 herbarium specimens
sum(Neot.occ$Especimenes<2000)
# proportion of the areas in "Neot.occ" with less than 2000 
# herbarium specimens
sum(Neot.occ$Especimenes<2000)/length(Neot.occ$Especimenes)

# areas with less than 3000 herbarium specimens
sum(Neot.occ$Especimenes<3000)
# proportion of the areas in "Neot.occ" with less than 3000 
# herbarium specimens
sum(Neot.occ$Especimenes<3000)/length(Neot.occ$Especimenes)


#### TASK 25. ###
# you already have the answer


### TASK 26. ###
points(Neot.occ[Neot.occ$Especimenes>=3000,2], Neot.occ[Neot.occ$Especimenes>=3000,3], pch=19, col="red")


#### TASK 27. ###
plot(Neot.occ[,4], Neot.occ[,5], xlab="Annual mean precipitation (mm)", ylab="Min. monthly potential evapotranspiration (mm)", cex.axis=1.5, cex.lab=1.5)


#### TASK 28. ###
points(Neot.occ[Neot.occ$Especimenes>=3000,4], Neot.occ[Neot.occ$Especimenes>=3000,5], pch=19, col="red")


#### TASK 29. ###
plot(Neot.occ[,4], log(Neot.occ[,6]), xlab="Annual mean precipitation (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,4], log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


#### TASK 30. ###
plot(Neot.occ[,5], log(Neot.occ[,6]), xlab="Min. monthly potential evapotranspiration (mm)", ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,5], log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


#### TASK 31. ###
range(Neot.occ[Neot.occ$Especimenes>=3000,4])
range(Neot.occ[Neot.occ$Especimenes>=3000,5])
range(Neot.occ[Neot.occ$Especimenes>=3000,6])


