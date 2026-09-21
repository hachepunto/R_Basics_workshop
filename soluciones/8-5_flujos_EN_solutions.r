################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-5: Flow control - SOLUTIONS                                   ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## This file holds the solutions to the exercise. It is NOT the file you hand
## in: work on "8-5_flujos_EN.r" and use this one only to check your answers.

## MIND THE WORKING DIRECTORY:
## Even though this file lives in the "soluciones" folder, your working
## directory must be the workshop folder (the one above, which contains
## "Datasets" and "soluciones"). R resolves paths against the working directory,
## not against the location of the file. In RStudio: Session > Set Working
## Directory > Choose Directory, and pick the workshop folder.

if (!file.exists("8-5_flujos_EN.r")) {
  stop("Wrong working directory.\n",
       "  You are in: ", getwd(), "\n",
       "  It should be the workshop folder, the one containing 'Datasets'.")
}

## This line re-runs the exercise, so that every object the solutions need
## exists.
source("8-5_flujos_EN.r")


## TASK 1 ##
## The task can be accomplished in multiple ways; this is only one of them.

dir.create("salidas", showWarnings = FALSE)

pdf(file="salidas/ListOfLinesAndSymbols.pdf", height=7, width=7*1.75) # Creates the pdf file

  par(mfrow=c(1,2)) # Splits the graphic into two panels
  
  
  plot(c(0.5, 7.5), c(0.5, 7.5), type="n", axes=FALSE, main="lty", ylab="", 
    xlab="", cex.main=2) # Creates an empty graphic

  for(i in 1:7) # Loops through 7 options for lines
  {
  	abline(h=i, lty=i, lwd=2) # Creates a line of lty type equal to "i"
  	text(1, i, labels=i, pos=3, offset = 0.65)
  }
    
    
  plot(c(0.5, 5.5), c(0.5, 5.5), type="n", axes=FALSE, main="pch", ylab="", 
    xlab="", cex.main=2) # Creates an empty graphic
  
  count <- 0 # Creates a variable that will increase in value counting the number 
             # of cases that have been developed with each iteration of the loop
  
  for(i in 1:5) # Loops through 5 positions along the y axis
  {
  	for(j in 1:5) # for each position in y, loops through 5 positions in x
  	{
  		count <- count+1 # Increases the value of the counting variable
  		
  		points(j, i, pch=count, cex=2, col="black", bg="grey70") # Creates a point
  		                                                         # of pch type 
  		                                                         # equal to "count"
  		text(j, i, labels=count, pos=2, offset = 0.65)
  	}
  }

dev.off()

list.files("salidas/")
