################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 7-2: Gráficos                                                  ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## TAREA 1 ##
# Cargue el conjunto de datos "iris" de Edgar Anderson. Viene con R, en el
# paquete "datasets", así que basta con:
data(iris)
str(iris)

# Los siguientes argumentos se describen en la página de ayuda de la función
# "plot.default": "xlim" y "ylim." Utilize ambos argumentos en este código para 
# modificar la gráfica resultante, la misma que muestra la relación entre dos
# variables morfológicas para especies de Iris:

plot(iris$Petal.Width, iris$Sepal.Width)


## TAREA 2 ##
# Vaya a la página de ayuda de la función "plot" y lea sobre estos 6 argumentos:
# "type", "main", "sub", "xlab", "ylab" y "asp". Utilice esa información para 
# modificar el código anterior usando los seis argumentos.


## TAREA 3 ##
# Considere este cambio en el código de la tarea 2:

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19)

# Note el uso del argumento "bty". Vaya a la página de ayuda para la función 
# "par" y lea sobre este argumento. Cambiar el valor dado al argumento "bty" en 
# el código anterior para ver los resultados que son posible para diferentes 
# valores de "bty".


## TAREA 4 ##
# El siguiente código difiere del código de la Tarea 3 sólo en el uso del 
# argumento "type":

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19, type="n")

# Lea sobre el argumento "type" en la ayuda para la función "plot" para 
# aprender lo que pasó. A continuación, utilice el código anterior como punto de 
# partida para representar gráficamente la relación entre el ancho del sépalo y 
# el ancho del pétalo mostrando cada especie con un símbolo y color diferente. 
# Vea la lista de símbolos disponibles a través del argumento "pch" en la página 
# 44 de "R para principiantes". Vea también la descripción del argumento "pch" 
# en la página de ayuda para la función "par". Para ver una lista de colores 
# disponibles escriba "colours()". Para completar esta tarea es necesario que 
# utilice la función de "points" y que ponga en practica sus conocimientos sobre
# indexación de objetos.


## TAREA 5 ##
# Añada una leyenda al gráfico que creó en la TAREA 4 usando la función
# "legend". Obtenga información sobre esta función en su página de ayuda.


## TAREA 6 ##
# Examine los datos de longitud del sépalo y ancho del pétalo utilizando 
# este código:

summary(iris$Sepal.Length)
summary(iris$Petal.Width)

# Considere cuidadosamente el siguiente código que produce histogramas de 
# longitud del sépalo y ancho del pétalo en el mismo gráfico:

hist(iris$Sepal.Length, breaks=seq(0,8,0.5), col="gray70", border="gray40", 
    xlab="", ylab="", main="", xaxt="n", yaxt="n", ylim=c(0,40))
par(new=TRUE)
hist(iris$Petal.Width, breaks=seq(0,8,0.5), density=30, xlab="", ylab="", 
    main="", xaxt="n", yaxt="n", ylim=c(0,40))

# Lea en la página de ayuda para la funcion "par" la información sobre el 
# argumento "new". Use las funciones "axis", "mtext" y "legend" para agregar 
# ejes, títulos de ejes y una leyenda. 


## TAREA 7 ##
# El gráfico que creó en la TAREA 6 puede tener un problema: el eje Y es 
# demasiado corto y deja parcialmente fuera una de las barras del histograma. 
# Modifique los valores en el argumento "ylim" para solucionar este problema. 
# Puede haber también un segundo problema: el título del eje vertical se puede 
# estar cortado. Utilice el argumento "mar" de la función "par" para solucionar 
# este segundo problema. Lea sobre el argumento "mar" en la página de ayuda de 
# la función "par".


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/7-2_graficos_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/7-2_graficos_soluciones.r")
