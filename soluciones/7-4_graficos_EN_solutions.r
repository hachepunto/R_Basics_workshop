################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 7-4: Graphics - SOLUTIONS                                       ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## This file holds the solutions to the exercise. It is NOT the file you hand
## in: work on "7-4_graficos_EN.r" and use this one only to check your answers.

## MIND THE WORKING DIRECTORY:
## Even though this file lives in the "soluciones" folder, your working
## directory must be the workshop folder (the one above, which contains
## "Datasets" and "soluciones"). R resolves paths against the working directory,
## not against the location of the file. In RStudio: Session > Set Working
## Directory > Choose Directory, and pick the workshop folder.

if (!file.exists("7-4_graficos_EN.r")) {
  stop("Wrong working directory.\n",
       "  You are in: ", getwd(), "\n",
       "  It should be the workshop folder, the one containing 'Datasets'.")
}

## This line re-runs the exercise, so that every object the solutions need
## exists.
source("7-4_graficos_EN.r")


## TASK 1 ##
# Already solved in the body above for the CO2 file.


## TASK 2 ##
paises <- c("Mexico", "United.States", "Brazil", "Canada", "China", "India",
            "Germany", "France", "Japan", "Australia")

# Check that all of them really are column names; a typo here gives you a
# column of NAs and no error message:
paises %in% colnames(CO2)

emis.2010 <- CO2["2010", paises]
emis.2010

par(mar = c(8, 5, 3, 2)) # extra room at the bottom for the country names

barplot(sort(emis.2010, decreasing = TRUE),
        las = 2,                      # vertical labels
        col = "steelblue3", border = NA,
        ylab = "CO2 emissions (2010)",
        main = "CO2 emissions in 2010",
        cex.names = 0.9)

par(mar = c(5, 4, 4, 2) + 0.1) # back to the default margins


## TASK 3 ##
dir.create("salidas", showWarnings = FALSE)

emis.1960 <- CO2["1960", paises]

pdf(file = "salidas/co2_1960.pdf", width = 8, height = 6)

  par(mar = c(8, 5, 3, 2))
  barplot(sort(emis.1960, decreasing = TRUE),
          las = 2, col = "firebrick3", border = NA,
          ylab = "CO2 emissions (1960)",
          main = "CO2 emissions in 1960",
          cex.names = 0.9)

dev.off()

list.files("salidas/")


## TASK 4 ##
x <- CO2["1990", ]
y <- CO2["2010", ]

# Keep only the countries that have data in BOTH years. Note that '&' compares
# element by element, which is exactly what we want here:
completos <- !is.na(x) & !is.na(y)
sum(completos) # how many countries survived the filter

x <- x[completos]
y <- y[completos]

plot(x, y, pch = 21, bg = "grey60", col = "white", cex = 1.2,
     xlab = "CO2 emissions in 1990", ylab = "CO2 emissions in 2010",
     cex.lab = 1.3, cex.axis = 1.2, las = 1)

# Most countries are tiny and a handful are huge, so the cloud is squashed into
# one corner. On a log scale the relationship is much easier to see:
plot(x, y, pch = 21, bg = "grey60", col = "white", cex = 1.2, log = "xy",
     xlab = "CO2 emissions in 1990 (log)", ylab = "CO2 emissions in 2010 (log)",
     cex.lab = 1.3, cex.axis = 1.2, las = 1)


## TASK 5 ##
modelo <- lm(log10(y) ~ log10(x))
summary(modelo)

abline(modelo, col = "firebrick2", lwd = 2)
# The slope is close to 1: a country's emissions in 2010 are, roughly, a fixed
# multiple of its emissions in 1990.
