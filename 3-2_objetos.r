################################################################################
### R BASICS WORKSHOP                                                					          ###
### EJERCICIO 3-2: objetos                    					                                  ###
###                                                               						                      ###
### Unida de Servicios Bioinformáticos    						                      ###
### Instituto Nacional de Medicina Genómica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## OBJETIVO:
## El objetivo de este ejercicio es familiarizarse con los diferentes tipos de
## objetos en R.


rand.1 <- rnorm(100, mean=5, sd=1.5)
# Crea un objeto con 100 valores aleatorios tomados de una distribución normal 
# con un promedio de 5 y una desviación estándar de 1,5.

## TAREA 1: ¿Qué clase de objeto es este?
## TAREA 2: ¿Qué tipo de datos contiene?
## TAREA 3: ¿Cuál es la longitud de este objeto?

## TAREA 4: ¿Cuáles son la media y la desviación estándar de "rand.1"

## TAREA 5: Re-escriba "rand.1" con otro conjunto de 100 valores aleatorios 
## tomados de una distribución normal con un promedio de 5 y una desviación 
## estándar de 1.5.

## TAREA 6: ¿Cuáles son la media y la desviación estándar de esta nueva versión 
## de rand.1? Es la media identica a la de antes? ¿Por qué sí / no?

?as.character
# Abre el archivo de ayuda para la función 'as.character'

## TAREA 7: Utilice la función "as.character" para crear un vector de caracteres 
## llamado 'rand.2' a partir de 'rand.1'.


class(rand.2)
mode(rand.2)
length(rand.2)
# Confirma los cambios realizados en el objeto.


rand.1
rand.2
## Al imprimir estos dos objetos en la pantalla, preste atención a cómo se ven
## o no diferentes.


identical(rand.1, rand.2)
## TAREA 8: ¿Qué hace la función 'identical'?, ¿por qué este resultado es falso?

## TAREA 9: Utilice la función 'as.numeric' para crear un nuevo objeto "rand.3"
## transformando de vuelta rand.2 a números. 

class(rand.1)
class(rand.3)
identical(class(rand.1), class(rand.3))
# Esto confirma el cambio



identical(rand.1, rand.3)
## TAREA 10: ¿Puede entender por qué esto todavía es falso? Calcule la 
## diferencia (resta) entre los valores de rand.1 y rand.3. Esta es una lección
## sobre precisión y la necesidad de tener cuidado cuando uno trabaja con valores
## muy pequeños.


seq.1 <- 1:5
seq.1
## Crea un vector con la secuencia 1, 2, 3, 4, 5.


## TAREA 11: Queremos crear un vector de longitud 10 que es una muestra 
## aleatoria de los números en 'seq.1'. Para ello, se utiliza la función 
## "sample". La línea de abajo, sin embargo, tiene un error. Solucione el 
## problema con la ayuda de la función y el error que resulta de correr esta 
## línea de código.
sample(x=seq.1, size=10)


## TAREA 12: Cree un objeto de nombre 'rand.3' (sobre-escribir el creado 
## previamente) el cual es un vector de caracteres de longitud 300 y que es una 
## muestra aleatoria de números enteros de 1 a 10.

is.numeric(rand.3)
# Esto debe ser falso (FALSE). 

is.character(rand.3)
# Esto debería ser TRUE

class(rand.3)
mode(rand.3)
length(rand.3)
# Confirma la clase, el modo y la longitud del objeto creado.


rand.4 <- as.numeric(rand.3)
# Crea un vector de transformación de los valores en 'rand.3' a números.

## TAREA 13: Cree una objeto llamado "rand.5" utilizando la función "as.factor" 
# para transofrmar el objeto "rand.4"
## TAREA 14: ¿Cuál es la clase de "rand.5"?



plot(rand.4, col="lightgreen")
plot(rand.5, col="blue")
# Aunque en esencia ambos objetos tienen números, la clase del objeto ("numeric" 
# o "factor") determina el comportamiento de la función "plot" para graficar los
# datos


M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
M.abund
## TAREA 15: ¿Qué hace la función de 'rpois'? ¿Qué hace esta línea de código?

class(M.abund)
## TAREA 16: Sin usar R, puede predecir las dimensiones de esta matriz?
## ¿Cuál será su longitud? Confirmar sus predicciones utilizando las funciones
## "dim" y "length".


# Supongamos que la matriz 'M.abund' es una matriz de abundancias de especies
# (columnas) en varios sitios (filas). En matrices como esta es útil tener
# nombres para las filas y las columnas. La siguiente línea de código crea 
# nombres para las columnas que representan diferentes especies.

## TAREA 17: Hay un error en la línea de abajo, lea el mensaje de error, 
## encuentre el error y solucionelo.
colnames(M.abund) <- paste("sp", 1:ncol("M.abund"), sep="_")
colnames(M.abund)
M.abund

## TAREA 18: ¿Puede predecir cuál será el resultado de la siguiente línea de 
## código?
class(colnames(M.abund))

## TAREA 19: Ahora, escriba el código para dar nombres a las filas 
## (que representan sitios) en esta la matriz.


M.presence <- M.abund > 0
## Luego vamos a aprender en más detalle sobre operadores en R, pero por ahora, 
## lo que esta línea de código hace es comparar cada elemento de la matriz 
## 'M.abund' al valor 0. Este código produce una nueva matriz llena de valores 
## TRUE o FALSE, dependiendo de si los valores en 'M.abund' son mayores a 0 
## o no. Las dimensiones de la nueva matriz son idénticas a la original. 

M.presence
## Confirma que el objeto se ve de la forma que debería. Observe que la nueva 
## matriz hereda los nombres de columnas y filas de la matriz 'M.abund'.

## TAREA 20: ¿Cuál será la clase de "M.presence"? ¿Cuál será su modo?


spp.abund <- colMeans(M.abund)
# La función "colMeans" calcula los promedios (medias) de cada columna. Esto 
# produce un vector con la media del número de individuos para cada especie.

## TAREA 21: ¿Cuáles son los nombres de los elementos de este vector? ¿De dónde 
## vienen estos nombres?


spp.occup <- colSums(M.presence)
# Este es un truco muy útil: R maneja TRUEs como 1s y FALSEs como 0s. Así, hacer 
# una suma por columnas de M.presence (llena de TRUE o FALSE) produce un vector 
# que cuenta el número de sitios en los que cada especie está presente.

# Ahora, veamos si hay una relación entre la abundancia y la ocupancia de cada 
# especie en estos datos simulados.

LM.abund.occup <- lm(spp.abund~spp.occup)
## TAREA 22: ¿Qué hace la función 'lm'?
## TAREA 23: ¿Cuál es la clase del objeto "LM.abund.occup"?
## TAREA 24: Investige la estructura de este objeto con la función 'str'.
## TAREA 25: Utilice la función "summary" sobre este objeto para obtener los 
## resultados.
## TAREA 26: Haga un simple diagrama de dispersión que corresponde a este 
## análisis utilizando la función "plot".

## TAREA 27: Haga un análisis similar que investiga la relación entre
## el número total de individuos en un sitio con la riqueza (número de especies)
## por sitio (use "rowSums" para obtener el número total de individuos por 
## sitio).


rm(M.abund)
## TAREA 28: ¿Qué hace la función "rm"?


sim.matrix <- matrix(rpois(50, 5), nrow=10, ncol=5)
# Crea una matriz de 5 columnas y 10 filas, llenándolo con valores aleatorios a 
# partir de una distribución de Poisson con una media de 5.

rownames(sim.matrix) <- paste("site", 1:nrow(sim.matrix), sep="_")
colnames(sim.matrix) <- paste("sp", 1:ncol(sim.matrix), sep="_")
# Crea nombres de filas y columnas para "sim.matrix".



letters
# 'letters' es un vector pre-derminado en R que contiene el alfabeto.

L.vector <- sample(c(letters, LETTERS), 50, replace=TRUE)
## TAREA 29: ¿Cuáles son la clase, el modo y longitud de este vector ("L.vector")?
## TAREA 30: Cree un vector con una sequencia de números enteros de 1 a la 
## longitud del vector de L.vector.
## TAREA 31: utilice el vector del paso anterior para poner nombres a los 
## elementos del vector "L.vector"

## TAREA 32: Cree una matriz denominada "L" que contiene los valores en el 
## vector "L.vector", y que tiene 5 filas (y tantas columnas como sean 
## necesarias para contener los datos).


### ** Descarge el archivo: StreblidaeOnBats.txt desde el sitio web del taller ** ###

# Usando de la siguiente línea de código, abra el archivo "StreblidaeOnBats.txt".
# Esta linea también pone los contenidos del archivo en un objeto llamado "streb".


streb <- read.table(file.choose(), header=TRUE, sep="\t")
# Este set de datos contiene información sobre la abundancia y riqueza de tres
# especies de ectoparásitos en murciélagos hospederos (filas). Estos datos 
# fueron colectados en múltiples localidades en Ecuador.

## TAREA 33: Sin utilizar R, ¿sabe qué tipo de objeto es "streb"? Confirme su 
## predicción en R.

dim(streb)
# Indica las dimensiones del Streb.


## TAREA 34: ¿Cuántas observaciones y cuántas variables existen en este set de 
## datos?
## TAREA 35: Obtenga los nombres de las variables en este set de datos.


rownames(streb)
# Obtiene los nombres de las filas/observaciones en el set de datos.

## TAREA 36: Cambie el nombre de las fila utilizando una combinación caracteres 
## "obs_" con el número de cada observación; por ejemplo 'obs_1', 'obs_2', etc.
## TAREA 37: ¿Cuál es la estructura del conjunto de datos? Utilice la función 
## "str".
## TAREA 38: Haga un resumen del conjunto de datos - utilice la función 
## "summary".


streb_sex <- streb$Sex
# Luego vamos a aprender más acerca sobre indización, pero por ahora, la línea 
# de arriba toma la columnas denominada "Sex" en el marco de datos "streb", y 
# pone los datos en un nuevo objeto llamado 'streb_sex'.
## TAREA 39: ¿Cuál es la clase de "streb_sex"?

streb_sex.2 <- as.character(streb$Sex)
## TAREA 40: ¿Cuál es la clase de "streb_sex.2"?

## TAREA 41: ¿Puede predecir los resultados de las siguientes líneas de código?
levels(streb_sex)
levels (streb_sex.2)


## TAREA 42: ¿Puede predecir los resultados de las siguientes líneas de código?
plot(streb_sex)
plot(streb_sex.2)

## Nótese cómo estas dos líneas imprimen los datos ligeramente diferentes
streb_sex
as.character(streb_sex)

## TAREA 43: Utilice la función "identical" para comparar "streb_sex" y 
## "streb_sex.2". Los dos objetos tienen los mismos datos?

SexMatrix <- cbind(streb_sex, as.character(streb_sex))
# La función "cbind" concatena vectores para hacer matrices, cada vector se 
# convierte en una columna distinta.

SexMatrix
## TAREA 44: ¿Qué pasó con los datos del factor "streb_sex" cuando se usa para
## crear una matriz?

## Ejecute el siguiente código, el cual crea una serie de vectores:
V1 <- rnorm(10)
class(V1)

V2 <- rpois(10,  5)
class(V2)

V3 <- sample(letters, 10)
class(V3)

V4 <- sample(c(TRUE, FALSE), 11, replace=TRUE)
class(V4)

## TAREA 45: ¿Puede predecir (antes de correr el código) si el siguiente 
## código producirá un error?
DF <- data.frame(V1, V2, V3, V4)

## TAREA 46: Cambie cómo se creó "V4" para que tenga solo 10 elementos. Entonces
## produzca el marco de datos otra vez utilizando los vectores "V1" a "V4."
## TAREA 47: Produzca una lista con el nombre "DF.list" que tenga los mismos 
## datos que "DF", y donde cada elemento de la lista sea uno de los vectores 
## V1 a V4.




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
class(rand.1) # Vector numérico


## TAREA 2 ##
mode(rand.1)


## TAREA 3 ##
length(rand.1)


## TAREA 4 ##
mean(rand.1)
sd(rand.1)


## TAREA 5 ##
rand.1 <- rand(100, mean=5, sd=1.5)


## TAREA 6 ##
mean(rand.1)
sd(rand.1)
# No, porque estas son muestras independientes


## TAREA 7 ##
rand.2 <- as.character(rand.1)


## TAREA 8 ##
help(identical)
# Comprueba si dos objetos son exactamente iguales. Es FALSE, porque se trata de 
# un vector numérico versus un vector de caracteres


## TAREA 9 ##
rand.3 <- as.numeric(rand.2)


## TAREA 10 ##
rand.1 - rand.3
# Las diferencias están cerca, pero no son exactamente cero. En el cambio de 
# tipo de datos se pierde cierta precisión


## TAREA 11 ##
help(sample)
sample(x=seq.1, size=10, replace=TRUE)


## TAREA 12 ##
rand.3 <- as.character(sample(1:10, size=300, replace=TRUE))


## TAREA 13 ##
rand.5 <- as.factor(rand.4)


## TAREA 14 ##
class(rand.5)


## TAREA 15 ##
help(rpois)
# rpois toma valores al azar de una distribución Poisson

M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
                    # 1. Crear un vector de 100 valores a partir de una 
                    #    distribución de Poisson con lambda = 1
                    # 2. Crear otro vector como en el paso 1.
                    # 3. Multiplica cada elemento de los vectores creados en los 
                    #    pasos 1 y 2.
                    # 4. Pone el resultado del paso 3 en una matriz de 50 
                    #    columnas y tantas filas como sean necesarias.


## TAREA 16 ##
# 50 columnas establecidas en el momento de ajustar el parámetro ncol = 50
# 20 filas porque, con 50 columnas, se necesitan 20 filas para almacenar 1000 valores
# Longitud de 1000 porque son 1000 valores en esta matriz
dim(M.abund)
length(M.abund)


## TAREA 17 ##
# Cuando se utiliza "M.abund", esperamos acceder a los valores dentro del objeto 
# (matriz).
# Debido a que está entre comillas, le estamos diciendo que esto es pedazo de 
# texto, no el nombre de un objeto
colnames(M.abund) <- paste("sp", 1:ncol(M.abund), sep="_")


## TAREA 18 ##
# Será carcter porque, a pesar de que los valores dentro de "M.abund" son 
# números, los nombres de "M.abund" son texto. Aquí estamos pidiendo la clase de 
# los nombres, no la clase de la matriz
class(colnames(M.abund))


## TAREA 19 ##
rownames(M.abund) <- paste("site", 1:nrow(M.abund), sep="_")


## TAREA 20 ##
class(M.presence)
mode(M.presence)


## TAREA 21 ##
names(spp.abund)
# Estas son las sumas por columna, por lo tanto los nombres provienen de los 
# nombres de las columnas de "M.presence"


## TAREA 22 ##
help(lm)
# "lm" crea modelos lineales 


## TAREA 23 ##
class(LM.abund.occup)


## TAREA 24 ##
str(LM.abund.occup)


## TAREA 25 ##
summary(LM.abund.occup)


## TAREA 26 ##
plot(spp.occup, spp.abund, cex=1.5, pch=21, col="black", bg="grey30",
  xlab="Species Occupancy", ylab="Species Mean Abundance")


## TAREA 27 ##
site.density <- rowSums(M.abund)
site.rich <- rowSums(M.presence)

plot(site.density, site.rich, cex=1.5, pch=21, col="black", bg="grey30",
  xlab="Site Density", ylab="Site Richness")

LM.rich.dens <- lm(site.rich~site.density)
summary(LM.rich.dens)


## TAREA 28 ##
help(rm)
# "rm" remueve objetos de la sesión de R


## TAREA 29 ##
class(L.vector)
mode(L.vector)
length(L.vector)


## TAREA 30 ##
seq(from=1, to=length(L.vector), by=1)
# or
1:length(L.vector)


## TAREA 31 ##
names(L.vector) <- 1:length(L.vector)


## TAREA 32 ##
L <- matrix(L.vector, nrow=5)


## TAREA 33 ##
# data.frame. La funcion "read.table" siempre produce marcos de datos
class(streb)


## TAREA 34 ##
dim(streb)
# 139 observaciones
# 13 variables


## TAREA 35 ##
colnames(streb)


## TAREA 36 ##
rownames(streb) <- paste("obs", 1:nrow(streb), sep="_")


## TAREA 37 ##
str(streb)


## TAREA 38 ##
summary(streb)


## TAREA 39 ##
class(streb_sex)


## TAREA 40 ##
class(streb_sex.2)


## TAREA 41 ##
levels(streb_sex) # Reporta los niveles de la variable
levels(streb_sex.2) # Reporta nada porque este no es un factor


## TAREA 42 ##
plot(streb_sex) # Hace un plot del número de observaciones por nivel
plot(streb_sex.2) # No hace nada porque este es un vector de caracteres


## TAREA 43 ##
identical(streb_sex, streb_sex.2)


## TAREA 44 ##
SexMatrix
# Debido a que las matrices pueden contener sólo un tipo de datos, estos datos
# numéricos se transformaron a texto


## TAREA 45 ##
# Debido a que el último vector utilizado para construir el marco de datos 
# contiene 11 valores, mientras que todos los otros contienen 10


## TAREA 46 ##
V4 <- sample(c(TRUE, FALSE), 10, replace=TRUE)
DF <- data.frame(V1, V2, V3, V4)


## TAREA 47 ##
DF.list <- list(V1, V2, V3, V4)
str(DF.list)
