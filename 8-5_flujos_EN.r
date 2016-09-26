################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-5: Flow control                                               ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################

## OBJECTIVE:
## Practice the use of 'for' loops "


## TASK 1 ##
## Use loops to create a figure similar to that of the file 
## "ListOfLinesAndSymbols.pdf" that you can download from the website of the 
## workshop. This figure must show how different values to the arguments lty and
## pch of the function "plot.default" results in different lines and symbols in 
## a figure. Make sure the resulting figure is saved as a file as well.

 







































################################################################################
### TASK SOLUTIONS #############################################################
################################################################################

## TASK 1 ##
## The task can be accomplished in multiple wasy, this TASK solution indicates 
## only one.

pdf(file="ListOfLinesAndSymbols.pdf", height=7, width=7*1.75) # Creates the pdf file

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


