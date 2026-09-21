################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-6: Flow control: simulating a geographic range                ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops.

# The code below simulates the geographic range of a species. More precisely, it
# simulates its area of occupancy (AOO), by starting from one cell and
# repeatedly annexing the nearest unoccupied cell. This kind of simulation has
# been used in papers such as Sheth et al. 2012, "Understanding bias in
# geographic range size estimates", Global Ecology and Biogeography 21: 732-742.

## WORKING DIRECTORY:
## This exercise reads a file from the "Datasets" folder, so your working
## directory must be the workshop folder (the one that contains "Datasets").

## NOTE: earlier versions of this exercise used a file of US forest-plot
## coordinates that is not part of this repository. It now uses the New World
## bat dataset, whose first columns are the coordinates of 100 x 100 km cells.


## TASK 1 ##
## Open the file below and create an object named 'region'. It is
## tab-separated, with column names in the first row. The columns we care about
## are 'longitude' and 'latitude', the centre of each 100 x 100 km cell.

region <- read.table("Datasets/data_batsenviroamerica.txt", header = TRUE,
                     sep = "\t")

dim(region)
head(region)

# Plots the coordinates of all the cells
plot(region$longitude, region$latitude, asp = 1, cex = 0.25, pch = 16,
     col = "darkolivegreen2", xlab = "Longitude", ylab = "Latitude")


## TASK 2 ##
## We are going to use only the eastern part of North America, so we drop
## everything west of longitude -100 and south of latitude 25. Explain what
## each of the two conditions below does, and why they are joined with '&'.

region <- region[region$longitude > -100 & region$latitude > 25, ]
dim(region)

## Make a new map with this subset of the data:
plot(region$longitude, region$latitude, asp = 1, cex = 0.25, pch = 16,
     col = "darkolivegreen2", xlab = "Longitude", ylab = "Latitude")


# 'geo.range' will hold the ROW NUMBERS of the cells occupied by the species.
# We start from a single randomly chosen cell:
geo.range <- sample(1:nrow(region), 1)

points(region$longitude[geo.range], region$latitude[geo.range],
       cex = 0.25, pch = 16, col = "red")


AOO <- 500
# The target size of the geographic range, in number of occupied cells.


## TASK 3 ##
## Read the loop below carefully before running it. Then answer:
##  (a) What does 'source.point' pick, and from where?
##  (b) Why is 'region[-geo.range, ]' used to compute the distances?
##  (c) What does 'order(geodistance)[1]' give you?
##  (d) The last line inside the loop plots the newly annexed cell. Move it
##      outside the loop and compare: what changes and why?

# This loop grows the geographic range until it reaches the predetermined AOO:
for (i in 1:AOO)
{
  # Pick, at random, one of the cells the species already occupies. It will be
  # the source of the next colonization event:
  source.point <- sample(1:length(geo.range), 1)

  # Distances from that occupied cell to every UNOCCUPIED cell. The minus sign
  # in '-geo.range' drops the cells that are already occupied:
  dif.lon <- region$longitude[geo.range[source.point]] - region$longitude[-geo.range]
  dif.lat <- region$latitude[geo.range[source.point]]  - region$latitude[-geo.range]

  geodistance <- sqrt(dif.lon^2 + dif.lat^2)

  # The unoccupied cell closest to the source cell:
  o <- order(geodistance)

  celdas.disponibles <- (1:nrow(region))[-geo.range]

  new.cell <- celdas.disponibles[o[1]]

  # Annex it to the range:
  geo.range <- c(geo.range, new.cell)

  # Plot the newly occupied cell:
  points(region$longitude[new.cell], region$latitude[new.cell],
         cex = 0.25, pch = 16, col = "red")
}


length(geo.range) # Should equal AOO + 1: the seed cell plus AOO annexations


# A closer look at the simulated geographic range:
plot(region$longitude, region$latitude, asp = 1, cex = 0.75, pch = 16,
     col = "darkolivegreen2",
     xlim = range(region$longitude[geo.range]),
     ylim = range(region$latitude[geo.range]),
     xlab = "Longitude", ylab = "Latitude")
points(region$longitude[geo.range], region$latitude[geo.range],
       cex = 0.75, pch = 16, col = "red")


## TASK 4 ##
## The loop above gets slower as the range grows. Explain why, looking at how
## many distances it has to compute on each iteration.
## Hint: 'length(geo.range)' grows by one every time, and 'geodistance' is
## recomputed from scratch on every iteration.


## TASK 5 ##
## Modify the simulation so that, instead of always annexing the SINGLE closest
## cell, it picks at random among the 5 closest ones. How does the shape of the
## resulting range change?


################################################################################
### SOLUTIONS ##################################################################
################################################################################

## The solutions to this exercise live in a separate file:
##
##     soluciones/8-6_flujos_EN_solutions.r
##
## Try it on your own first and use that file afterwards to check your work. It
## re-runs this exercise by itself, so you can open it in a clean session:
##
##     source("soluciones/8-6_flujos_EN_solutions.r")
