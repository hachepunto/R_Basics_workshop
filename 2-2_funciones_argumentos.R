################################################################################
### R BASICS R_Basics_workshop                                                                                                 ###
### EJERCISIO 2.2: Funciones y argumentos                                                                                 ###
###                                                                                                                                                    ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                            ### 
################################################################################

## OBJETIVO:
## El objetivo de estos ejercicios es practicar los conceptos de 'función' y 'argumento y aprender
## algunas funciones básicas de R. 


2 + 3
# Esto suma 2 y 3. Nota el uso del operador matemático '+'. 
 
## TAREA 1: Usa los otros operadores algebraicos básicos: '-', '*', '/' y '^' para 
## restar, multiplicar, etc. los valores 2 y 3.



sum(2, 3)
# Esto también suma 2 y 3, nota aquí el uso de la función 'sum'.
	
Sum(2, 3)
# El comando de arriba debería darte un error. Esto es porque R distingue minúsculas 
#  de MAYÚSCULAS; por lo tanto, la función 'sum' no es lo mismo que 
# poner 'Sum', y en este caso 'Sum' no existe.


10-2/8
# Divide 2 entre 8, y luego resta el resultado a 10. Cuando se encuentra con  
# operaciones múltiples, R sigue el criterio de hacer división y 
# multiplicación antes de suma y resta.  

(10-2)/8
# Usando paréntesis, puedes especificar el orden en el cual las operaciones se deben 
# llevar a cabo. Aquellas operaciones dentro de paréntesis se llevaran a cabo antes de las 
# que están fuera del paréntesis. En este caso, la resta antes que la división. 

## TAREA 2: ¿Cual es el resultado de: 5.6 por 11.7, después divide este valor entre 3 
## sumando 6.6 a este, y elevando todo el resultado a 2? Escribe esta operación como una
## sola linea de código.


## TAREA 3: ¿Cual es el resultado de: 5.6 por 11.7, entonces divide el valor entre  3, 
## y a ese valor súmale 6.6 elevado al cuadrado 2? Escribe esta operación como una
## sola linea de código.

c("Rattus", "norvegicus")
# Concatena los caracteres "Rattus" y "norvegicus" formando un vector de tamaño 2.

## TAREA 4: Usa la función *length* para confirmar el tamaño de este vector

paste("Rattus", "norvegicus")
# Pega los caracteres "Rattus" y "norvegicus" para formar una sola cadena de caracteres 
# (tamaño = 1) uniéndolos.

## TAREA 5: Usa la función *length* para confirmar el tamaño de este vector

## TAREA 6: Usa la función *paste* para unir el género y la especie de tu especie  
## favorita. Después usa la función *paste* para pegar juntos en este orden: 
## la especie, género y familia de tu especie preferida. 


?paste
# Abre la ayuda de la función *paste*.

## TAREA 7: Usando la ayuda de este función, identifica cual es el rol del 
## argumento 'sep'.
## TAREA 8: ¿Tiene un valor predeterminado este argumento? ¿Cual es este valor?
## TAREA 9: Usa *paste* para unir el género y la especie del nombre de tu especie 
## favorita usando el carácter '_' para separar las dos palabras.


?rep
# Abre la ayuda de la función *rep*.

## TAREA 10: Lee la ayuda de esta función y identifica sus argumentos principales.
## TAREA 11: Corre las líneas 1 a 9 de los ejemplos de la página de ayuda. 
## ¿Qué está haciendo este código?


rep(x=c("Homo", "sapiens"), times=7)
rep(x=c("Homo", "sapiens"), each=7)
# Usa la función*rep* para repetir la información en el argumento x.

## TAREA 12: ¿Cómo y porqué los resultados de las dos lineas son diferentes?
## TAREA 13: Crea un vector que contenga “¡R es asombroso!” 1000 veces. Si quieres, 
## usa la función *rep* para ayudarte a completar esta tarea.
## TAREA 14: Reescribe el código de arriba en 3 diferentes formas: 
##  1. Usando los nombres de los argumentos en su orden predeterminado
##  2. excluyendo los nombres de los argumentos
##  3. Cambiando el orden de los argumentos

## TAREA 15: ¿Cual es (son) el problema(s) con la siguiente línea de código? Lee el 
## error y corrige el código. 
Rep(cSocratea exorrhiza), Times=7)


rnorm(n=50)
# Genera un vector que contiene 50 valores aleatorios de una distribución normal.


rnorm(50)
# También genera un vector que contiene 50 valores aleatorios de una distribución normal. 

## TAREA16: De acuerdo con la ayuda de la función *rnorm*: 
##  1. ¿Qué otro argumento acepta esta función?
##  2. ¿Cual es el valor predeterminado de este argumento adicional?
## TAREA 17: Genera un vector de largo 25 con valores aleatorios de una distribución
## normal con media en 50 y desviación estándar 20. 


plot(x=rnorm(50), y=rnorm(50))
# La función *plot* se usa para hacer muchos tipos de figuras. En este caso, se usa 
# para hacer una gráfica de dispersión. En la figura se grafican dos variables aleatorias  
# una contra la otra. 


A <- rnorm(n=1000, mean=0, sd=1)
B <- rnorm(1000, sd=25, mean=100)
# Esto crea dos vectores con valores aleatorios de una distribución normal
# y los guarda en dos objetos llamados A y B. Nota el orden de los argumentos
# entre los dos llamados de la función *rnorm*. 


hist(A, col="lightblue")
# Crea un histograma de los valores en el vector A. 

## TAREA 18: Usando la ayuda de R, crea un histograma de los valores en el vector B donde: 
##  1. los datos se presenten en 30 barras,
##  2. las barras sean rojas, y 
##  3. el eje X tenga la leyenda 'Valores del vector aleatorio B'. 


## TAREA 19: Antes de correr el siguiente código ¿puedes predecir como la salida
## del los siguientes tres comandos será diferente?
plot(A,  B)
plot(y=A,  x=B)
plot(x=B, y=A)

A <- 1:20 
# Re-escribe el objeto A con la secuencia: 1, 2, 3,..., 20.

## TAREA 20: Crea otro objeto de nombre 'a' con la misma secuencia, pero usando 
## la función *seq*.

## TAREA 21: Crea una figura donde relaciones los valores de 'A' con los valores
## del vector 'a' – esto es crea un gráfica de dispersión. 

## TAREA 22: Usa la función *lines* para crear una linea 1:1 de correspondencia en la base de 
## la gráfica (origen en la coordenada 0,0  y fin en la coordenada 20,20). Para crear esta 
## línea, la función necesitará las coordenadas X y Y del punto de inicio al punto de llegada.


## TAREA 23: ¿Puedes leer y el siguiente código?
pred <- rnorm(250, 40, 10)
resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0)
plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")

## TAREA 24: Haz una figura similar a la de arriba pero cambia: 
## (1) El tamaño de los símbolos 
## (2) el tipo de símbolo, y 
## (3) el color del símbolo. 

## TAREA 25: Si calculas el promedio y la desviación estándar delos valores del vector 
## 'pred' ¿Qué esperarías? Calcúlalos usando la función *mean* y *sd* y 
##  confirma/revisa tus expectativas. 


lm(resp ~ pred)
## La función *lm* genera un modelo lineal. En este caso, *lm* genera un regresión de 
## mínimos cuadrados donde  'resp' está en función de la variable 'pred'. El símbolo '~' 
## generalmente significa "es función de" y se usa en fórmulas. 


summary(object=lm(resp ~ pred))
## La función *summary* crea un resumen de la información contenida
## en su argumento 'object'. En este caso, este tiene la información de  
## regresión lineal entre 'resp' y 'pred'. 

## TAREA 26: haz un resumen de un vector con 300 valores al azar tomados de una  
## distribución normal con media en -13 y una desviación estándar de 5. 




















################################################################################
### TAREA SOLUTIONS #############################################################
################################################################################

## TAREA 1 ##
2 + 3
2 - 3
2 * 3
2 % 3
2 ^ 3


## TAREA 2 ##
((5.6 * 11.7)/3 + 6.6)^2


## TAREA 3 ##
(5.6 * 11.7)/3 + 6.6^2


## TAREA 4 ##
length(c("Rattus", "norvegicus"))


## TAREA 5 ##
length(paste("Rattus", "norvegicus"))


## TAREA 6 ##
paste("Chrotopterus", "auritus")


## TAREA 7 ##
# sep: a character string to separate the terms.


## TAREA 8 ##
# sep = " "


## TAREA 9 ##
paste("Chrotopterus", "auritus", sep="_")


## TAREA 10 ##
# x, times, length.out, each


## TAREA 11 ##
rep(1:4, 2) # Repeat the sequence 1-to-4 2 times 
rep(1:4, each = 2) # Repeat each element in the sequence 1-to-4 2 times
rep(1:4, c(2,2,2,2)) # Repeat each element in the sequence 1-to-4 2 times
rep(1:4, c(2,1,2,1)) # Repeat the first y third element in the sequence 2 times, 
                     # y the second y fourth elements only once
rep(1:4, each = 2, len = 4) # Repeat each element in the sequence 1-to-4 2 times,
                            # but return only the first 4 elements in the result
rep(1:4, each = 2, len = 10) # Repeat each element in the sequence 1-to-4 2 times,
                             # y return 10 elements in the result. 
rep(1:4, each = 2, times = 3) # Repeat each element in the sequence 2 times, THEN
                              # repeat that result 3 times


## TAREA 12 ##
rep(x=c("Homo", "sapiens"), times=7) # Repeats the vector 7 times
rep(x=c("Homo", "sapiens"), each=7) # Repeat each element in the vector 7 times


## TAREA 13 ##
rep(x="R is awesome", times=1000)


## TAREA 14 ##
rep(x="R is awesome", times=1000)
rep("R is awesome", 1000)
rep(times=1000, x="R is awesome")


## TAREA 15 ## 
# a. Function is rep not Rep
# b. Function c not followed by (
# c. Socratea y exorriza need to be in between quotation marks
# d. There must be a coma separating the values "Socratea" y "exorrhiza" before
#    concatenating them
rep(c("Socratea", "exorrhiza"), times=7)


## TAREA 16 ##
# mean = 0 y sd = 1


## TAREA 17 ##
rnorm(n=25, mean=50, sd=20)


## TAREA 18 ##
hist(x=B, breaks=30, col="firebrick1", xlab="Values of ryom vector B")


## TAREA 19 ## 
plot(A,  B) # A in x axis, B in y axis
plot(y=A,  x=B) # B in x axis, A in y axis
plot(x=B, y=A) # B in x axis, A in y axis


## TAREA 20 ##
a <- seq(from=1, to=20, by=1)


## TAREA 21 ##
plot(a, A)


## TAREA 22 ##
lines(x=c(1,20), y=c(1,20), col="red")


## TAREA 23 ##
pred <- rnorm(250, 40, 10) # Create a vector of 250 ryom values from a normal 
                           # distribution with mean 40 y styard deviation 10. 
                           # Put that vector into an object named *pred*

resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0) 
                           # 1. Multiply the values in object *pred* by 1.55
                           # 2. To the result above, sum the value 15
                           # 3. Create a vector of 250 ryom values from a normal 
                           #    distribution with mean 5 y styard deviation 0
                           # 4. Sum the vectors created in steps 3 y 4

plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")
                           # Plot the values in the object *resp* against those 
                           # in object *pred*. Symbol size will be 2. Symbol 
                           # type is 21. Color of the symbol border is grey60.
                           # Color of symbol background is gold


## TAREA 24 ##
plot(pred, resp, cex=4, pch=22, col= "white", bg="darkolivegreen")


## TAREA 25 ##
# You would expect them to be near 40 y 10 for the mean y sd respectively
mean(pred)
sd(pred)
 

## TAREA 26 ##
summary(rnorm(n=300, mean=-13, sd=5))



