################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-6: Flow control - SOLUTIONS                                   ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## This file holds the solutions to the exercise. It is NOT the file you hand
## in: work on "8-6_flujos_EN.r" and use this one only to check your answers.

## MIND THE WORKING DIRECTORY:
## Even though this file lives in the "soluciones" folder, your working
## directory must be the workshop folder (the one above, which contains
## "Datasets" and "soluciones"). R resolves paths against the working directory,
## not against the location of the file. In RStudio: Session > Set Working
## Directory > Choose Directory, and pick the workshop folder.

if (!file.exists("8-6_flujos_EN.r")) {
  stop("Wrong working directory.\n",
       "  You are in: ", getwd(), "\n",
       "  It should be the workshop folder, the one containing 'Datasets'.")
}

## This line re-runs the exercise, so that every object the solutions need
## exists.
source("8-6_flujos_EN.r")


## TASK 1 ##
# Already solved in the body above.


## TASK 2 ##
# 'region$longitude > -100' is TRUE for cells east of that meridian;
# 'region$latitude > 25' is TRUE for cells north of that parallel. '&' compares
# element by element and is TRUE only where BOTH conditions hold, so the result
# keeps the cells that satisfy the two at the same time.


## TASK 3 ##
# (a) 'source.point' picks a POSITION WITHIN 'geo.range' (a number between 1 and
#     the current range size), not a row of 'region'. That is why the code then
#     writes 'geo.range[source.point]' to get the actual row.
# (b) Because the species can only colonize cells it does not already occupy.
#     The negative index drops the occupied rows.
# (c) 'order' returns the positions that would sort the vector, so '[1]' is the
#     position of the SMALLEST distance, i.e. the nearest unoccupied cell.
# (d) Inside the loop you see the range grow cell by cell. Outside, you only see
#     the final result. Plotting inside is much slower, because it redraws on
#     every iteration.


## TASK 4 ##
# On iteration 'i' the range holds 'i' cells, so the loop computes
# nrow(region) - i distances, sorts all of them with 'order', and rebuilds
# 'celdas.disponibles' from scratch. The sorting is the expensive part: it costs
# far more than finding a single minimum. Using 'which.min(geodistance)' instead
# of 'order(geodistance)[1]' gives exactly the same answer and is noticeably
# faster, because it does not sort anything.


## TASK 5 ##
# Only the choice of the new cell changes: instead of taking the nearest one,
# take a random one among the 5 nearest. The resulting range is less compact and
# more ragged at the edges.
#
# geo.range <- sample(1:nrow(region), 1)
#
# for (i in 1:AOO)
# {
#   source.point <- sample(1:length(geo.range), 1)
#
#   dif.lon <- region$longitude[geo.range[source.point]] - region$longitude[-geo.range]
#   dif.lat <- region$latitude[geo.range[source.point]]  - region$latitude[-geo.range]
#
#   geodistance <- sqrt(dif.lon^2 + dif.lat^2)
#
#   celdas.disponibles <- (1:nrow(region))[-geo.range]
#
#   cercanas <- celdas.disponibles[order(geodistance)[1:5]]
#
#   geo.range <- c(geo.range, sample(cercanas, 1))
# }
