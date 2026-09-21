################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 8-2: Control de flujo - SOLUCIONES                             ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "8-2_flujos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("8-2_flujos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("8-2_flujos.r")


## TAREA 1 ##
for (i in 1:100) {
  print(i)
}


## TAREA 2 ##
for (i in 5:123) {
  print(i)
}


## TAREA 3 ##
# Para ir hacia atrás basta con poner el número mayor primero:
for (i in 66:33) {
  print(i)
}
# Cuidado con 'seq': seq(66, 33) también funciona, pero seq(66, 33, by = 1)
# da error porque el paso apunta en la dirección equivocada.


## TAREA 4 ##
# Aquí 'i' recorre las POSICIONES del vector, no sus valores, porque
# necesitamos x[i]:
for (i in 1:length(x)) {
  print(x[i]^2)
}

# También se vale recorrer los valores directamente, si no hace falta la
# posición:
for (valor in x) {
  print(valor^2)
}


## TAREA 5 ##
# El vector se crea ANTES del bucle, ya con su tamaño final. Si lo fuéramos
# creciendo con c() en cada vuelta, el código sería mucho más lento (ver la
# clase 8-1, sección "Cómo evitar bucles").
y <- rep(NA, length(x))

for (i in 1:length(x)) {
  y[i] <- x[i]^2
}

y


## TAREA 6 ##
y.acum <- rep(NA, length(y))
y.acum[1] <- y[1]

for (i in 2:length(y)) {
  y.acum[i] <- y.acum[i-1] * y[i]
}

y.acum

# R ya trae una función que hace justo esto, y es la forma recomendable:
cumprod(y)

identical(y.acum, cumprod(y))
