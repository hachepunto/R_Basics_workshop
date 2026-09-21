################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 2-2: Funciones y argumentos                                    ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJETIVO:
## El objetivo de estos ejercicios es practicar los conceptos de 'función' y
## 'argumento', y aprender algunas funciones básicas de R.

## NOTA SOBRE try():
## Algunas líneas tienen errores A PROPÓSITO; tu tarea es leer el mensaje de
## error y entenderlo. Van envueltas en try() para que el error se imprima pero
## el archivo siga corriendo.


# Esto suma 2 y 3. Nota el uso del operador matemático '+'. 
2 + 3
 
## TAREA 1: Usa los otros operadores algebraicos básicos: '-', '*', '/' y '^' para 
## restar, multiplicar, etc. los valores 2 y 3.



# Esto también suma 2 y 3, nota aquí el uso de la función 'sum'.
sum(2, 3)
	
try(Sum(2, 3))
# El comando de arriba debería darte un error. Esto es porque R distingue minúsculas 
#  de MAYÚSCULAS; por lo tanto, la función 'sum' no es lo mismo que 
# poner 'Sum', y en este caso 'Sum' no existe.


# Divide 2 entre 8, y luego resta el resultado a 10. Cuando se encuentra con  
# operaciones múltiples, R sigue el criterio de hacer división y 
# multiplicación antes de suma y resta.  
10-2/8

(10-2)/8
# Usando paréntesis, puedes especificar el orden en el cual las operaciones se deben 
# llevar a cabo. Aquellas operaciones dentro de paréntesis se llevaran a cabo antes de las 
# que están fuera del paréntesis. En este caso, la resta antes que la división. 

## TAREA 2: ¿Cuál es el resultado de multiplicar 5.6 por 11.7, dividir ese valor
## entre 3, sumarle 6.6, y elevar TODO el resultado al cuadrado? Escribe la
## operación en una sola línea de código.


## TAREA 3: ¿Cuál es el resultado de multiplicar 5.6 por 11.7, dividir ese valor
## entre 3, y sumarle 6.6 ELEVADO AL CUADRADO? Escribe la operación en una sola
## línea de código. Compara con la TAREA 2: los paréntesis lo cambian todo.

c("Rattus", "norvegicus")
# Concatena los caracteres "Rattus" y "norvegicus" formando un vector de tamaño 2.

## TAREA 4: Usa la función *length* para confirmar el tamaño de este vector

# Pega los caracteres "Rattus" y "norvegicus" para formar una sola cadena de caracteres 
# (tamaño = 1) uniéndolos.
paste("Rattus", "norvegicus")

## TAREA 5: Usa la función *length* para confirmar el tamaño de este vector

## TAREA 6: Usa la función *paste* para unir el género y la especie de tu especie  
## favorita. Después usa la función *paste* para pegar juntos en este orden: 
## la especie, género y familia de tu especie preferida. 


# Abre la ayuda de la función *paste*.
?paste

## TAREA 7: Usando la ayuda de este función, identifica cual es el rol del 
## argumento 'sep'.
## TAREA 8: ¿Tiene un valor predeterminado este argumento? ¿Cual es este valor?
## TAREA 9: Usa *paste* para unir el género y la especie del nombre de tu especie 
## favorita usando el carácter '_' para separar las dos palabras.


# Abre la ayuda de la función *rep*.
?rep

## TAREA 10: Lee la ayuda de esta función y identifica sus argumentos principales.
## TAREA 11: Corre las líneas 1 a 9 de los ejemplos de la página de ayuda. 
## ¿Qué está haciendo este código?


# Usa la función*rep* para repetir la información en el argumento x.
rep(x=c("Homo", "sapiens"), times=7)
rep(x=c("Homo", "sapiens"), each=7)

## TAREA 12: ¿Cómo y porqué los resultados de las dos lineas son diferentes?
## TAREA 13: Crea un vector que contenga “¡R es asombroso!” 1000 veces. Si quieres, 
## usa la función *rep* para ayudarte a completar esta tarea.
## TAREA 14: Reescribe el código de arriba en 3 diferentes formas: 
##  1. Usando los nombres de los argumentos en su orden predeterminado
##  2. excluyendo los nombres de los argumentos
##  3. Cambiando el orden de los argumentos

## TAREA 15: ¿Cuál es (son) el (los) problema(s) con la siguiente línea de
## código? Escríbela en la consola tal cual, lee el error y corrígela.
## Va comentada porque es un error de SINTAXIS: R ni siquiera puede leer el
## archivo con ella dentro, así que no se puede rescatar con try().

# Rep(cSocratea exorrhiza), Times=7)


# Genera un vector que contiene 50 valores aleatorios de una distribución normal.
rnorm(n=50)


rnorm(50)
# También genera un vector que contiene 50 valores aleatorios de una distribución normal. 

## TAREA 16: De acuerdo con la ayuda de la función *rnorm*: 
##  1. ¿Qué otro argumento acepta esta función?
##  2. ¿Cual es el valor predeterminado de este argumento adicional?
## TAREA 17: Genera un vector de largo 25 con valores aleatorios de una distribución
## normal con media en 50 y desviación estándar 20. 


# La función *plot* se usa para hacer muchos tipos de figuras. En este caso, se usa 
# para hacer una gráfica de dispersión. En la figura se grafican dos variables aleatorias  
# una contra la otra. 
plot(x=rnorm(50), y=rnorm(50))


# Esto crea dos vectores con valores aleatorios de una distribución normal
# y los guarda en dos objetos llamados A y B. Nota el orden de los argumentos
# entre los dos llamados de la función *rnorm*. 
A <- rnorm(n=1000, mean=0, sd=1)
B <- rnorm(1000, sd=25, mean=100)


# Crea un histograma de los valores en el vector A. 
hist(A, col="lightblue")

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
# OJO: a partir de aquí 'A' ya no tiene 1000 valores sino 20, así que cualquier
# código que lo compare contra 'B' (que sigue teniendo 1000) va a fallar.

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
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/2-2_funciones_argumentos_soluciones.R
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/2-2_funciones_argumentos_soluciones.R")
