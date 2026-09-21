################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 7-4: Graphics (advanced, un-assisted)                           ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

# NOTE that this exercise is a bit more advanced and un-assisted: it gives you
# the questions and only a sketch of the answers. You are expected to read the
# help pages and figure out the details.

## WORKING DIRECTORY:
## This exercise reads files from the "Datasets" folder, so your working
## directory must be the workshop folder (the one that contains "Datasets").
## Check it with getwd().

## NOTE: earlier versions of this exercise used an alcohol-consumption file that
## is not part of this repository. It now uses the CO2 emissions dataset, which
## has the same shape (countries x years) and is included in "Datasets".


## TASK 1 ##
# Open the two data files in R.
#
# (a) "Datasets/data_carbondioxideyearlyemissions.txt" is tab-separated, with
#     years as rows and countries as columns.
#
# (b) "Datasets/data_adultliteracy.xlsx" is an Excel file, which read.table
#     cannot open. You have two options: either open it in Excel/LibreOffice and
#     save a copy as a .txt or .csv file, or install a package that reads xlsx
#     directly:
#         install.packages("readxl")
#         library(readxl)
#         literacy <- read_excel("Datasets/data_adultliteracy.xlsx")
#
# The CO2 file is the one used in the solutions below, so that this exercise
# runs on its own.

CO2 <- read.table("Datasets/data_carbondioxideyearlyemissions.txt",
                  header = TRUE, row.names = 1, sep = "\t")
CO2 <- as.matrix(CO2)

dim(CO2)
CO2[1:5, 1:5]


## TASK 2 ##
# Choose a recent year and 10 countries of interest, and make a barplot
# comparing their CO2 emissions in that year.


## TASK 3 ##
# Make a similar barplot for a much earlier year and save it as a jpeg or pdf
# file, inside a "salidas" folder.


## TASK 4 ##
# Choose two recent years with a good amount of data. Now make a scatterplot
# relating emissions in the first year to emissions in the second. Note that
# some countries have NA in one year but not the other, and will need to be
# removed.


## TASK 5 ##
# Use the function lm to fit a regression to that relationship, saving the
# result into an object. Then use summary on that object to print the results.


################################################################################
### SOLUTIONS ##################################################################
################################################################################

## The solutions to this exercise live in a separate file:
##
##     soluciones/7-4_graficos_EN_solutions.r
##
## Try it on your own first and use that file afterwards to check your work. It
## re-runs this exercise by itself, so you can open it in a clean session:
##
##     source("soluciones/7-4_graficos_EN_solutions.r")
