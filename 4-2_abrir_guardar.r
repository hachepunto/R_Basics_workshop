################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 4-2: Abrir y guardar archivos                                  ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJETIVO:
## Practicar cómo abrir tablas de datos en R y cómo guardarlas en archivos.

## DIRECTORIO DE TRABAJO:
## Este ejercicio lee archivos de la carpeta "Datasets". Tu directorio de
## trabajo debe ser la carpeta del taller (la que contiene "Datasets").


getwd()
# Con este comando, identificamos el directorio de trabajo actual. Esta es la
# carpeta en el ordenador que R utiliza por defecto para leer y escribir archivos.
# Esto significa que si no proporcionas una dirección a una carpeta distinta 
# al abrir/guardar archivos, R usará el directorio de trabajo.


# Para cambiar el directorio de trabajo, se puede usar el menú "Misc" en Mac, la pestaña de "archivo" 
# en una PC, o la pestaña "sesión" en Rstudio.

# Alternativamente, puede utilizar la función 'setwd'. Para dar una dirección a 
# esta (y otras funciones), debe proporcionar una cadena de caracteres (texto) 
# similar a esto: "Carpeta1/carpeta2/carpeta3/"

## TAREA 1 ## 
## Cambia el directorio de trabajo en su sesión de R a una carpeta que desees
## usar.


# La función principal para abrir una tabla de datos en R es "read.table". Los 
# archivos que pueden ser abiertos por esta función son archivos de texto, por 
# lo general con extensiones '.txt', '.csv' o '.dat'.

# La función principal para abrir una tabla de datos es "read.table". Estos dos
# archivos son de texto SEPARADOS POR COMAS y su primera fila trae los nombres
# de las columnas, así que hay que decírselo con 'sep' y 'header':

col  <- read.table("Datasets/data_neotropicooccidente_col.txt",
                   header = TRUE, sep = ",")
igm2 <- read.table("Datasets/data_neotropicooccidente_igm2.txt",
                   header = TRUE, sep = ",")

## TAREA 2 ##
## Compruebe el número de columnas y filas de los objetos que acaba de abrir, y
## qué tipo de objeto son "col" y "igm2". Use 'dim' y 'class'.
## Si ve que hay sólo UNA columna, es que el archivo se abrió mal: casi siempre
## es porque falta el argumento 'sep' o porque tiene el valor equivocado.

## TAREA 3 ##
## Compare estas dos líneas y explique la diferencia. La segunda es la correcta.
try(head(read.table("Datasets/data_neotropicooccidente_igm2.txt", header = TRUE)))
head(igm2)


plot(igm2$PETmin, igm2$TOPOG)
# Ahora que los archivos están abiertos, se pueden hacer cosas con ellos. Por 
# ejemplo, este cógido hace una figura de la evapotranspiración potencial mínima 
# (PETmin) contra la topografía en el Neotrópico.

# Esta figura, en cambio, muestra la variación latitudinal en PETmin.
plot(igm2$Lat, igm2$PETmin)


# Ahora, vamos a suponer que desea extraer los residuos de una regresión
# Entre PETmin y latitud, y guardarlos en un archivo.

# Esto ejecuta una regresión polinomial, y luego extrae los residuos en un
# objeto llamado "lm.residuals"
lm.results <- lm(igm2$PETmin ~ igm2$Lat + I(igm2$Lat^2))
lm.residuals <- residuals(lm.results)


## TAREA 4 ##
## Utilice la función 'write.table' para guardar el objeto "lm.residuals"
## en un archivo de texto separado por tabuladores, dentro de la carpeta
## "salidas". Nombre del archivo "regressionresiduals.txt".


## TAREA 5 ## 
## Abra el archivo 'Datasets/data_adultliteracy.xlsx' y guarde su contenido en
## un objeto de cualquier nombre. Tenga en cuenta que el original es un archivo
## de Excel; hay dos caminos:
##  a) Abrirlo con Excel o LibreOffice, guardar una copia como texto separado
##     por tabuladores o comas, y luego usar 'read.table'.
##  b) Instalar un paquete que lea .xlsx directamente, por ejemplo:
##     install.packages("readxl")
##     library(readxl)
##     alfab <- read_excel("Datasets/data_adultliteracy.xlsx")


## TAREA 6 ## 
## Abrir cualquier otra tabla de datos que tiene en su computadora, tal vez una 
## con sus propios datos.


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/4-2_abrir_guardar_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/4-2_abrir_guardar_soluciones.r")
