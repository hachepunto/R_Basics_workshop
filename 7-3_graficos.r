################################################################################
### R BASICS WORKSHOP                                       				                     ###
### EJERCICIO 7-3: Gráficos                                                  ###
###                                                               						                      ###
### Unida de Servicios Bioinformáticos    						                      ###
### Instituto Nacional de Medicina Genómica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## TAREA 1 ##
# Abra los datos en el archivo "Data_GlobalWoodDensity.txt" y asígnelos a un 
# objeto denominado wood.density. Este archivo contiene datos sobre la densidad 
# de la madera para muchas especies en diversas regiones del planeta y para 
# muchas familias de plantas leñosas.

## TAREA 2 ##
## Haga un gráfico circular ("pie chart") que muestra el número de mediciones que 
## hay para cada familia de plantas. Antes de utilizar el la función "pie", es 
## necesario calcular las frecuencias por familia usando la funcione "table":

fam.freq <- table(wood.density$Family)


## TAREA 3 ##
## Repita el gráfico circular, pero sólo para las 5 familias con la mayoría de 
## registros. En esta y en todas las otras figuras en este ejercicio, haga un 
## esfuerzo para crearlos tan bien como sea posible: escoger buenos colores, 
## buenos tamaño de letra, cree nombres de ejes y títulos, etc.


## TAREA 4 ##
## Haga un histograma de los valores de densidad de madera para todas las 
## especies. Añada a este histograma otros dos histogramas encima (con el 
## argumento * add = TRUE *) pero donde sólo se utilizan los valores de densidad 
## de madera para (1) América del Norte y (2) para Australia. 


## TAREA 5 ##
## Elija 3 familias de interés, y haga un diagrama de cajas ("boxplot") 
## comparando los valores de densidad de la madera entre las familias.


## TAREA 6 ##
# Guarde la última figurea en un archivo PDF de alta resolución




