################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 3-2: Objetos                                                   ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJETIVO:
## Familiarizarte con los distintos tipos y clases de objetos en R.

## CÓMO TRABAJAR ESTE EJERCICIO:
## 1. Escribe tus respuestas en este mismo archivo, debajo de cada tarea.
## 2. TODO lo que no sea código debe ir precedido de '#'. Si escribes texto sin
##    '#', el archivo deja de ser código válido y ya no corre.
## 3. El archivo ya corre completo tal como está: el código que necesitas para
##    contestar ya viene escrito. Tu trabajo es leerlo, predecir qué hace,
##    correrlo y explicar el resultado.
## 4. Antes de entregar, corre el archivo de principio a fin
##    (source("3-2_objetos.r") en la consola) y asegúrate de que no truena.

## DIRECTORIO DE TRABAJO:
## Este ejercicio lee un archivo de la carpeta "Datasets". Tu directorio de
## trabajo debe ser la carpeta del taller (la que contiene "Datasets").
## Compruébalo con getwd() y cámbialo con setwd() si hace falta.

## NOTA SOBRE try():
## Algunas líneas de este ejercicio tienen errores A PROPÓSITO; tu tarea es leer
## el mensaje de error y entenderlo. Están envueltas en try() para que el error
## se imprima pero el archivo siga corriendo.

## NOTA SOBRE REPRODUCIBILIDAD:
## Este ejercicio usa números aleatorios, así que tus resultados no van a ser
## idénticos a los de tus compañeros. Eso es esperado y es parte de la lección
## (ver TAREA 6). Si quieres resultados repetibles, descomenta esta línea:
# set.seed(123)


# Crea un objeto con 100 valores aleatorios tomados de una distribución normal
# con un promedio de 5 y una desviación estándar de 1.5.
rand.1 <- rnorm(100, mean = 5, sd = 1.5)

class(rand.1)
mode(rand.1)
length(rand.1)

## TAREA 1: ¿Qué clase de objeto es 'rand.1'? ¿Qué tipo de datos contiene?
## ¿Cuál es su longitud? Las tres líneas de arriba te lo dicen: explica en
## un comentario qué significa cada una.

mean(rand.1)
sd(rand.1)

## TAREA 2: ¿La media y la desviación estándar salieron exactamente 5 y 1.5?
## ¿Por qué sí o por qué no?


# Esto RE-ESCRIBE 'rand.1' con otros 100 valores de la misma distribución.
rand.1 <- rnorm(100, mean = 5, sd = 1.5)

mean(rand.1)
sd(rand.1)

## TAREA 3: ¿La media es idéntica a la de antes? ¿Por qué sí / por qué no?


# Abre el archivo de ayuda para la función 'as.character'.
?as.character

# Crea un vector de caracteres a partir de 'rand.1'.
rand.2 <- as.character(rand.1)

class(rand.2)
mode(rand.2)
length(rand.2)

## TAREA 4: ¿Qué cambió y qué NO cambió entre 'rand.1' y 'rand.2'?

rand.1
rand.2
## TAREA 5: Al imprimir estos dos objetos, ¿en qué se ven diferentes?


identical(rand.1, rand.2)
## TAREA 6: ¿Qué hace la función 'identical'? ¿Por qué este resultado es FALSE,
## si los dos objetos "tienen los mismos números"?


# Transforma 'rand.2' de vuelta a números.
rand.3 <- as.numeric(rand.2)

class(rand.1)
class(rand.3)
identical(class(rand.1), class(rand.3))
# Las clases sí son idénticas.

identical(rand.1, rand.3)
rand.1 - rand.3
## TAREA 7: ¿Por qué 'identical(rand.1, rand.3)' todavía es FALSE? Mira las
## diferencias que imprime la línea de arriba: no son exactamente cero. Esta es
## una lección sobre precisión numérica y sobre el cuidado que hay que tener al
## comparar números con '=='. (El ejercicio 3-3 trata este tema a fondo.)


seq.1 <- 1:5
seq.1
## Crea un vector con la secuencia 1, 2, 3, 4, 5.


## TAREA 8: Queremos un vector de longitud 10 que sea una muestra aleatoria de
## los números en 'seq.1'. La línea de abajo falla. Lee el error y la ayuda de
## 'sample' y explica por qué. ¿Qué argumento hay que agregar?
try(sample(x = seq.1, size = 10))

sample(x = seq.1, size = 10, replace = TRUE)
# Así sí funciona.


rand.3 <- as.character(sample(1:10, size = 300, replace = TRUE))
# RE-ESCRIBE 'rand.3': ahora es un vector de caracteres de longitud 300 con una
# muestra aleatoria de enteros del 1 al 10.

is.numeric(rand.3) # Esto debe ser FALSE.
is.character(rand.3) # Esto debe ser TRUE.

class(rand.3)
mode(rand.3)
length(rand.3)

## TAREA 9: Explica por qué 'is.numeric' es FALSE aunque el objeto esté lleno
## de lo que a simple vista parecen números.


rand.4 <- as.numeric(rand.3)
rand.5 <- as.factor(rand.4)

class(rand.4)
class(rand.5)
levels(rand.5)
## TAREA 10: ¿Cuál es la clase de cada uno? ¿Qué son los "levels" de 'rand.5'?

par(mfrow = c(1, 2))
plot(rand.4, col = "lightgreen", main = "numeric")
plot(rand.5, col = "blue", main = "factor")
par(mfrow = c(1, 1))
## TAREA 11: Aunque en esencia ambos objetos tienen los mismos números, la clase
## del objeto ("numeric" o "factor") determina el comportamiento de 'plot'.
## Describe en qué se diferencian las dos gráficas y por qué.


M.abund <- matrix(rpois(1000, 1) * rpois(1000, 10), ncol = 50)
## TAREA 12: ¿Qué hace la función 'rpois'? Lee help(rpois) y describe paso a
## paso qué hace esta línea de código.

class(M.abund)
## TAREA 13: SIN correr R, predice las dimensiones y la longitud de esta matriz.
## Después confírmalo con las dos líneas siguientes.
dim(M.abund)
length(M.abund)


# Supongamos que 'M.abund' es una matriz de abundancias de especies (columnas)
# en varios sitios (filas). En matrices como esta es útil tener nombres para
# filas y columnas.

## TAREA 14: La línea de abajo falla. Lee el error, encuentra el problema y
## explícalo. Pista: fíjate en las comillas.
try(colnames(M.abund) <- paste("sp", 1:ncol("M.abund"), sep = "_"))

colnames(M.abund) <- paste("sp", 1:ncol(M.abund), sep = "_")
rownames(M.abund) <- paste("site", 1:nrow(M.abund), sep = "_")
M.abund[1:5, 1:5]

## TAREA 15: ¿Puedes predecir el resultado de la siguiente línea? Ojo: no se
## pregunta por la clase de la matriz sino por la clase de sus nombres.
class(colnames(M.abund))


M.presence <- M.abund > 0
## Más adelante veremos operadores con detalle, pero por ahora: esta línea
## compara cada elemento de 'M.abund' con 0 y produce una nueva matriz llena de
## TRUE o FALSE, con las mismas dimensiones que la original.

M.presence[1:5, 1:5]
## Observa que la nueva matriz hereda los nombres de 'M.abund'.

class(M.presence)
mode(M.presence)
## TAREA 16: ¿Coinciden la clase y el modo con lo que esperabas?


spp.abund <- colMeans(M.abund)
# 'colMeans' calcula el promedio de cada columna: la abundancia media de cada
# especie a través de los sitios.

names(spp.abund)
## TAREA 17: ¿De dónde vienen los nombres de los elementos de este vector?


spp.occup <- colSums(M.presence)
# Truco muy útil: R trata los TRUE como 1 y los FALSE como 0. Sumar por columnas
# una matriz de TRUE/FALSE cuenta en cuántos sitios está presente cada especie.


LM.abund.occup <- lm(spp.abund ~ spp.occup)
## TAREA 18: ¿Qué hace la función 'lm'? ¿Cuál es la clase del objeto resultante?
class(LM.abund.occup)

str(LM.abund.occup)
## TAREA 19: 'str' muestra la estructura interna del objeto. ¿De qué clase
## básica de objeto está hecho un modelo lineal por dentro?

summary(LM.abund.occup)
## TAREA 20: Interpreta el resumen: ¿hay relación entre abundancia y ocupancia?

plot(spp.occup, spp.abund, cex = 1.5, pch = 21, col = "black", bg = "grey30",
     xlab = "Ocupancia de la especie", ylab = "Abundancia media de la especie")
## TAREA 21: Este es el diagrama de dispersión que corresponde al análisis.
## Agrégale la línea de regresión con abline(LM.abund.occup).

## TAREA 22: Haz un análisis similar, pero ahora entre el número total de
## individuos por sitio y la riqueza (número de especies) por sitio. Usa
## 'rowSums' en lugar de 'colSums'/'colMeans'. (La solución está más abajo.)


# Crea una copia desechable de 'M.abund' solo para el siguiente ejemplo.
basura <- M.abund

# Lista los objetos que existen en este momento en tu sesión. Ahí está 'basura'.
ls()

rm(basura)
ls()
## TAREA 23: ¿Qué hace la función 'rm'? Compara las dos salidas de 'ls()'.
## (Ojo: borramos una copia y no 'M.abund' misma, porque todavía la necesitamos.)


letters
# 'letters' es un vector predeterminado en R que contiene el alfabeto en
# minúsculas; 'LETTERS' lo tiene en mayúsculas.

L.vector <- sample(c(letters, LETTERS), 50, replace = TRUE)

class(L.vector)
mode(L.vector)
length(L.vector)
## TAREA 24: Explica qué hizo 'sample' aquí y por qué hizo falta replace = TRUE.

names(L.vector) <- 1:length(L.vector)
L.vector
## TAREA 25: Las dos líneas anteriores le ponen nombres a los elementos.
## ¿Qué diferencia hay entre L.vector[3] y L.vector["3"]? Pruébalo.

L <- matrix(L.vector, nrow = 5)
L
## TAREA 26: ¿Cuántas columnas tiene 'L'? ¿De dónde salió ese número?


### DATOS REALES ###############################################################

# Este conjunto de datos tiene información sobre la abundancia y riqueza de tres
# especies de ectoparásitos (Streblidae) en murciélagos hospederos (filas).
# Los datos fueron colectados en múltiples localidades en Ecuador.

streb <- read.table("Datasets/data_streblidaeonbats.txt", header = TRUE,
                    sep = "\t", stringsAsFactors = TRUE)

# OJO con 'stringsAsFactors = TRUE': desde R 4.0.0 'read.table' ya NO convierte
# texto a factores automáticamente. Lo pedimos explícitamente porque varias
# tareas de abajo comparan el comportamiento de un factor contra el de un vector
# de caracteres. Si lo dejas en su valor por defecto (FALSE), la columna 'Sex'
# llega como texto y las TAREAS 31 a 35 dejan de tener sentido.

class(streb)
dim(streb)
## TAREA 27: ¿Qué tipo de objeto produce siempre 'read.table'? ¿Cuántas
## observaciones y cuántas variables hay?

colnames(streb)
## TAREA 28: ¿Cuáles son los nombres de las variables?

rownames(streb)[1:10]
rownames(streb) <- paste("obs", 1:nrow(streb), sep = "_")
rownames(streb)[1:10]
## TAREA 29: Explica qué hizo la línea de en medio.

str(streb)
summary(streb)
## TAREA 30: 'str' y 'summary' dan dos vistas distintas del mismo objeto.
## ¿Qué te dice cada una que la otra no?


streb_sex <- streb$Sex
streb_sex.2 <- as.character(streb$Sex)
# La primera línea toma la columna "Sex" tal cual (un factor); la segunda la
# convierte a texto.

class(streb_sex)
class(streb_sex.2)
## TAREA 31: ¿Cuál es la clase de cada uno?

## TAREA 32: ¿Puedes predecir el resultado de las siguientes líneas?
levels(streb_sex)
levels(streb_sex.2)

## TAREA 33: ¿Puedes predecir el resultado de estas dos? (La segunda va dentro
## de try() porque produce un error, no una gráfica.)
plot(streb_sex)
try(plot(streb_sex.2))

## Nota cómo estos dos objetos se imprimen de forma distinta:
streb_sex
as.character(streb_sex)

identical(streb_sex, streb_sex.2)
## TAREA 34: ¿Los dos objetos tienen la misma información? ¿Por qué 'identical'
## dice que no son iguales?

SexMatrix <- cbind(streb_sex, as.character(streb_sex))
head(SexMatrix)
## TAREA 35: 'cbind' pega vectores para formar una matriz, cada vector como una
## columna. ¿Qué le pasó a los datos del factor 'streb_sex' en la primera
## columna? Pista: una matriz solo admite UN tipo de dato.


### MARCOS DE DATOS Y LISTAS ###################################################

V1 <- rnorm(10)
V2 <- rpois(10, 5)
V3 <- sample(letters, 10)
V4 <- sample(c(TRUE, FALSE), 11, replace = TRUE)

class(V1)
class(V2)
class(V3)
class(V4)

## TAREA 36: ANTES de correr la siguiente línea, predice si dará error y por qué.
try(DF <- data.frame(V1, V2, V3, V4))

V4 <- sample(c(TRUE, FALSE), 10, replace = TRUE)
DF <- data.frame(V1, V2, V3, V4)
DF
## TAREA 37: ¿Qué cambió para que ahora sí funcione?

DF.list <- list(V1 = V1, V2 = V2, V3 = V3, V4 = V4)
str(DF.list)
## TAREA 38: 'DF' y 'DF.list' tienen los mismos datos. ¿Qué puede hacer una
## lista que un marco de datos no? (Pista: intenta meter en cada uno un quinto
## vector de longitud 3.)


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/3-2_objetos_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/3-2_objetos_soluciones.r")
