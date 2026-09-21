################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 7-3: Gráficos                                                  ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJETIVO:
## Practicar gráficos de frecuencias, histogramas y diagramas de caja, y
## guardarlos como archivos.

## DIRECTORIO DE TRABAJO:
## Este ejercicio lee un archivo de la carpeta "Datasets". Tu directorio de
## trabajo debe ser la carpeta del taller (la que contiene "Datasets").
## Compruébalo con getwd() y cámbialo con setwd() si hace falta.

## NOTA: en versiones anteriores este ejercicio usaba un archivo de densidad de
## madera que no viene incluido en el repositorio. Ahora usa los datos de
## ectoparásitos en murciélagos, que sí están en "Datasets".


## TAREA 1 ##
## Abra el archivo "Datasets/data_streblidaeonbats.txt" y asígnelo a un objeto
## llamado 'estreb'. Contiene, para 139 murciélagos capturados en Ecuador, su
## sexo, peso, longitud del antebrazo, la localidad y el hábitat de captura, y
## el número de ectoparásitos de tres especies de Streblidae.
## Es un archivo separado por TABULADORES con nombres de columna en la primera
## fila. Pida además stringsAsFactors = TRUE para que las columnas de texto
## lleguen como factores (varias funciones gráficas lo agradecen).

estreb <- read.table("Datasets/data_streblidaeonbats.txt", header = TRUE,
                     sep = "\t", stringsAsFactors = TRUE)

dim(estreb)
str(estreb)
head(estreb)


## TAREA 2 ##
## Haga un gráfico circular ("pie chart") que muestre cuántos murciélagos se
## capturaron en cada tipo de hábitat. Antes de usar 'pie' hay que calcular las
## frecuencias con 'table':

hab.freq <- table(estreb$Habitat)
hab.freq

## Ahora úsela con 'pie'. Note que las etiquetas salen larguísimas y encimadas:
## ese es justamente el problema que resuelve la TAREA 3.


## TAREA 3 ##
## Repita el gráfico circular, pero sólo para los 4 hábitats con más registros.
## Pistas: 'sort' ordena, y los corchetes permiten quedarse con los primeros
## elementos. En ésta y en todas las demás figuras de este ejercicio, haga un
## esfuerzo por dejarlas lo mejor posible: buenos colores, buen tamaño de letra,
## títulos de ejes y leyendas.


## TAREA 4 ##
## Haga un histograma del peso ('Weight') de todos los murciélagos. Encima de
## ese histograma agregue otros dos (con el argumento 'add = TRUE') que usen
## sólo los pesos de (1) las hembras y (2) los machos. La columna 'Sex' tiene
## los valores "h" y "m".
## OJO: para que los histogramas se puedan superponer tienen que compartir los
## mismos 'breaks'.


## TAREA 5 ##
## Elija 3 localidades ('SiteName') con suficientes datos y haga un diagrama de
## cajas ('boxplot') comparando el número total de ectoparásitos ('Streblidae')
## entre ellas.


## TAREA 6 ##
## Guarde la última figura en un archivo PDF de alta resolución, dentro de la
## carpeta "salidas".


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/7-3_graficos_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/7-3_graficos_soluciones.r")
