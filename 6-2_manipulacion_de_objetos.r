################################################################################
### R BASICS WORKSHOP                                                                    ###
### EJERCICIO 7-2: Indexación de objectos (y un poco de gráficos)            ###
###                                                                                                 ###
### Unida de Servicios Bioinformáticos                                      ###
### Instituto Nacional de Medicina Genómica                                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                                         ### 
################################################################################

### INTRODUCCIÓN ############################################## #################
# En este ejercicio, usted explorará valores de las variables predictoras para 
# el modelo IGM2 (el modelo discutido en el ejercicio 5.1). Usted va a utilizar 
# un set de datos con los valores de precipitación anual (Ran, en mm), la 
# evapotranspiración potencial mínima (PETmin, en milímetros) y de la elevación 
# (TOPOG, en metros ) para áreas a través del Neotrópico occidental.


## TAREA 1 ##
# Definir el directorio de trabajo utilizando la función "setwd". Verificar el 
# cambio correcto utilizando la función "getwd". Aquí también puede usa las 
# opciones en las pestañas de las ventanas de R o RStudio.


## TAREA 2 ##
# Use la función "read.table" para crear un objeto (clase marco de datos) 
# llamado "neo_IGM2" con los datos en el archivo "data_neotropicooccidente_igm2.txt" 
# (disponible en el sitio web del taller). Este archivo tiene valores separados 
# por comas y columnas con nombres en la primera fila. El archivo contiene los 
# valores de Ran, PETmin y TOPOG para varias zonas Neotropicales. Cada área se 
# identifica por un número (columna "Point.id") y las coordenadas ("Lat" y 
# "Lon"). Estas coordenadas se proyectan geográficamente de manera que 
# corresponden al centro de celdas de una cuadrícula de igual área (i.e., estas
# no son latitud y longitud en grados decimales). Cada área tiene a 100 km x 100 
# kilómetros. Una vez haya abierto el archibo, examine las cinco primeras filas 
# escribiendo "neo_IGM2 [1: 5,]" en la consola.


## TAREA 3 ##
# El marco de datos "neo_IGM2" tiene valores perdidos de PETmin o TOPOG en 
# varias áreas geográficas. Estas áreas muestran "NA" en lugar de valores 
# numéricos. El siguiente código utiliza la función "plot", junto con corchetes
# (para la indexación) para visualizar todas las áreas de "neo_IGM2". Luego, 
# utiliza la función "points" y corchetes de indexación para diferenciar las 
# zonas con valores numéricos de Ran, PETmin y TOPOG.  

plot(neo_IGM2[,2], neo_IGM2[,3])
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 4 ##
# Para representar mejor el Neotrópico occidental,utilice el argumento "asp = 1" 
# de la función "plot". Lea sobre este argumento en la página de ayuda para la 
# función "plot".

plot(neo_IGM2[,2], neo_IGM2[,3], asp=1)
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 5 ##
# Use y estudie el código siguiente para examinar la relación entre Ran y
# PETmin a través del Neotrópico:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")
#or
plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")


## TAREA 6 ##
# Lleve a cabo una versión modificada de la tarea 5 usando argumentos "cex.axis" 
# y "cex.lab". Use y estudie este código:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", 
  cex.axis=1.5, cex.lab=1.5)


## TAREA 7 ##
# Inspeccione la relación entre Ran y el logaritmo natural de TOPOG usando la
# función "plot".


## TAREA 8 ##
# Ver la relación entre PETmin y el logaritmo natural de TOPOG usando la
# función "plot"


## TAREA 9 ##
# Calcule el rango de los valores de Ran utilizando la función "range". Consulte 
# la ayuda de esta función. Estudie este código:

range(neo_IGM2[!is.na(neo_IGM2[,4]),4])


## TAREA 10 ##
# Un investigador intenta obtener el rango de valores de Ran a través de todo el
# Neotrópico utilizando este código:

range(neo_IGM2[,4])

# Hay un problema, lo puede ver? Describa el problema y resuelvalo. Lea la 
# página de ayuda de la función "range".


## TAREA 11 ##
# Calcule el rango de valores de PETmin.


## TAREA 12 ##
# Calcule el rango de valores de TOPOG


## TAREA 13 ##
# Lleve a cabo versiones modificadas de las TAREAS 3 a 12 usando el operador "$" 
# y los nombres de las columnas de "neo_IGM2". Por ejemplo, para la tarea 3, 
# utilice este código:

plot(neo_IGM2$Lon, neo_IGM2$Lat)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], pch=19)


## TAREA 14 ##
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


## TAREA 15 ##
# Utilice el siguiente código para observar algunas de las consecuencias de la 
# diferencia entre neo_IGM2[,2] y neo_IGM2$Lon por un lado, y neo_IGM2["Lon"]
# por el otro. Lea cuidadosamente el mensaje de error después de la tercera 
# línea de código y explique el problema.

plot(neo_IGM2[,2], neo_IGM2[,3])
plot(neo_IGM2$Lon, neo_IGM2$Lat)
plot(neo_IGM2["Lon"], neo_IGM2["Lat"])


## TAREA 16 ##
# Use corchetes de indexación para extraer de "neo_IGM2" sólo en las zonas con
# valores numéricos de Ran, PETmin, y TOPOG. Guarde el resultado en una marco de 
# datos denominado "Neot.occ.IGM2". Utilice y estudie este código:

Neot.occ.IGM2 <- neo_IGM2[!is.na(neo_IGM2[,4]),]
Neot.occ.IGM2[1:5,]

# Ahora, el código para examinar ciertas relaciones es más simple. Por ejemplo, 
# para la TAREA 3 use:

plot(neo_IGM2[,2], neo_IGM2[,3])
points(Neot.occ.IGM2[,2], Neot.occ.IGM2[,3], pch=19)


## TAREA 17 ##
# Utilice la función "read.table" para crear un marco de datos denominado 
# "neo_COL" con los datos del archivo "neotropicooccidente_col.txt" (disponible 
# en el sitio web del taller). Tenga en cuenta que las columnas en el archivo 
# "neotropicooccidente_col.txt" tienen cabeceras y que los valores están 
# separados por comas. En la columna "especimenes" de este marco de 
# se encuentra el número de especímenes de herbario que se han recogido en
# varias zonas neotropicales. Un investigador quiere utilizar estas muestras 
# para calcular la riqueza de especies en cada áreas para poner a prueba 
# predicciones derivadas del IGM2. Cada área se identifica con un número en la 
# columna "Point.id" y coordenadas ("Latitud" y "Lon"). Como antes,  las 
# coordenadas están proyectadas. Después de crear el marco de datos, examine las cinco 
# primeras filas usando:
neo_COL[1:5,]


## TAREA 18 ##
# El marco Datos "neo_COL" tiene áreas geográficas para las cuales no hay 
# información en el número de ejemplares disponibles. Estas áreas tienen "NA" en 
# lugar de un valor numérico en la columna "especimenes". Use corchetes de 
# indexación para extraer del marco de datos "neo_COL" sólo valores numéricos 
# para "especimenes". Almacene los resultados en un nuevo marco de datos llamado 
# "Neot.occ.COL". Examine el resultado mirando las primeras cinco filas:
Neot.occ.COL[1:5,]


## TAREA 19 ##
# ¿Cuáles son las dimensiones de "Neot.occ.IGM2" y de "Neot.occ.COL"? Utilice la 
# función "dim". Tienen el mismo número de filas?


## TAREA 20 ##
# Use la función "identical" en combinación con corchetes de indexación para 
# determinar si las tres primeras columnas de "Neot.occ.IGM2" son idénticas a
# las respectivas columnas de "Neot.occ.COL".


## TAREA 21 ##
# Si las tres primeras columnas de "Neot.occ.IGM2" son idénticas a las de
# "Neot.occ.COL", proceda a la consolidación de los datos en un solo marco de 
# datos. Si no son identicas, examine su código para descubrir la causa de las 
# diferencias. Consolide los datos en un marco de datos llamado "Neot.occ". 
# Utilice la función "data.frame" para unir todas las columnas de "Neot.occ.IGM2" 
# con la cuarta columna de "Neot.occ.COL".

Neot.occ <- cbind(Neot.occ.IGM2, Neot.occ.COL[,4])

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


## TAREA 22 ##
# Examine la distribución del número de ejemplares en las zonas incluidas en
# "Neot.occ" usando la función "summary".


## TAREA 23 ##
# ¿Cuántas áreas hay en "Neot.occ" con menos de 500 especímenes de herbario?
# ¿Cuál es la proporción de las áreas de "Neot.occ" con menos de 500 herbario
especímenes #?


## TAREA 24 ##
# ¿Cuántas áreas hay en "Neot.occ" con menos de 1000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 1000 
# especímenes de herbario?
# ¿Cuántas áreas hay en "Neot.occ" con menos de 2.000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 2000 
# especímenes de herbario?
# ¿Cuántas áreas hay en "Neot.occ" con menos de 3000 especímenes de herbario?
# ¿Cuál es la proporción de áreas de "Neot.occ" con menos de 3000
# especímenes de herbario?


## TAREA 25 ##
# Cree un mapa de las áreas incluidas en "Neot.occ" usando el siguiente código:

plot(Neot.occ[,2], Neot.occ[,3], asp=1, xlab="Longitude (m)", 
  ylab="Latitude (m)", cex.axis=1.5, cex.lab=1.5)


## TAREA 26 ##
# Use la función "points" para distinguir (en el mapa que ha creado) las zonas 
# con al menos 3000 especímenes de herbario. Un investigador tiene previsto 
# utilizar estas áreas para probar predicciones derivadas del IGM2 dado que 
# están relativamente bien muestreadas. OK, 3000 especímenes no es mucho para 
# áreas de 100 km x 100 km (que es el tamaño de las zonas de "Neot.occ"), pero 
# es relativamente alto para el Neotrópico.


## TAREA 27 ##
# Examine la relación entre Ran y PETmin a través de las áreas en las "Neot.occ"
# usando "plot" en combinación con corchetes de indexación.


## TAREA 28 ##
# Use la función "points" para distinguir áreas con al menos 3.000 especímenes 
# de herbario (en la figura que ha creado en la tarea 27). Si el investigador 
# fuera a enfocarse en estas áreas, ¿se perdería una porción significativa de la 
# variación ambiental definida por Ran y PETmin?


## TAREA 29 ##
# Examine la relación entre Ran y el logaritmo natural de TOPOG a través de las 
# zonas de "Neot.occ" usando la función "plot" y corchetes para indexación. 
# Utilice la función "points" para diferenciar las zonas con al menos 3000
# especímenes de herbario. Si el investigador fuera a enfocarse en estas áreas, 
# ¿se perdería una porción significativa de la variación ambiental definida por 
# Ran y TOPOG?


## TAREA 30 ##
# Examine la relación entre PETmin y el logaritmo natural de TOPOG a través de 
# las zonas de "Neot.occ" utilizando la función "plot" y corchetes. Utilice
# la función de "points" para distinguir áreas con al menos 3.000 especímenes de 
# herbario.


## TAREA 31 ##
# Calcula el rango de Ran, PETmin y TOPOG en las zonas de "Neot.occ" que tienen
# al menos 3.000 especímenes de herbario.




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
setwd("C:/_transfer/R_Basics_Workshop/St_Louis_May_2015/Drafts/Day2") 
# Este es directorio de trabajo en la computadora de Iván

getwd()


## TAREA 2 ##
neo_IGM2 <- read.table("data_neotropicooccidente_igm2.txt", header=T, sep=",")
neo_IGM2[1:5,]
#or
head(neo_IGM2)

## TAREA 3 ##
# Ya tiene todas las respuestas


## TAREA 4 ##
# Ya tiene todas las respuestas


## TAREA 5 ##
# Ya tiene todas las respuestas


## TAREA 6 ##
# Ya tiene todas las respuestas


## TAREA 7 ##
plot(neo_IGM2[,4], log(neo_IGM2[,6]), pch=19, xlab="Ran (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 


## TAREA 8 ##
plot(neo_IGM2[,5], log(neo_IGM2[,6]), pch=19, xlab="PETmin (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)


## TAREA 9 ##
# Ya tiene todas las respuestas


## TAREA 10 ##
range(neo_IGM2[!is.na(neo_IGM2[,4]),4])
#or
range(neo_IGM2[,4], na.rm=T)


## TAREA 11 ##
range(neo_IGM2[!is.na(neo_IGM2[,5]),5])
#or
range(neo_IGM2[,5], na.rm=T)


## TAREA 12 ##
range(neo_IGM2[!is.na(neo_IGM2[,6]),6])
#or
range(neo_IGM2[,6], na.rm=T)


## TAREA 13 ##

plot(neo_IGM2$Lon, neo_IGM2$Lat, asp=1)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], 
  pch=19)

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", 
  cex.axis=1.5, cex.lab=1.5)

plot(neo_IGM2$Ran, log(neo_IGM2$TOPOG), pch=19, xlab="Ran (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

plot(neo_IGM2$PETmin, log(neo_IGM2$TOPOG), pch=19, xlab="PETmin (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

range(neo_IGM2$Ran[!is.na(neo_IGM2$Ran)])
#o
range(neo_IGM2$Ran, na.rm=T)

range(neo_IGM2$PETmin[!is.na(neo_IGM2$PETmin)])
#o
range(neo_IGM2$PETmin, na.rm=T)

range(neo_IGM2$TOPOG[!is.na(neo_IGM2$TOPOG)])
#o
range(neo_IGM2$TOPOG, na.rm=T)


## TAREA 14 ##
#Los atributos del objeto original se mantienen cuando los elementos de un 
# objeto se accede utilizando nombres, un procedimiento mejor definido como 
# "subsetting". En contraste, los atributos del objeto original no se mantienen 
# cuando se usan corchetes rectangulares o el operador "$" para la indexación, 
# por lo tanto esto se puede pensar mejor como una "extracción".

## TAREA 15 ##
# Ya tiene todas las respuestas


## TAREA 16 ##
# Ya tiene todas las respuestas


## TAREA 17 ##
neo_COL <- read.table("data_neotropicooccidente_col.txt", header=T, sep=",")
neo_COL[1:5,]
#or
head(neo_COL) 


## TAREA 18 ##
Neot.occ.COL <- neo_COL[!is.na(neo_COL$Especimenes),]
Neot.occ.COL[1:5,]
head(Neot.occ.COL)


## TAREA 19 ##
dim(Neot.occ.IGM2)
dim(Neot.occ.COL)
#Si, "Neot.occ.IGM2" y "Neot.occ.COL" tienen el mismo número de filas.


## TAREA 20 ##
identical(Neot.occ.IGM2[,1:3], Neot.occ.COL[,1:3])

## TAREA 21 ##
# Ya tiene todas las respuestas


## TAREA 22 ##
summary(Neot.occ$Especimenes)


## TAREA 23 ##
# Número de áreas con menos de 500 especímenes:
sum(Neot.occ$Especimenes<500)
# Proporción de áreas con menos de 500 especímenes:
sum(Neot.occ$Especimenes<500)/length(Neot.occ$Especimenes)


## TAREA 24 ##
# Número de áreas con menos de 1000 especímenes:
sum(Neot.occ$Especimenes<1000)
# Proporción de áreas con menos de 1000 especímenes:
sum(Neot.occ$Especimenes<1000)/length(Neot.occ$Especimenes)

# Número de áreas con menos de 2000 especímenes:
sum(Neot.occ$Especimenes<2000)
# Proporción de áreas con menos de 2000 especímenes:
sum(Neot.occ$Especimenes<2000)/length(Neot.occ$Especimenes)

# Número de áreas con menos de 3000 especímenes:
sum(Neot.occ$Especimenes<3000)
# Proporción de áreas con menos de 3000 especímenes:
sum(Neot.occ$Especimenes<3000)/length(Neot.occ$Especimenes)


## TAREA 25 ##
# Ya tiene todas las respuestas


## TAREA 26 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,2], 
  Neot.occ[Neot.occ$Especimenes>=3000,3], pch=19, col="red")


## TAREA 27 ##
plot(Neot.occ[,4], Neot.occ[,5], xlab="Annual mean precipitation (mm)", 
  ylab="Min. monthly potential evapotranspiration (mm)", cex.axis=1.5, 
  cex.lab=1.5)


## TAREA 28 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,4], 
  Neot.occ[Neot.occ$Especimenes>=3000,5], pch=19, col="red")


## TAREA 29 ##
plot(Neot.occ[,4], log(Neot.occ[,6]), xlab="Annual mean precipitation (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,4], 
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 30 ##
plot(Neot.occ[,5], log(Neot.occ[,6]), 
  xlab="Min. monthly potential evapotranspiration (mm)", ylab="Log(TOPOG (m))", 
  cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,5], 
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 31 ##
range(Neot.occ[Neot.occ$Especimenes>=3000,4])
range(Neot.occ[Neot.occ$Especimenes>=3000,5])
range(Neot.occ[Neot.occ$Especimenes>=3000,6])


