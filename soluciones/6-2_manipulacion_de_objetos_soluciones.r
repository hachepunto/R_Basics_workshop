################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 6-2: Indexación de objetos - SOLUCIONES                        ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "6-2_manipulacion_de_objetos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("6-2_manipulacion_de_objetos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("6-2_manipulacion_de_objetos.r")


## TAREA 1 ##
neo_IGM2[1:5, ]
head(neo_IGM2) # equivalente para las 6 primeras
dim(neo_IGM2)
class(neo_IGM2) # "data.frame": 'read.table' siempre produce marcos de datos


## TAREA 2 ##
# Ya tiene todas las respuestas en el cuerpo del ejercicio.


## TAREA 3 ##
# 'asp = 1' fija la razón de aspecto: una unidad en el eje x mide en pantalla lo
# mismo que una unidad en el eje y. Sin eso el mapa sale deformado.


## TAREA 4 ##
# Ya tiene todas las respuestas en el cuerpo del ejercicio.


## TAREA 5 ##
# Ya tiene todas las respuestas en el cuerpo del ejercicio.


## TAREA 6 ##
plot(neo_IGM2[,4], log(neo_IGM2[,6]), pch=19, xlab="Ran (mm)",
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)


## TAREA 7 ##
plot(neo_IGM2[,5], log(neo_IGM2[,6]), pch=19, xlab="PETmin (mm)",
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)


## TAREA 8 ##
range(neo_IGM2[!is.na(neo_IGM2[,4]),4])


## TAREA 9 ##
# El problema es que la columna tiene NAs y 'range' los propaga: devuelve
# NA NA. Hay dos soluciones:
range(neo_IGM2[!is.na(neo_IGM2[,4]),4]) # quitar los NA antes
range(neo_IGM2[,4], na.rm=TRUE)         # o pedirle a 'range' que los ignore


## TAREA 10 ##
range(neo_IGM2[,5], na.rm=TRUE)


## TAREA 11 ##
range(neo_IGM2[,6], na.rm=TRUE)


## TAREA 12 ##
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

range(neo_IGM2$Ran, na.rm=TRUE)
range(neo_IGM2$PETmin, na.rm=TRUE)
range(neo_IGM2$TOPOG, na.rm=TRUE)


## TAREA 13 ##
# neo_IGM2[,2] y neo_IGM2$Lon EXTRAEN la columna: devuelven un vector, y los
# atributos del marco de datos se pierden.
# neo_IGM2["Lon"] hace un SUBCONJUNTO: devuelve un marco de datos de una sola
# columna, que conserva los atributos (nombres de columna, de fila, clase).
class(neo_IGM2[,2])
class(neo_IGM2$Lon)
class(neo_IGM2["Lon"])


## TAREA 14 ##
# Las dos primeras líneas funcionan porque 'plot' recibe dos vectores
# numéricos. La tercera falla porque recibe dos marcos de datos, y 'plot' no
# sabe qué hacer con ellos. Si quisiera usar esa notación, tendría que ser
# neo_IGM2[["Lon"]] (dobles corchetes), que sí extrae el vector.
class(neo_IGM2[["Lon"]])


## TAREA 15 ##
# Ya tiene todas las respuestas en el cuerpo del ejercicio.


## TAREA 16 ##
head(neo_COL)
# Point.id: identificador del área. Lon y Lat: coordenadas proyectadas.
# Especimenes: número de ejemplares de herbario colectados en esa área.


## TAREA 17 ##
# 'is.na(x)' devuelve TRUE donde hay un NA. El '!' lo niega, así que
# '!is.na(neo_COL$Especimenes)' es TRUE donde SÍ hay un valor numérico. Ese
# vector lógico, puesto en la posición de las filas, se queda solo con esas.
dim(neo_COL)
dim(Neot.occ.COL)


## TAREA 18 ##
dim(Neot.occ.IGM2)
dim(Neot.occ.COL)
# Sí: los dos tienen el mismo número de filas, porque los NA de los dos archivos
# están en las mismas áreas.


## TAREA 19 ##
identical(Neot.occ.IGM2[,1:3], Neot.occ.COL[,1:3])


## TAREA 20 ##
# 'data.frame' y 'cbind' dan aquí un resultado equivalente, pero no son lo
# mismo: 'cbind' sobre marcos de datos llama internamente a 'data.frame', y
# sobre matrices produce una matriz (un solo tipo de dato para todo). Con
# 'data.frame' queda explícito que el resultado es un marco de datos.
colnames(Neot.occ)
colnames(Neot.occ)[7]
colnames(Neot.occ)[7] <- "Especimenes"
Neot.occ[1:5,]
attributes(Neot.occ)


## TAREA 21 ##
summary(Neot.occ$Especimenes)


## TAREA 22 ##
# Número de áreas con menos de 500 especímenes:
sum(Neot.occ$Especimenes<500)
# Proporción de áreas con menos de 500 especímenes:
sum(Neot.occ$Especimenes<500)/length(Neot.occ$Especimenes)
# Truco: R trata los TRUE como 1 y los FALSE como 0, así que 'sum' de un vector
# lógico cuenta los TRUE y 'mean' da directamente la proporción:
mean(Neot.occ$Especimenes<500)


## TAREA 23 ##
for (umbral in c(1000, 2000, 3000)) {
  cat("Menos de", umbral, "especímenes: n =",
      sum(Neot.occ$Especimenes < umbral), "| proporción =",
      round(mean(Neot.occ$Especimenes < umbral), 3), "\n")
}


## TAREA 24 ##
plot(Neot.occ[,2], Neot.occ[,3], asp=1, xlab="Longitud (m)",
  ylab="Latitud (m)", cex.axis=1.5, cex.lab=1.5)


## TAREA 25 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,2],
  Neot.occ[Neot.occ$Especimenes>=3000,3], pch=19, col="red")


## TAREA 26 ##
plot(Neot.occ[,4], Neot.occ[,5], xlab="Precipitación anual media (mm)",
  ylab="Evapotranspiración potencial mínima mensual (mm)", cex.axis=1.5,
  cex.lab=1.5)


## TAREA 27 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,4],
  Neot.occ[Neot.occ$Especimenes>=3000,5], pch=19, col="red")
# Los puntos rojos cubren buena parte de la nube, pero se concentran en ciertas
# combinaciones de clima: sí se perdería parte de la variación ambiental.


## TAREA 28 ##
plot(Neot.occ[,4], log(Neot.occ[,6]), xlab="Precipitación anual media (mm)",
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,4],
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 29 ##
plot(Neot.occ[,5], log(Neot.occ[,6]),
  xlab="Evapotranspiración potencial mínima mensual (mm)",
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,5],
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 30 ##
range(Neot.occ[Neot.occ$Especimenes>=3000,4])
range(Neot.occ[Neot.occ$Especimenes>=3000,5])
range(Neot.occ[Neot.occ$Especimenes>=3000,6])
