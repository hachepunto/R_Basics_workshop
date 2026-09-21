################################################################################
### R BASICS WORKSHOP                                                        ###
### CLASE 9-1: Las funciones apply de R                                      ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

# La familia de funciones *apply* es usada para aplicar una función a cada 
# elemento de una estructura de datos. En particular, es usada para aplicar 
# funciones en matrices, data frames, arrays y listas.

# Con esta familia de funciones podemos automatizar tareas complejas usando 
# pocas líneas de código; es una de las características distintivas de R como 
# lenguaje de programación.

# Las funciones de la familia apply son:

#		• apply
#		• lapply
#		• sapply
#		• tapply
#		• vapply
#		• eapply
#		• mapply
#		• rapply

# Aquí solo veremos las primeras cuatro por ser las básicas.

######################## apply ########################

# La función apply ejecuta la función "FUN" sobre todas las columnas 
# (MARGIN = 2) o los renglones (MARGIN = 1) de una matriz.

# Uso:
#
#	apply(X, MARGIN, FUN, ...)
#
# Argumentos:
# -X: una matriz o cualquier otro objeto que sea posible convertir en una matriz
# -MARGIN: Define sobre qué se va ejecutar la función y toma valores entre 1 y 2:
#	-MARGIN=1`: La manipulación se hace por renglón.
#	-MARGIN=2`: La manipulación se hace por columnas.
#	-MARGIN=c(1,2)`: La manipulación se hace por renglones y columnas.
# -FUN: Indica que función se aplicará. Se puede usar funciones integradas como 
#       mean, median, sum, min, max e incluso funciones definidas por el usuario.

### Ejemplo sencillo

# Creamos una matriz de cuatro renglones
matriz <- matrix(1:16, nrow = 4)

# Aplicamos *apply*, dando la función *sum* el argumento FUN. Nota que solo
# necesitamos el nombre de la función, sin paréntesis. Por último, damos el
# argumento MARGIN = 1, para aplicar la función por renglón.

apply(X = matriz, MARGIN = 1, FUN = sum)

# Esto es equivalente a hacer lo siguiente:

sum(matriz[1, ])
sum(matriz[2, ])
sum(matriz[3, ])
sum(matriz[4, ])

# Si cambiamos el argumento MARGIN de MARGIN = 1 a MARGIN = 2, entonces la 
# función se aplicará por columna.

apply(X = matriz, MARGIN = 2, FUN = sum)

### Ejemplo datos genómicos

### PREPARACIÓN DE DATOS: Comencemos por cargar unos datos de expresión de 
# Ensembl para Drosophila. Los renglones son genes y hay información de cuatro 
# tiempos (2, 6, 8 y 10 h) además de otros metadatos.

## IMPORTANTE: tu directorio de trabajo debe ser la carpeta del taller, es
## decir, la que contiene la carpeta "Datasets". Compruébalo con getwd().

# OJO con el nombre: en R ya existe una función que se llama 'data', así que
# llamarle 'data' a un objeto es mala idea aunque técnicamente funcione. Aquí
# usamos 'expr' para no pisarla.
expr <- read.table("Datasets/rpkm_clase.tab", header = TRUE, sep="\t")

head(expr)
dim(expr)

# Filtramos los datos para quedarnos solo con los genes que tienen un RPKM mayor
# a 10 y luego generamos una matriz con los datos de expresión únicamente.

expressed <- subset(expr, rpkm2 > 10 & rpkm6 > 10 & rpkm8 > 10 & rpkm10 > 10)
head(expressed)
nrow(expressed) # Cuántos genes pasaron el filtro


rpkm <- as.matrix(expressed[, c("rpkm2", "rpkm6", "rpkm8", "rpkm10")])
colnames(rpkm) <- c("t2", "t6", "t8", "t10")

head(rpkm)
is.matrix(rpkm)
dim(rpkm)


# Para obtener la media de la expresión de cada gen a través de los cuatro
# tiempos:

apply(rpkm, 1, mean) ## por renglón (un promedio por gen)

# Para obtener la media de la expresión en cada tiempo, a través de todos los
# genes:

apply(rpkm, 2, mean) ## por columna (un promedio por tiempo)


# Podemos usar estos resultados para hacer una gráfica:

# Conviene calcular una sola vez lo que se va a usar varias veces, en lugar de
# repetir 'apply(rpkm, 1, mean)' tres veces dentro de la misma llamada:
media.por.gen <- apply(rpkm, 1, mean)

hist(media.por.gen,
	xlab = "Nivel de expresión",
	ylab = "Número de genes",
	main = "Distribución de la expresión promedio",
	breaks = seq(min(media.por.gen), max(media.por.gen), length.out = 50))


######################## lapply ########################

# La "l" de *lapply* se refiere a "lista". La diferencia entre *lapply* y 
# *apply* es el tipo de salida que genera cada una de ellas. La salida de 
# *lapply* es una lista. *lapply* se puede usar sobre otros tipos de objetos
# como data frames y listas.

# La función *lapply* no necesita el parámetro "MARGIN".

# Uso:
#
#	lapply(X, FUN, ...)
#
# Argumentos:
# -X: Un vector o un objeto (Lista o Data frame)
# -FUN: Función que se va a aplicar a cada elemento de X

### Ejemplo sencillo 1:

movies <- c("SPACE_ODYSSEY","BATMAN","VERTIGO","BRAZIL")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

# Podemos usar *unlist* para convertir la lista en un vector.

movies_lower <-unlist(lapply(movies,tolower))
str(movies_lower)

# Ejemplo sencillo 2:

trees[1:5, ]
class(trees)

arboles <- lapply(X = trees, FUN = mean)
arboles
class(arboles)

### Caso con matriz

matriz <- matrix(1:9, ncol = 3)
lapply(matriz, quantile, probs = 0.8)

dataFrame <- as.data.frame(matriz)
lapply(dataFrame, quantile, probs = .8)


length(dataFrame)
dataFrame[1]
length(matriz)
matriz[1]

### Ejemplo con datos genómicos

rpkm.df <- as.data.frame(rpkm)
head(rpkm.df)

# Podemos usar una función definida por nosotros dentro de las funciones *apply*.
# Quiero sumarle 5 al valor de expresión de todos los genes del tiempo 2:
head(rpkm.df$t2)
lapply(head(rpkm.df$t2), function(x){x+5} )


######################## sapply ########################

# La función *sapply* hace lo mismo que *lapply* pero regresa un vector en lugar
# de una lista. "s" es de simplificar.

# Uso:
#
#		sapply(X, FUN, ...)
#
# Argumentos:
# -X: un vector o un objeto
# -FUN: Función que se va a aplicar a cada elemento de X

# Ejemplo sencillo:

dt <- cars

lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)

lmn_cars
smn_cars

# Creamos una función llamada *avg* que calcule el promedio de entre el máximo
# y el mínimo de un vector:

avg <- function(x) {
	(min(x) + max(x)) / 2
}

fcars <- sapply(dt, avg)
fcars

### Ejemplo con datos genómicos 1:

# Quiero eliminar el prefijo "FB" del id de FlyBase de cada gen.

# Son casi 15,000 genes, así que nos quedamos con los primeros 6 para no llenar
# la pantalla. Quita el 'head' cuando quieras verlo completo.
ids <- head(expr$flybase_id)
ids

lapply(ids, function(x){ sub("FB", "", x) })   # devuelve una LISTA

sapply(ids, function(x){ sub("FB", "", x) })   # devuelve un VECTOR con nombres

sapply(ids, function(x){ sub("FB", "", x) }, simplify = FALSE) # como lapply

# Para este caso concreto no hacía falta ningún apply: 'sub' ya está
# vectorizada y opera sobre todo el vector de un golpe. Suele ser más rápida y
# más clara:
head(sub("FB", "", expr$flybase_id))

### Ejemplo con datos genómicos 2:

# Queremos obtener la expresión promedio de los genes por cromosoma, para cada
# uno de los tiempos.

head(expr)

# Necesitamos:
# 1. Obtener todos los genes de un cromosoma específico.
# 2. Obtener el promedio de expresión de esos genes en el tiempo 1 (2 h)
# 3. Obtener el promedio de expresión de esos genes en el tiempo 2 (6 h)
# 4. Obtener el promedio de expresión de esos genes en el tiempo 3 (8 h)
# 5. Obtener el promedio de expresión de esos genes en el tiempo 4 (10 h)
# Repetir de 1 a 5 para todos los cromosomas.

# Primero vamos a generar una función que obtenga el promedio de expresión por
# cromosoma.

cromosoma <- "chr4"
genes.cromosoma <- subset(expr, chr == cromosoma)
tiempos <- as.matrix(genes.cromosoma[, c("rpkm2", "rpkm6", "rpkm8", "rpkm10")])


dim(tiempos)
head(tiempos)


# Para obtener la expresión promedio por columna:

mean.expr <- apply(X = tiempos, MARGIN = 2, FUN = mean)
mean.expr

# Creemos una función con las instrucciones que acabamos de escribir:

gene_mean_expr <- function(x, datos){
	genes.cromosoma <- subset(datos, chr == x)
	tiempos <- as.matrix(genes.cromosoma[, c("rpkm2", "rpkm6", "rpkm8", "rpkm10")])
	mean.expr <- apply(X = tiempos, MARGIN = 2, FUN = mean)
	return(mean.expr)
}

gene_mean_expr("chr4", expr)

# Hagámoslo para todos los cromosomas utilizando un apply

cromosomas <- unique(expr$chr)
cromosomas

lapply(cromosomas, gene_mean_expr, datos = expr) # una lista
sapply(cromosomas, gene_mean_expr, datos = expr) # una matriz

# Nota la diferencia: 'sapply' pudo simplificar el resultado a una matriz
# porque todos los elementos de la lista tienen la misma longitud (4). Si no la
# tuvieran, 'sapply' devolvería la lista sin simplificar.
class(lapply(cromosomas, gene_mean_expr, datos = expr))
class(sapply(cromosomas, gene_mean_expr, datos = expr))


######################## tapply ########################

# La función *tapply* calcula una medida (mean, median, min, max, etc.) o 
# alguna función para cada factor en un vector.

# Uso:
#
#	tapply(X, INDEX, FUN = NULL, ...)
#
# Argumentos:
# -X: Un objeto, usualmente un vector.
# -INDEX: Una lista de uno o más factores del mismo tamaño que X.
# -FUN: Función que se va aplicar a cada elemento de X por cada factor de INDEX

data(iris)
class(iris$Sepal.Width)
class(iris$Species)

tapply(X = iris$Sepal.Width, INDEX = iris$Species, FUN = median)

## Ejemplo con datos genómicos


tapply(expressed$flybase_id, expressed$chr, length)
tapply(expressed$rpkm2, expressed$chr, mean)


tapply(expressed$flybase_id, list(expressed$chr, expressed$strand), length)
tapply(expressed$rpkm2, list(expressed$chr, expressed$strand), mean)
