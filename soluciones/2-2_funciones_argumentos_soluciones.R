################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 2-2: Funciones y argumentos - SOLUCIONES                       ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "2-2_funciones_argumentos.R" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("2-2_funciones_argumentos.R")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("2-2_funciones_argumentos.R")


## TAREA 1 ##
2 + 3
2 - 3
2 * 3
2 / 3
2 ^ 3
# (Cuidado: '2 % 3' NO es válido en R. El operador módulo son dos signos
# juntos, '%%', y la división entera es '%/%'.)
2 %% 3
2 %/% 3


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
paste("auritus", "Chrotopterus", "Phyllostomidae")


## TAREA 7 ##
# 'sep' es la cadena de texto que se pone ENTRE los términos que se pegan.


## TAREA 8 ##
# Sí tiene valor predeterminado: sep = " " (un espacio).


## TAREA 9 ##
paste("Chrotopterus", "auritus", sep="_")


## TAREA 10 ##
# Los argumentos principales de 'rep' son: x, times, length.out y each.


## TAREA 11 ##
rep(1:4, 2)          # Repite la secuencia 1-a-4 dos veces
rep(1:4, each = 2)   # Repite CADA elemento de la secuencia dos veces
rep(1:4, c(2,2,2,2)) # Igual que el anterior, pero diciendo cuántas veces se
                     # repite cada elemento, uno por uno
rep(1:4, c(2,1,2,1)) # Repite el primero y el tercero dos veces, y el segundo y
                     # el cuarto una sola vez
rep(1:4, each = 2, len = 4)  # Repite cada elemento dos veces, pero devuelve
                             # solo los primeros 4 valores del resultado
rep(1:4, each = 2, len = 10) # Repite cada elemento dos veces y devuelve 10
                             # valores, volviendo a empezar si hace falta
rep(1:4, each = 2, times = 3) # Repite cada elemento dos veces y LUEGO repite
                              # todo el resultado tres veces


## TAREA 12 ##
rep(x=c("Homo", "sapiens"), times=7) # Repite el vector completo 7 veces
rep(x=c("Homo", "sapiens"), each=7)  # Repite cada elemento del vector 7 veces


## TAREA 13 ##
asombroso <- rep(x="¡R es asombroso!", times=1000)
length(asombroso)
head(asombroso)


## TAREA 14 ##
rep(x="¡R es asombroso!", times=1000) # 1. con nombres, en orden
rep("¡R es asombroso!", 1000)         # 2. sin nombres
rep(times=1000, x="¡R es asombroso!") # 3. con nombres, en otro orden


## TAREA 15 ## 
# a. La función es 'rep', no 'Rep'; y el argumento es 'times', no 'Times'
# b. A la función 'c' le falta el paréntesis de apertura
# c. "Socratea" y "exorrhiza" tienen que ir entre comillas
# d. Falta una coma que separe los dos valores antes de concatenarlos
rep(c("Socratea", "exorrhiza"), times=7)


## TAREA 16 ##
# Los otros argumentos son 'mean' y 'sd', con valores predeterminados
# mean = 0 y sd = 1.


## TAREA 17 ##
rnorm(n=25, mean=50, sd=20)


## TAREA 18 ##
hist(x=B, breaks=30, col="firebrick1",
     xlab="Valores del vector aleatorio B")


## TAREA 19 ## 
# OJO: estas tres líneas hay que correrlas ANTES de re-escribir 'A' con 1:20.
# Si 'A' ya tiene 20 valores y 'B' tiene 1000, 'plot' falla porque las
# longitudes no coinciden. Aquí volvemos a crear 'A' con 1000 valores:
A <- rnorm(n=1000, mean=0, sd=1)

plot(A, B)      # A en el eje x, B en el eje y
plot(y=A, x=B)  # B en el eje x, A en el eje y
plot(x=B, y=A)  # Idéntica a la anterior: con nombres, el orden no importa

A <- 1:20 # La dejamos como estaba para las tareas siguientes


## TAREA 20 ##
a <- seq(from=1, to=20, by=1)


## TAREA 21 ##
plot(a, A)


## TAREA 22 ##
# La tarea pide una línea del punto (0,0) al punto (20,20):
lines(x=c(0,20), y=c(0,20), col="red")


## TAREA 23 ##
pred <- rnorm(250, 40, 10) # Crea un vector de 250 valores aleatorios de una
                           # distribución normal con media 40 y desviación
                           # estándar 10, y lo guarda en el objeto *pred*

resp <- 15 + 1.55*pred + rnorm(250, sd=5, mean=0) 
                           # 1. Multiplica por 1.55 los valores de *pred*
                           # 2. Le suma 15 al resultado anterior
                           # 3. Crea un vector de 250 valores aleatorios de una
                           #    normal con media 0 y desviación estándar 5
                           # 4. Suma los vectores de los pasos 2 y 3

plot(pred, resp, cex=2, pch=21, col= "grey60", bg="gold")
                           # Grafica los valores de *resp* contra los de *pred*.
                           # El tamaño del símbolo es 2, el tipo de símbolo es
                           # 21, el color del borde es grey60 y el del relleno
                           # es gold


## TAREA 24 ##
plot(pred, resp, cex=4, pch=22, col= "white", bg="darkolivegreen")


## TAREA 25 ##
# Se espera que estén cerca de 40 y 10 (la media y la desviación estándar con
# que se generó el vector), pero no exactamente: son una muestra de 250 valores.
mean(pred)
sd(pred)
 

## TAREA 26 ##
summary(rnorm(n=300, mean=-13, sd=5))
