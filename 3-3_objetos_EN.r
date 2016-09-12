################################################################################
### R BASICS WORKSHOP                                                        ###
### EXERCISE 3.2: The First Circle of the R Inferno: falling into the        ###
### Floating Point Trap                                                      ###
###                                                                          ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################

### INTRODUCTION ###############################################################
# According to Dante, an inscription posted at the gates of Hell hints at what
# lies beyond:
#
# "Per me si va ne la città dolente,
# per me si va ne l’etterno dolore,
# per me si va tra la perduta gente..."
#
# The First Circle of the R Inferno is "home of the virtuous pagans. These are
# people who live in ignorance of the Floating Point Gods" (page 9 in Burns, P.
# 2011. The R Inferno).
################################################################################

## TASK 1 ##
# Finite representation of numbers results in numerical error.
# The floating point representation approximates real numbers
# with limited precision. Examine the finite representation
# of 1/3, using the argument "digits" of the function "print"
# (see the help page of function "print" by typing in the
# console "?print" or "help(print)"):
1/3
print(1/3, digits=10)
print(1/3, digits=16)

## TASK 2 ##
# Finite representation of numbers afects operations.
# Examine the two numbers below, many would likely
# think they seem equal:
0.1
0.3/3
# yet, see what happens when performing an operation to ask if
# they are, indeed, equal:
0.1 == 0.3/3
# examine the difference between the two numbers
0.1 - 0.3/3
# take a closer look at the finite representation of each number:
print(0.1, digits=16)
print(0.3/3, digits=16)

## TASK 3 ##
# Explore the precision of your computer. In all cases below you
# know the answer should be larger than zero. See when your computer
# yields zero:
1e-10
print(1e-10, digits=20)
1e-11
print(1e-11, digits=20)
1e-12
print(1e-12, digits=20)
1e-20
print(1e-20, digits=20)
1e-40
print(1e-40, digits=20)
#keep increasing the magnitude of the exponent until you get zero

## TASK 4 ##
# Similar to the previous task. In all cases below you know the answer
# is "TRUE". See when your computer yields the wrong answer:
1+1e10 > 1e10
1+1e11 > 1e11
1+1e12 > 1e12
#keep increasing the magnitude of the exponent until you get "FALSE"

## TASK 5 ##
# When does infinity start? Just after the largest possible floating
# point number. Explore the begining of infinity: sequentially
# increase the floating point number, until you reach infinity:  
1e300 
1e301 
1e302
1e303
1e304
1e305
1e306
1e307
1e308
1e309
# keep in mind, however, that operations with infinity yield meaningful
# results, by example: 
log(0)
exp(-Inf)
Inf/0
0/Inf

## TASK 6 ##
# Learn the bottom line: "R is good enough at hiding numerical error
# that it is easy to forget that it is there. Don't forget." (page 11
# in Burns, P. 2011. The R Inferno).
#
# Whenever carrying out operations on numbers represented as floating point
# numbers (non-integer real numbers), be careful. Comparison of such numbers
# with operators such as "==" might cause trouble. When performing operations
# on numbers that are suppossed to be integers, it may be helpful to use function
# "round" to make sure the computer is representing the numbers as integers. Visit
# the help page for this function by typing in the console "?round" or "help(round)".
# For further discussion of numerical error and the floating point representation see:
# http://www.burns-stat.com/documents/tutorials/impatient-r/more-r-key-objects/more-r-numbers/
# http://www.math.pitt.edu/~trenchea/math1070/MATH1070_2_Error_and_Computer_Arithmetic.pdf






