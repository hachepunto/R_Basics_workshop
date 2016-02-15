################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 3: OBJETOS                                                  ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################


### A. QUE ES UN OBJETO Y COMO CREARLO #########################################

# Un objeto en R es un pedazo de memoria que contiene información
# Frecuentemente esa información son datos
# Objetos pueden tener varios tipos de datos y pueden ser de varias clases

# La manera más sencilla de crear un objeto es utilizando el operador *<-*

x <- 10
x
# Esto crea un objeto llamado *x* que contiene el valor 10

y <- 5.3
y
# Esto creo otro objeto llamado *y* que contiene el valor 5.3

x <- c(10, 5, 2)
x
# Esto RE-ESCRIBE el objeto *x* y le asigna una secuencia de 3 valores


# Otra manera de crear un objeto es con la función *assign*
assign(x="x2", value=c(10, 5, 2))
x2

identical(x=x, y=x2)
# Equivalente:
identical(x, x2)


### B. TIPOS DE DATOS EN OBJETOS ###############################################

# Hay 4 tipos de datos comúnmente utilizados en R:
# 1. Numéricos - números
# 2. Caracteres - texto
# 3. Lógicos - verdadero/falso
# 4. Valores especiales


## 1. NUMÉRICOS ##
# Supongamos que tenemos las abundancias de 5 especies de árboles en una 
# parcela:

abund <- c(1, 17, 34, 26, 82)
abund

# La función *mode* nos dice el tipo de datos contenidos en el objeto *abund*
mode(x=abund)


## 2. CARACTERES ##
# Supongamos que tenemos los nombres de esas 5 especies de árboles:
spp <- c("I.ynga", "I.edulis", 	"I.macrophylla", "I.punctata", 	"I.alba")
spp

mode(spp)

# IMPORTANTE: Tomar en cuenta que los valores de caracteres siempre van entre 
# comillas. Esto generaría un error:
spp <- c(I.ynga, I.edulis, 	I.macrophylla, I.punctata, 	I.alba)


## 3. LÓGICOS ##
# Supongamos ahora que cada la abundancia de cada especie incrementó o no 
# respecto a una medida anterior:

increm <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
increm

mode(increm)

# IMPORTANTE: Tomar en cuenta que valores lógicos NO van entre comillas y se 
# escriben en mayúsculas


## 4. VALORES ESPECIALES ##
# 4.1. NA: valor perdido, no disponible (not available)
x <- NA
x
is.na(x)

# 4.2. Inf: infinito
100/0

-100/0

100-Inf

# 4.3. NaN: no es un número (not a number) 
Inf-Inf

# 4.4. NULL: nulo - usado para indicar un valor de argumento no especificado
x <- NULL
x
is.null(x)



### C. CLASES DE OBJETOS #######################################################

# 1. Vectores: 1 dimensión - numéricos, caracteres, lógicos
# 2. Factores: 1 dimensión - niveles de un factor
# 2. Matrices: 2 dimensiones
# 3. Arreglos: n dimensiones
# 4. Marcos de datos (data frames): 2 dimensiones
# 5. Lista
# 6. Otras clases

## IMPORTANTE: Cada objeto tiene ATRIBUTOS que definen como funciona en R ##



### D. VECTORES ################################################################
# Vectores representan una secuencia lineal de valores, cada valor con una 
# posición en la secuencia:

abund
spp
increm

# CLASE es el principal atributo de un vector
class(abund)
class(spp)
class(increm)

# LONGITUD es otro de los principales atributos de un vector
length(x=abund)
length(x=spp)
length(x=increm)

# NOMBRES es otro atributo importante de un vector
names(x=abund)

# Para crear nombres en este vector:
names(x=abund) <- paste("sp", seq(1:length(abund)), sep="_")
names(x=abund)
abund

# Alternativamente:
spp
names(x=abund) <- spp
abund

# También:
increm
names(x=increm)

names(x=increm) <- names(x=abund) # Utiliza los nombre de un objeto para otro
names(x=increm)

identical(x=names(increm), y=names(abund))


## IMPORTANTE: Vectores pueden tener SOLO un tipo de datos: numéricos, 
# caracteres O lógicos. NUNCA UNA COMBINACIÓN.

x <- c(1,2,3)
x
class(x)

x2 <- c(1,2,3,"a")
x
class(x)



### F. FACTORES ################################################################
# Factores también representan una secuencia linear de valores, pero están 
# diseñados para ser NIVELES DE UNA VARIABLE CATEGÓRICA. 

# Por ejemplo, supongamos que tenemos el estado fenológico de varios arboles:

pheno <- c("ster.", "ster.", "flower.", "fruit.", "ster.", "flower.",
    "flower.", "ster.")
pheno
length(pheno)
class(pheno)
mode(pheno)

pheno2 <- factor(x=pheno)
pheno2
length(pheno2)
class(pheno2)
mode(pheno2)

identical(pheno, pheno2)

# Un atributo importante de factores es sus NIVELES (LEVELS)
levels(pheno2)

# IMPORTANTE: la clase frecuentemente afecta como funciones procesan objetos.
# Por ejemplo:

plot(pheno)
plot(pheno2)



### G. MATRICES ################################################################
# Matrices son parecidas a vectores, pero tienen dos dimensiones: FILAS Y 
# COLUMNAS.

# Supongamos que tenemos la abundancia de 5 especies de árboles (columnas) en 
# 3 sitios distintos (filas):

abund.M <- matrix(1:(3*5), nrow=3, ncol=5)
abund.M

class(abund.M)


# la función *matrix* tiene otro argumento *byrow* con el valor pre-determinado
# de *FALSE*. ¿Qué pasa si lo cambiamos a *TRUE*?
abund.M2 <- matrix(1:(3*5), nrow=3, ncol=5, byrow=TRUE)
abund.M2

?matrix


# Utilicemos valores un poco más realistas 
abund.M <- matrix(rpois(3*5, 10), nrow=3, ncol=5)
abund.M


# Al igual que vectores, matrices tienen LONGITUD
length(abund.M)

# Además, matrices también tienen DIMENSIONES
dim(abund.M)

nrow(abund.M)
ncol(abund.M)


# Cada observación en una matriz puede tener NOMBRES
names(abund.M)
names(abund.M) <- paste("obs_", 1:length(abund.M), sep="")
abund.M

# Más frecuentemente, se utilizan nombres solamente para columnas y filas
colnames(abund.M)
rownames(abund.M)

colnames(abund.M) <- spp
rownames(abund.M) <- paste("site_", 1:nrow(abund.M), sep="")
abund.M


## IMPORTANTE: Matrices, como vectores,  pueden tener SOLO un tipo de datos: 
# numéricos, caracteres O lógicos. NUNCA UNA COMBINACIÓN.

abund.M2 <- matrix(sample(c(1:10, letters), 3*5), nrow=3, ncol=5)
abund.M2

class(abund.M2)
mode(abund.M2)


spp
abund

mixed.matrix <- cbind(spp, abund)
mixed.matrix
mode(mixed.matrix)



### H. ARREGLOS ################################################################
# Arreglos son parecidos a matrices, pero tienen MÁS DE DOS DIMENSIONES. 
# Con tres dimensiones, es como dos matrices de las mismas dimensiones una
# detrás de otra (con filas y columnas alineadas).

abund.A <- array(1:(3*5*2), dim=c(3,5,2))
abund.A

# Con valores de abundancia un poco más realistas:
abund.A <- array(rpois(3*5*2, 10), dim=c(3,5,2))
abund.A

mode(abund.A)
class(abund.A)

length(abund.A)
dim(abund.A)
dimnames(abund.A)

# Podemos poner nombres a cada elemento en cada dimensión
dimnames(abund.A) <- list(paste("site_", 1:3, sep=""), spp, c("2008", "2013"))
abund.A



### I. MARCOS DE DATOS #########################################################
# Marcos de datos organizan variables (columnas) medidos para diferentes 
# observaciones (filas). De esta manera, CADA COLUMNA PUEDE TENER VALORES DE 
# TIPOS DISTINTOS (numéricos, caracteres, lógicos o factores).

spp

abund.M
t(abund.M)

increm

spp.code <- 1:length(spp)

abund.data <- data.frame(spp.code, spp, t(abund.M), increm)
abund.data

class(abund.data)


# IMPORTANTE: matrices y marcos de datos funcionan distinto!
abund.data2 <- as.matrix(abund.data)
abund.data2
class(abund.data2)

dim(abund.data)
dim(abund.data2)

length(abund.data)
length(abund.data2)

mode(abund.data)
mode(abund.data2)

names(abund.data)
names(abund.data2)


# Las columnas (variables) en un marco de datos deben todos tener la misma 
# longitud.

x <- c("a", "b")
y <- 1:5
z <- 1:6

x
y
z

length(x)
length(y)
length(z)

xy <- data.frame(x,y)

xz <- data.frame(x,z)

xz



### J. LISTAS ##################################################################
# Las listas también pueden contener elementos de distintos tipos o clases, y NO
# necesitan tener la misma longitud.

x
class(x)

abund.M
class(abund.M)

pheno
class(pheno)

abund.data
class(abund.data)


random.list <- list(x, abund.M, pheno, abund.data)

# Cada objeto se convierte en un elemento de la lista
random.list

# Algunos atributos de una lista:
class(random.list)
length(random.list)
dim(random.list)
names(random.list)

names(random.list) <- c("x", "abund.M", "pheno", "abund.data")
random.list

# Conocer la estructura de una lista es muy útil:
str(random.list)


## IMPORTANTE: Muchas funciones utilizan listas para exportar resultados de 
# análisis.

x <- rnorm(100)
y <- 4 + 5*x + rnorm(100)

plot(y~x)

lm.res <- lm(y~x)
lm.res

str(lm.res)



### K. OTROS ###################################################################
# Muchos análisis o funciones generan objetos de clases particulares. Pero, la 
# gran mayoría son construcciones de los objetos básicos que hemos
# revisado. Por ejemplo:

# Modelos lineales generan objetos de clase *lm*, pero son en estructura listas

class(lm.res)

# Sin embargo, el hecho de ser de clase *lm* hace que ciertas funciones manejen
# este objeto de maneras específicas a su clase.

plot(lm.res)

# Otra clase de objeto son árboles filogenéticos
install.packages("ape") # Esto instala un paquete llamado *ape*
library(ape) # Esto abre el paquete

# El paquete *ape* contiene un árbol filogenético de murciélagos
data(chiroptera)
class(chiroptera)

# A pesar de ser un objeto de clase *phylo*, este objeto tiene la estructura 
# de una lista
str(chiroptera)

# La función *plot* sabe que hacer cuando se le da un árbol filogenético
plot(chiroptera, show.tip.label=FALSE)







