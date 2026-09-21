################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 4-2: Abrir y guardar archivos - SOLUCIONES                     ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "4-2_abrir_guardar.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("4-2_abrir_guardar.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("4-2_abrir_guardar.r")


## TAREA 1 ##
# La ruta es distinta en cada computadora. Por ejemplo:
# setwd("/Users/tu.usuario/Documents/R_Basics_workshop")   # Mac o Linux
# setwd("C:/Users/tu.usuario/Documents/R_Basics_workshop") # Windows
# Ojo en Windows: en R las rutas llevan "/" o "\\", nunca una sola "\".
getwd()


## TAREA 2 ##
dim(col)
dim(igm2)

class(col)
class(igm2)


## TAREA 3 ##
# Sin 'sep=","' R usa como separador cualquier espacio en blanco. Como el
# archivo no tiene espacios, R ve la fila de encabezado como UN solo nombre de
# columna y las filas de datos como UN solo valor; al no cuadrar las cuentas
# lanza el error "line 1 did not have 2 elements". Con 'sep=","' encuentra las
# comas y devuelve las 6 columnas correctas.
# Moraleja: cuando read.table se queja de que a una línea le faltan elementos,
# lo primero que hay que revisar es 'sep'.


## TAREA 4 ##
dir.create("salidas", showWarnings = FALSE)
write.table(x = lm.residuals, file = "salidas/regressionresiduals.txt",
            sep = "\t")
list.files("salidas/")


## TAREA 5 ##
## No hay soluciones aquí, lo siento! :)


## TAREA 6 ##
## No hay soluciones aquí, lo siento! :)
