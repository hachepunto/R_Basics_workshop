################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8.2: Graphics                                                   ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

## TASK 1 ##
# Open the data in Data_GlobalWoodDensity.txt saving it into an object named
# wood.density. This file contains data on the density of wood for many species 
# in various regions of the planet across woody plant families

## TASK 2 ##
# Make a pie chart that shows how many measurements there are for each family
# of plant. Before using the function pie, you need to calculate the frequencies
# per family using the function table. 
fam.freq <- table(wood.density$Family)

 
## TASK 3 ##
## Repeat the pie chart but only for the 5 species with most records
## In this and all other figures in this Exercise, make an effor to make them 
## look as good as possible. Choose good colors, good size fonts, make labels
## and titles, etc.


## TASK 4 ##
## Make a histogram of wood density values for all species. Add to that histogram
## another histogram that uses only the wood density values for North America
## and another for Australia (using the argument *add = TRUE*) 


## TASK 5 ##
# Choose 3 families of interest, and make a boxplot comparing the values of 
# wood density among those families.


## TASK 6 ##
# Save the last figure into a pdf file of high resolution




