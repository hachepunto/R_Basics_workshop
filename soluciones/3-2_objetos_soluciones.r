################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 3-2: Objetos - SOLUCIONES                                      ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "3-2_objetos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("3-2_objetos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("3-2_objetos.r")


## TAREA 1 ##
# class(rand.1) -> "numeric": es un vector numérico.
# mode(rand.1)  -> "numeric": el tipo de dato que contiene.
# length(rand.1) -> 100: número de elementos.


## TAREA 2 ##
# No salen exactamente 5 y 1.5. 'rnorm' toma una MUESTRA de 100 valores de una
# distribución cuyos parámetros poblacionales son 5 y 1.5; la media y la
# desviación de una muestra finita fluctúan alrededor de esos valores.


## TAREA 3 ##
# No es idéntica: son dos muestras independientes de la misma distribución.


## TAREA 4 ##
# Cambió la clase y el modo (de "numeric" a "character"). NO cambió la longitud
# (siguen siendo 100 elementos).


## TAREA 5 ##
# 'rand.2' se imprime con comillas alrededor de cada valor; 'rand.1' no.


## TAREA 6 ##
help(identical)
# Comprueba si dos objetos son exactamente iguales, incluyendo tipo y atributos.
# Es FALSE porque uno es vector numérico y el otro vector de caracteres.


## TAREA 7 ##
# Al pasar de número a texto se conservan solo unas 15 cifras significativas,
# así que en el viaje de ida y vuelta se pierde algo de precisión. Las
# diferencias son del orden de 1e-16, no exactamente cero.


## TAREA 8 ##
help(sample)
# 'seq.1' tiene 5 elementos y le pedimos una muestra de 10. Sin reemplazo eso es
# imposible; hay que poner replace = TRUE.


## TAREA 9 ##
# Porque 'as.character' convirtió los números en texto. "7" es la cadena de un
# carácter, no el número siete. R no mira el contenido, mira el tipo.


## TAREA 10 ##
# rand.4 es "numeric"; rand.5 es "factor". Los levels de rand.5 son las
# categorías distintas que aparecen: "1", "2", ..., "10".


## TAREA 11 ##
# Con un vector numérico, 'plot' hace un diagrama de dispersión (valor contra
# índice). Con un factor, 'plot' hace una gráfica de barras con el número de
# observaciones por nivel.


## TAREA 12 ##
help(rpois)
# 'rpois' toma valores al azar de una distribución de Poisson. La línea:
#   1. Crea un vector de 1000 valores de una Poisson con lambda = 1.
#   2. Crea otro vector de 1000 valores con lambda = 10.
#   3. Multiplica elemento por elemento los vectores de los pasos 1 y 2.
#   4. Acomoda el resultado en una matriz de 50 columnas y las filas necesarias.


## TAREA 13 ##
# 50 columnas (ncol = 50) y 20 filas (1000 valores / 50 columnas). Longitud 1000.
dim(M.abund)
length(M.abund)


## TAREA 14 ##
# Al escribir "M.abund" entre comillas le pasamos a 'ncol' un pedazo de texto,
# no el objeto. 'ncol' de un texto es NULL, y 1:NULL no produce una secuencia
# utilizable.


## TAREA 15 ##
# "character": aunque los valores DENTRO de M.abund son números, sus nombres son
# texto. Aquí preguntamos la clase de los nombres, no la de la matriz.


## TAREA 16 ##
# class(M.presence) -> "matrix" "array"; mode(M.presence) -> "logical".


## TAREA 17 ##
# 'colMeans' calcula una media por columna, así que el vector resultante hereda
# los nombres de columna de 'M.abund' (los que pusimos en la TAREA 14).


## TAREA 18 ##
help(lm)
# 'lm' ajusta modelos lineales. La clase del objeto es "lm".


## TAREA 19 ##
# Por dentro es una LISTA: 'str' muestra sus elementos con $ (coefficients,
# residuals, fitted.values, etc.).


## TAREA 20 ##
summary(LM.abund.occup)
# En estos datos simulados suele haber una relación positiva fuerte: las
# especies más abundantes en promedio están presentes en más sitios.


## TAREA 21 ##
plot(spp.occup, spp.abund, cex = 1.5, pch = 21, col = "black", bg = "grey30",
     xlab = "Ocupancia de la especie", ylab = "Abundancia media de la especie")
abline(LM.abund.occup, col = "red", lwd = 2)


## TAREA 22 ##
site.density <- rowSums(M.abund)   # individuos totales por sitio
site.rich <- rowSums(M.presence)   # especies presentes por sitio

plot(site.density, site.rich, cex = 1.5, pch = 21, col = "black", bg = "grey30",
     xlab = "Densidad del sitio", ylab = "Riqueza del sitio")

LM.rich.dens <- lm(site.rich ~ site.density)
summary(LM.rich.dens)
abline(LM.rich.dens, col = "red", lwd = 2)


## TAREA 23 ##
help(rm)
# 'rm' elimina objetos de la sesión de R. En la segunda salida de 'ls()' ya no
# aparece 'basura'.


## TAREA 24 ##
# 'sample' tomó 50 valores del vector de 52 letras (26 minúsculas + 26
# mayúsculas). replace = TRUE no era estrictamente necesario aquí (50 < 52),
# pero permite que una misma letra salga repetida.


## TAREA 25 ##
L.vector[3]   # indexación por POSICIÓN: el tercer elemento
L.vector["3"] # indexación por NOMBRE: el elemento que se llama "3"
# En este caso coinciden porque pusimos como nombres 1, 2, 3, ... en orden.
# Si los nombres estuvieran en otro orden, darían resultados distintos.


## TAREA 26 ##
dim(L)
# 10 columnas: 50 elementos repartidos en 5 filas.


## TAREA 27 ##
# 'read.table' siempre produce un data.frame. 139 observaciones, 13 variables.
class(streb)
nrow(streb)
ncol(streb)


## TAREA 28 ##
colnames(streb)


## TAREA 29 ##
# Reemplazó los nombres de fila (que eran "1", "2", ...) por "obs_1", "obs_2",
# etc., usando 'paste' para pegar el prefijo con el número de cada observación.


## TAREA 30 ##
# 'str' muestra la ESTRUCTURA: clase de cada columna y sus primeros valores.
# 'summary' muestra un RESUMEN ESTADÍSTICO: cuartiles para las numéricas y
# conteos por nivel para los factores.


## TAREA 31 ##
# streb_sex es "factor"; streb_sex.2 es "character".


## TAREA 32 ##
levels(streb_sex)   # Reporta los niveles del factor: "h" y "m".
levels(streb_sex.2) # Reporta NULL, porque un vector de caracteres no tiene niveles.


## TAREA 33 ##
# plot(streb_sex) hace una gráfica de barras con el número de observaciones por
# nivel. plot(streb_sex.2) produce un error: 'plot' intenta convertir el texto a
# número, obtiene NA y se queda sin valores finitos para los ejes
# ("need finite 'ylim' values").


## TAREA 34 ##
identical(streb_sex, streb_sex.2)
# FALSE: tienen la misma información, pero uno es factor y el otro carácter.


## TAREA 35 ##
head(SexMatrix)
# Como las matrices solo admiten un tipo de dato, el factor se convirtió primero
# a sus códigos numéricos internos (1, 2) y luego, por la presencia de la
# segunda columna de texto, TODO se convirtió a carácter. Por eso la primera
# columna dice "1" y "2" en vez de "h" y "m": un error clásico y silencioso.


## TAREA 36 ##
# Sí da error, porque el último vector tiene 11 valores y los demás 10. Un marco
# de datos exige que todas las columnas tengan la misma longitud.


## TAREA 37 ##
# Volvimos a crear V4 con 10 elementos, así que ya todas las columnas coinciden.


## TAREA 38 ##
# Una lista admite elementos de longitudes distintas; un marco de datos no:
V5 <- 1:3
DF.list$V5 <- V5
str(DF.list)          # La lista lo acepta sin problema.
try(data.frame(DF, V5)) # El marco de datos lo rechaza.
