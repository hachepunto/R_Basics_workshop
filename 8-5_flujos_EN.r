################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 8-5: Flow control: nested loops                                 ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJECTIVE:
## Practice the use of nested 'for' loops.


## TASK 1 ##
## Use loops to create a reference figure showing how different values of the
## arguments 'lty' (line type) and 'pch' (plotting symbol) look. The figure must
## have two panels: one with the 7 line types and one with the 25 symbols, each
## labelled with its number. Save the result as a PDF file in a "salidas"
## folder.
##
## Hint: the symbols panel needs a NESTED loop (a loop inside another loop),
## because you have to walk through positions in x AND in y.


################################################################################
### SOLUTIONS ##################################################################
################################################################################

## The solutions to this exercise live in a separate file:
##
##     soluciones/8-5_flujos_EN_solutions.r
##
## Try it on your own first and use that file afterwards to check your work. It
## re-runs this exercise by itself, so you can open it in a clean session:
##
##     source("soluciones/8-5_flujos_EN_solutions.r")
