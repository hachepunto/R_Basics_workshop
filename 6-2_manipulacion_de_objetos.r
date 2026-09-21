################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 6-2: Indexación de objetos (y un poco de gráficos)             ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

### INTRODUCCIÓN ###############################################################
# En este ejercicio explorarás los valores de las variables predictoras del
# modelo IGM2. Vas a usar un conjunto de datos con la precipitación anual (Ran,
# en mm), la evapotranspiración potencial mínima (PETmin, en mm) y la elevación
# (TOPOG, en m) para áreas a lo largo del Neotrópico occidental.

## DIRECTORIO DE TRABAJO:
## Este ejercicio lee archivos de la carpeta "Datasets". Tu directorio de
## trabajo debe ser la carpeta del taller (la que contiene "Datasets").
getwd()
# Si hace falta cambiarlo: setwd("/ruta/a/tu/carpeta/R_Basics_workshop")


# El archivo tiene valores separados por comas y nombres de columna en la
# primera fila. Contiene Ran, PETmin y TOPOG para varias zonas neotropicales.
# Cada área se identifica por un número (columna "Point.id") y sus coordenadas
# ("Lat" y "Lon"). Estas coordenadas están PROYECTADAS: corresponden al centro
# de celdas de una cuadrícula de igual área, así que no son latitud y longitud
# en grados decimales. Cada celda mide 100 km x 100 km.

neo_IGM2 <- read.table("Datasets/data_neotropicooccidente_igm2.txt",
                       header = TRUE, sep = ",")

## TAREA 1 ##
# Examine las cinco primeras filas con "neo_IGM2[1:5, ]". ¿Cuántas filas y
# cuántas columnas tiene? ¿De qué clase es el objeto?
neo_IGM2[1:5, ]


## TAREA 2 ##
# El marco de datos "neo_IGM2" tiene valores perdidos de PETmin o TOPOG en 
# varias áreas geográficas. Estas áreas muestran "NA" en lugar de valores 
# numéricos. El siguiente código utiliza la función "plot", junto con corchetes
# (para la indexación) para visualizar todas las áreas de "neo_IGM2". Luego, 
# utiliza la función "points" y corchetes de indexación para diferenciar las 
# zonas con valores numéricos de Ran, PETmin y TOPOG.  

plot(neo_IGM2[,2], neo_IGM2[,3])
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 3 ##
# Para representar mejor el Neotrópico occidental, utilice el argumento "asp = 1" 
# de la función "plot". Lea sobre este argumento en la página de ayuda para la 
# función "plot".

plot(neo_IGM2[,2], neo_IGM2[,3], asp=1)
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 4 ##
# Use y estudie el código siguiente para examinar la relación entre Ran y
# PETmin a través del Neotrópico:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")
#or
plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")


## TAREA 5 ##
# Lleve a cabo una versión modificada de la TAREA 4 usando los argumentos "cex.axis" 
# y "cex.lab". Use y estudie este código:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", 
  cex.axis=1.5, cex.lab=1.5)


## TAREA 6 ##
# Inspeccione la relación entre Ran y el logaritmo natural de TOPOG usando la
# función "plot".


## TAREA 7 ##
# Ver la relación entre PETmin y el logaritmo natural de TOPOG usando la
# función "plot"


## TAREA 8 ##
# Calcule el rango de los valores de Ran utilizando la función "range". Consulte 
# la ayuda de esta función. Estudie este código:

range(neo_IGM2[!is.na(neo_IGM2[,4]),4])


## TAREA 9 ##
# Un investigador intenta obtener el rango de valores de Ran a través de todo el
# Neotrópico utilizando este código:

range(neo_IGM2[,4])

# Hay un problema, lo puede ver? Describa el problema y resuelvalo. Lea la 
# página de ayuda de la función "range".


## TAREA 10 ##
# Calcule el rango de valores de PETmin.


## TAREA 11 ##
# Calcule el rango de valores de TOPOG


## TAREA 12 ##
# Lleve a cabo versiones modificadas de las TAREAS 2 a 11 usando el operador "$" 
# y los nombres de las columnas de "neo_IGM2". Por ejemplo, para la tarea 3, 
# utilice este código:

plot(neo_IGM2$Lon, neo_IGM2$Lat)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], pch=19)


## TAREA 13 ##
# Hay otra manera de acceder a las variables en un marco de datos: usando 
# corchetes rectangulares y el nombre de la variable entre comillas:

neo_IGM2["Lon"]

# Sin embargo, hay una diferencia entre neo_IGM2 [, 2] y neo_IGM2$Lon por un 
# lado, y neo_IGM2["Lon"] en el otro. ¿Cual es esta diferencia? Vea la página 11 
# de "R para principiantes". Esta diferencia también puede verse mediante este 
# código:

class(neo_IGM2[,2])
class(neo_IGM2$Lon)
class(neo_IGM2["Lon"])

is.vector(neo_IGM2[,2])
is.vector(neo_IGM2$Lon)
is.vector(neo_IGM2["Lon"])

attributes(neo_IGM2[,2])
attributes(neo_IGM2$Lon)
attributes(neo_IGM2["Lon"])


## TAREA 14 ##
# Utilice el siguiente código para observar algunas de las consecuencias de la 
# diferencia entre neo_IGM2[,2] y neo_IGM2$Lon por un lado, y neo_IGM2["Lon"]
# por el otro. Lea cuidadosamente el mensaje de error después de la tercera 
# línea de código y explique el problema.

plot(neo_IGM2[,2], neo_IGM2[,3])
plot(neo_IGM2$Lon, neo_IGM2$Lat)
try(plot(neo_IGM2["Lon"], neo_IGM2["Lat"])) # Error A PROPÓSITO


## TAREA 15 ##
# Use corchetes de indexación para extraer de "neo_IGM2" sólo las zonas con
# valores numéricos de Ran, PETmin, y TOPOG. Guarde el resultado en una marco de 
# datos denominado "Neot.occ.IGM2". Utilice y estudie este código:

Neot.occ.IGM2 <- neo_IGM2[!is.na(neo_IGM2[,4]),]
Neot.occ.IGM2[1:5,]

# Ahora, el código para examinar ciertas relaciones es más simple. Por ejemplo, 
# para la TAREA 2 use:

plot(neo_IGM2[,2], neo_IGM2[,3])
points(Neot.occ.IGM2[,2], Neot.occ.IGM2[,3], pch=19)


# El segundo archivo, "data_neotropicooccidente_col.txt", también tiene
# encabezados y valores separados por comas. Su columna "Especimenes" trae el
# número de especímenes de herbario colectados en cada zona neotropical. Un
# investigador quiere usar esas colectas para estimar la riqueza de especies de
# cada área y poner a prueba predicciones derivadas del IGM2. Como antes, cada
# área se identifica por "Point.id" y por coordenadas proyectadas.

neo_COL <- read.table("Datasets/data_neotropicooccidente_col.txt",
                      header = TRUE, sep = ",")

## TAREA 16 ##
# Examine las cinco primeras filas y diga qué representa cada columna.
neo_COL[1:5,]


## TAREA 17 ##
# "neo_COL" tiene áreas para las cuales no hay información sobre el número de
# ejemplares: tienen "NA" en la columna "Especimenes". La línea de abajo usa
# indexación lógica para quedarse solo con las que sí tienen valor numérico.
# Explique qué hace exactamente '!is.na(neo_COL$Especimenes)'.
Neot.occ.COL <- neo_COL[!is.na(neo_COL$Especimenes), ]
Neot.occ.COL[1:5,]


## TAREA 18 ##
# ¿Cuáles son las dimensiones de "Neot.occ.IGM2" y de "Neot.occ.COL"? Utilice la 
# función "dim". ¿Tienen el mismo número de filas?


## TAREA 19 ##
# Use la función "identical" en combinación con corchetes de indexación para 
# determinar si las tres primeras columnas de "Neot.occ.IGM2" son idénticas a
# las respectivas columnas de "Neot.occ.COL".


## TAREA 20 ##
# Como las tres primeras columnas coinciden, podemos consolidar los datos en un
# solo marco de datos. Aquí se usa 'data.frame' para unir todas las columnas de
# "Neot.occ.IGM2" con la cuarta columna de "Neot.occ.COL".
# ¿Qué diferencia habría si usáramos 'cbind' en lugar de 'data.frame'?

Neot.occ <- data.frame(Neot.occ.IGM2, Neot.occ.COL[,4])

# Examine las primeras cinco filas de su resultado:

Neot.occ[1:5,]

# Cambie el nombre de la última columna de "Neot.occ" usando la función 
# "colnames". Primero, use este código para ver los nombres de las columnas de 
# "Neot.occ":

colnames(Neot.occ)

# Utilice corchetes de indexación para ver el nombre que va a cambiar:

colnames(Neot.occ)[7]

# Ahora, cambie el nombre usando el operador "<-" de asignar:

colnames(Neot.occ)[7] <- "Especimenes"

# Vea el resultado:

Neot.occ[1:5,]

# Examine Los atributos de "Neot.occ", y asegúrese de que se trata de un marco 
# de datos:

attributes(Neot.occ)


## TAREA 21 ##
# Examine la distribución del número de ejemplares en las zonas incluidas en
# "Neot.occ" usando la función "summary".


## TAREA 22 ##
# ¿Cuántas áreas hay en "Neot.occ" con menos de 500 especímenes de herbario?
# ¿Cuál es la PROPORCIÓN de áreas de "Neot.occ" con menos de 500 especímenes?


## TAREA 23 ##
# ¿Cuántas áreas hay en "Neot.occ" con menos de 1000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 1000 
# especímenes de herbario?
# ¿Cuántas áreas hay en "Neot.occ" con menos de 2.000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 2000 
# especímenes de herbario?
# ¿Cuántas áreas hay en "Neot.occ" con menos de 3000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 3000
# especímenes de herbario?


## TAREA 24 ##
# Cree un mapa de las áreas incluidas en "Neot.occ" usando el siguiente código:

plot(Neot.occ[,2], Neot.occ[,3], asp=1, xlab="Longitude (m)", 
  ylab="Latitude (m)", cex.axis=1.5, cex.lab=1.5)


## TAREA 25 ##
# Use la función "points" para distinguir (en el mapa que ha creado) las zonas 
# con al menos 3000 especímenes de herbario. Un investigador tiene previsto 
# utilizar estas áreas para probar predicciones derivadas del IGM2 dado que 
# están relativamente bien muestreadas. OK, 3000 especímenes no es mucho para 
# áreas de 100 km x 100 km (que es el tamaño de las zonas de "Neot.occ"), pero 
# es relativamente alto para el Neotrópico.


## TAREA 26 ##
# Examine la relación entre Ran y PETmin a través de las áreas de "Neot.occ"
# usando "plot" en combinación con corchetes de indexación.


## TAREA 27 ##
# Use la función "points" para distinguir áreas con al menos 3000 especímenes 
# de herbario (en la figura que ha creado en la tarea 27). Si el investigador 
# fuera a enfocarse en estas áreas, ¿se perdería una porción significativa de la 
# variación ambiental definida por Ran y PETmin?


## TAREA 28 ##
# Examine la relación entre Ran y el logaritmo natural de TOPOG a través de las 
# zonas de "Neot.occ" usando la función "plot" y corchetes para indexación. 
# Utilice la función "points" para diferenciar las zonas con al menos 3000
# especímenes de herbario. Si el investigador fuera a enfocarse en estas áreas, 
# ¿se perdería una porción significativa de la variación ambiental definida por 
# Ran y TOPOG?


## TAREA 29 ##
# Examine la relación entre PETmin y el logaritmo natural de TOPOG a través de 
# las zonas de "Neot.occ" utilizando la función "plot" y corchetes. Utilice
# la función de "points" para distinguir áreas con al menos 3.000 especímenes de 
# herbario.


## TAREA 30 ##
# Calcula el rango de Ran, PETmin y TOPOG en las zonas de "Neot.occ" que tienen
# al menos 3.000 especímenes de herbario.


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/6-2_manipulacion_de_objetos_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/6-2_manipulacion_de_objetos_soluciones.r")
