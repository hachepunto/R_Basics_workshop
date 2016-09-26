################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-6: Flow control                                               ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops

# The code below simulates the geographic range of a species within USA. In 
# particular, it simulates the area of occupancy (AOO) of the species. This kind 
# of simulation has been used in papers like: Sheth et al. 2012. Understanding 
# bias in geographic range size estimates. Global Ecology and Biogeography 21: 
# 732-–742.


## Make sure your working directory is the workshop folder


## TASK 1 ##
## Create an object named 'region' by opening the file 'Data_Region.txt' 
## using the function 'read.table'. This file contains coordinates for tree 
## plots across USA from http://fia.fs.fed.us/). Note that "RegionData.txt" has 
## comma-separated values and column headers.  


plot(region[,c(2,1)], asp=1, cex=0.25, pch=16, col="darkolivegreen2")
# Plots the coordinates of the cells


# We are going to use only the eastern part of the US, so we eliminate data west 
# of longitude -85
region <- region[-which(region$LONG<=-85),]


## TASK 2 ##
## Make a new map with this sub-set of the data


geo.range <- sample(1:nrow(region), 1)
points(region[geo.range, c(2, 1)], cex=0.25, pch=16, col="red")
# Select the first cell that will be part of the geographic range of the 
# species and plots it


AOO <- 1000
# Defines the size of the geographic range in terms of the number of cells 
# occupied by a species (i.e., AOO)


# Expands the geographic range until the predetermined value of AOO is reached:
for(i in 1:AOO)
{
  print(i)
  
	# Select next source point from within the species geographic range
  source.point <- sample(1:length(geo.range), 1)
	
  # Calculates the distances from the selected occupied cell to other unoccupied cells
  dif.lon <- region[geo.range[source.point], 2] - region[-geo.range, 2]
	dif.lat <- region[geo.range[source.point], 1] - region[-geo.range, 1]

	geodistance <- sqrt(dif.lon^2 + dif.lat^2)

  
  # Selects the unoccupied cell that is closes to the selected occupied cell
	o <- order(geodistance)

	areas.disponibles <- c(1:nrow(region))[-geo.range]	
  
  new.cell <- areas.disponibles[o[1]]

	geo.range <- append(geo.range, new.cell, after=length(geo.range))

  
  ## TASK 3 ##
  ## Add a line of code that uses the 'points' function to plot the 
  ## updated geographic range of the species

  
}


# Examine in a more detailed map of the simulated geographic range
plot(region[,c(2,1)], asp=1, cex=0.75, pch=16, col="darkolivegreen2", 
  xlim=range(region[geo.range, 2]), ylim=range(region[geo.range, 1]))
points(region[geo.range, c(2, 1)], cex=0.75, pch=16, col="red")



















################################################################################
### TASK SOLUTIONS #############################################################
################################################################################

## TASK 1 ## 
region <- read.table(file=file.choose(), header=TRUE, sep=",")


## TASK 2 ##
plot(region[,c(2,1)], asp=1, cex=0.25, pch=16, col="darkolivegreen2")


## TASK 3 ##
points(region[geo.range, c(2, 1)], cex=0.25, pch=16, col="red")




