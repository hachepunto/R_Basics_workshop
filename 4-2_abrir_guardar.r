################################################################################
### R BASICS WORKSHOP                                                					          ###
### EJERCICIO 4-2: ABRIR Y GUARDAR ARCHIVOS                    		                      ###
###                                                               						                      ###
### Unida de Servicios Bioinformáticos    						                      ###
### Instituto Nacional de Medicina Genómica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## OBJETIVO:
## En este ejercicio, vamos a practicar tablas de datos en R y como guardar 
## en archivos.


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

## TAREA 2 ## 
## Use de la función "read.table", abrir los archivos 
## 'data_neotropicooccidente_col.txt' y 'data_neotropicooccidente_igm2.txt'.
## nombre de los objetos resultantes como "col" y "igm2". tenga en cuenta que 
## estos son archivos de texto separados por comas, y que la primera fila 
# representa los nombres de columnas.

## TAREA 3 ## 
## Compruebe el número de columnas y filas de los objetos que acaba de crear al
## abrir los archivos. Además, compruebe qué tipo de objeto son "col" y "igm2".

## Si ve que hay sólo una columna, eso quiere decir que abrió el archivo 
## incorrectamente.


plot(igm2$PETmin, igm2$TOPOG)
# Ahora que los archivos están abiertos, se pueden hacer cosas con ellos. Por 
# ejemplo, este cógido hace una figura de la evapotranspiración potencial mínima 
# (PETmin) contra la topografía en el Neotrópico.

plot(igm2$Lat, igm2$PETmin)
# Esta figura, en cambio, muestra la variación latitudinal en PETmin.


# Ahora, vamos a suponer que desea extraer los residuos de una regresión
# Entre PETmin y latitud, y guardarlos en un archivo.

lm.results <- lm(igm2$PETmin ~ igm2$Lat + I(igm2$Lat^2))
lm.residuals <- residuals(lm.results)
# Esto ejecuta una regresión polinomial, y luego extrae los residuos en un
# objeto llamado "lm.residuals"


## TAREA 4 ##
## Utilice la función 'write.table' para guardar el objeto "lm.residuals"
## en un archivo de texto separado por tabulaciones en el directorio de trabajo. 
## Nombre del archivo "regressionresiduals.txt".


## TAREA 5 ## 
## Abra el archivo 'data_adultliteracy.xslx'. Guardar el contenido del archivo
## en un objeto de cualquier nombre. Tenga en cuenta aquí que el archivo
## original es un archivo de Excel. Esto significa que primero tiene que 
## abrirlo con Excel, luego guardar una compia como un archivo de texto, y 
## finalmente utilizar 'read.table' para abrir el archivo en R.


## TAREA 6 ## 
## Abrir cualquier otra tabla de datos que tiene en su computadora, tal vez una 
## con sus propios datos.























################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
setwd('La/Dirección/Va/Aquí') # Vector numérico


## TAREA 2 ##
## Hay tres maneras principales de hacer esto:

## 1
col <- read.table(file="Data_NeotropicoOccidente_COL.txt", header=TRUE, sep=",")
igm2 <- read.table(file="Data_NeotropicoOccidente_IGM2.txt", header=TRUE, sep=",")

## 2
col <- read.table(file=file.choose(), header=TRUE, sep=",")
igm2 <- read.table(file=file.choose(), header=TRUE, sep=",")

## 3 # Utilizando la dirección de una carpeta en su computadora
col <- read.table(file="carpeta1/carpeta2/carpeta3/Data_NeotropicoOccidente_COL.txt",
  header=TRUE, sep=",")
igm2 <- read.table(file="carpeta1/carpeta2/carpeta3/Data_NeotropicoOccidente_IGM2.txt",
  header=TRUE, sep=",")


## TAREA 3 ##
dim(col)
dim(igm2)

class(col)
class(igm2)


## TAREA 4 ##
## Hay dos maneras principales para hacer esto:

## 1
write.table(x=lm.residuals, file="RegressionResiduals.txt", sep="\t")

## 2
write.table(x=lm.residuals, file="folder1/folder2/RegressionResiduals.txt", sep="\t")


## TAREA 5 ##
## No hay soluciones aquí, lo siento! :)


## TAREA 6 ##
## No hay soluciones aquí, lo siento! :)
