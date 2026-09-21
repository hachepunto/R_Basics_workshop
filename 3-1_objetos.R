################################################################################
### R BASICS WORKSHOP                                                        ###
### CLASE 3-1: Objetos                                                       ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################


### A. QUE ES UN OBJETO Y COMO CREARLO #########################################

# Un objeto en R es un pedazo de memoria que contiene información
# Frecuentemente esa información son datos
# Los objetos pueden tener varios tipos de datos y pueden ser de varias clases

# La manera más sencilla de crear un objeto es utilizando el operador *<-*

# Esto crea un objeto llamado *x* que contiene el valor 10
x <- 10
x

# Esto crea otro objeto llamado *y* que contiene el valor 5.3
y <- 5.3
y

# Esto RE-ESCRIBE el objeto *x* y le asigna una secuencia de 3 valores
x <- c(10, 5, 2)
x

# También existe *=* para asignar, pero *<-* es lo que se acostumbra en R
# porque *=* también sirve para dar valores a argumentos dentro de funciones:
x = 10
x
x <- c(10, 5, 2)


# Otra manera de crear un objeto es con la función *assign*
assign(x = "x2", value = c(10, 5, 2))
x2

identical(x = x, y = x2)
# Equivalente:
identical(x, x2)


### B. TIPOS DE DATOS EN OBJETOS ###############################################

# Hay 4 tipos de datos comúnmente utilizados en R:
# 1. Numéricos - números
# 2. Caracteres - texto
# 3. Lógicos - verdadero/falso
# 4. Valores especiales


## 1. NUMÉRICOS ##
# Supongamos que tenemos los log Fold Changes de famosos 5 genes relacionados  
# con cáncer:

logFCh <- c(1, 0, 0, 6, 2)
logFCh

# La función *mode* nos dice el tipo de datos contenidos en el objeto *logFCh*
mode(x=logFCh)


## 2. CARACTERES ##
# Supongamos que tenemos los nombres de esos 5 genes:
genes <- c("TP53", "MYC", "BRCA1", "BRCA2", "ATM")
genes

mode(genes)

# IMPORTANTE: Tomar en cuenta que los valores de caracteres siempre van entre 
# comillas. Esto generaría un error:
try(genes <- c(TP53, MYC, BRCA1, BRCA2, ATM)) # Error A PROPÓSITO


## 3. LÓGICOS ##
# Supongamos ahora que el log Fold Change cada gen incrementó o no 
# respecto a un control:

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
# 3. Matrices: 2 dimensiones
# 4. Arreglos: n dimensiones
# 5. Marcos de datos (data frames): 2 dimensiones
# 6. Listas
# 7. Otras clases

## IMPORTANTE: Cada objeto tiene ATRIBUTOS que definen como funciona en R ##



### D. VECTORES ################################################################
# Vectores representan una secuencia lineal de valores, cada valor con una 
# posición en la secuencia:

logFCh
genes
increm

# CLASE es el principal atributo de un vector
class(logFCh)
class(genes)
class(increm)

# LONGITUD es otro de los principales atributos de un vector
length(x=logFCh)
length(x=genes)
length(x=increm)

# NOMBRES es otro atributo de un vector
names(x=logFCh)

# Para crear nombres en este vector:
logFCh <- c(1, 0, 0, 6, 2)

names(x=logFCh) <- paste("gene", seq(1, length(logFCh)), sep = "_")
names(x=logFCh)
logFCh

# Los nombres se borran asignando NULL:
names(x=logFCh) <- NULL
logFCh

# Alternativamente:
genes
names(x=logFCh) <- genes
logFCh

# También:
increm
names(x=increm)

names(x=increm) <- names(x=logFCh) # Utiliza los nombre de un objeto para otro
names(x=increm)

identical(x=names(increm), y=names(logFCh))


## IMPORTANTE: Los vectores pueden tener SOLO un tipo de datos: numéricos, 
# caracteres o lógicos. NUNCA UNA COMBINACIÓN.

x <- c(1,2,3)
x
class(x)

x2 <- c(1,2,3,"a")
x2
class(x2)



### E. FACTORES ################################################################
# Factores también representan una secuencia linear de valores, pero están 
# diseñados para ser NIVELES DE UNA VARIABLE CATEGÓRICA. 

# Por ejemplo, supongamos que tenemos el estado de expresión diferencial de algunos genes:

diff <- c("down", "down", "equal", "up", "down", "equal", "equal", "down")
diff
length(diff)
class(diff)
mode(diff)

diff2 <- factor(x=diff)
diff2
length(diff2)
class(diff2)
mode(diff2)

identical(diff, diff2)

# Un atributo importante de factores es sus NIVELES (LEVELS)
levels(diff2)



# IMPORTANTE: la clase frecuentemente afecta como funciones procesan objetos.
# Por ejemplo:

try(plot(diff))  # Error A PROPÓSITO: *diff* es texto, no un factor. 'plot'
                 # intenta convertirlo a número, obtiene NA y se queda sin
                 # valores finitos para los ejes.
plot(diff2)      # *diff2* sí es factor: sale una gráfica de barras.


# CUIDADO: asignar sobre *levels* RE-ETIQUETA los niveles, NO reordena ni
# recodifica los datos. El primer nivel de diff2 es "down"; con la línea de
# abajo todo lo que decía "down" pasa a decir "equal". Es una fuente clásica
# de errores silenciosos.
levels(diff2)
diff2
levels(diff2) <- c("equal", "up", "down")
diff2 # Compara con la salida anterior: los datos quedaron mal etiquetados.


### F. MATRICES ################################################################
# Las matrices son parecidas a vectores, pero tienen dos dimensiones: FILAS Y 
# COLUMNAS.

# Supongamos que tenemos los niveles de expresión de 5 genes (filas) en 
# muestras distintas (columnas):

expr.M <- matrix(1:(5*4), nrow = 5, ncol = 4)
expr.M

class(expr.M)


# la función *matrix* tiene otro argumento *byrow* con el valor pre-determinado
# de *FALSE*. ¿Qué pasa si lo cambiamos a *TRUE*?
expr.M2 <- matrix(1:(5*4), nrow=5, ncol = 4, byrow = TRUE)
expr.M2

?matrix


# Utilicemos valores un poco más realistas 
expr.M <- matrix(rpois(5*4, 10), nrow=5, ncol=4)
expr.M


# Al igual que vectores, matrices tienen LONGITUD
length(expr.M)

# Además, matrices también tienen DIMENSIONES
dim(expr.M)

nrow(expr.M)
ncol(expr.M)


# Cada observación en una matriz puede tener NOMBRES
names(expr.M)
names(expr.M) <- paste("obs_", 1:length(expr.M), sep = "")
expr.M

# Más frecuentemente, se utilizan nombres solamente para columnas y filas
colnames(expr.M)
rownames(expr.M)

colnames(expr.M) <- paste(1:ncol(expr.M), ".CEL", sep="")
rownames(expr.M) <- genes
expr.M


## IMPORTANTE: Las matrices, como vectores,  pueden tener SOLO un tipo de datos: 
# numéricos, caracteres O lógicos. NUNCA UNA COMBINACIÓN.

expr.M2 <- matrix(sample(c(1:20, letters), 5*4), nrow=5, ncol=4)
expr.M2

class(expr.M2)
mode(expr.M2)


genes
logFCh

mixed.matrix <- cbind(genes, logFCh)
mixed.matrix
mode(mixed.matrix)



### G. ARREGLOS ################################################################
# Los arreglos son parecidos a matrices, pero tienen MÁS DE DOS DIMENSIONES. 
# Con tres dimensiones, es como dos matrices de las mismas dimensiones una
# detrás de otra (con filas y columnas alineadas).

logFCh.A <- array(1:(5*4*2), dim=c(5,4,2))
logFCh.A

# Con valores de log Fold Change un poco más realistas:
logFCh.A <- array(rpois(5*4*2, 1), dim=c(5,4,2))
logFCh.A

mode(logFCh.A)
class(logFCh.A)

length(logFCh.A)
dim(logFCh.A)
dimnames(logFCh.A)

# Podemos poner nombres a cada elemento en cada dimensión
dimnames(logFCh.A) <- list(genes, paste(1:4, ".CEL", sep=""), c("days0", "days15"))
logFCh.A



### H. MARCOS DE DATOS #########################################################
# Los marcos de datos organizan variables (columnas) medidos para diferentes 
# observaciones (filas). De esta manera, CADA COLUMNA PUEDE TENER VALORES DE 
# TIPOS DISTINTOS (numéricos, caracteres, lógicos o factores).

genes
expr.M
increm

genes.code <- 1:length(genes)

expr.data <- data.frame(genes.code, genes, expr.M, increm)
expr.data

class(expr.data)

mode(expr.data$genes)

# IMPORTANTE: matrices y marcos de datos funcionan distinto!
expr.data2 <- as.matrix(expr.data)
expr.data2
class(expr.data2)

dim(expr.data)
dim(expr.data2)

length(expr.data)
length(expr.data2)

mode(expr.data)
mode(expr.data2)

names(expr.data)
names(expr.data2)


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

try(xy <- data.frame(x,y)) # Error A PROPÓSITO: 5 no es múltiplo de 2

xz <- data.frame(x,z) # Esta sí funciona: 6 sí es múltiplo de 2, así que R
                      # "recicla" los valores de x

xz



### I. LISTAS ##################################################################
# Las listas también pueden contener elementos de distintos tipos o clases, y NO
# necesitan tener la misma longitud.

x
class(x)

expr.M
class(expr.M)

diff
class(diff)

expr.data
class(expr.data)


random.list <- list(x, expr.M, diff, expr.data)

# Cada objeto se convierte en un elemento de la lista
random.list

# Algunos atributos de una lista:
class(random.list)
length(random.list)
dim(random.list)
names(random.list)

names(random.list) <- c("x", "expr.M", "diff", "expr.data")
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



### J. OTROS ###################################################################
# Muchos análisis o funciones generan objetos de clases particulares. Pero, la 
# gran mayoría son construcciones de los objetos básicos que hemos
# revisado. Por ejemplo:

# Modelos lineales generan objetos de clase *lm*, pero son en estructura listas

class(lm.res)



# Sin embargo, el hecho de ser de clase *lm* hace que ciertas funciones manejen
# este objeto de maneras específicas a su clase.

par(mfrow = c(2, 2)) # Los 4 diagnósticos de un modelo lineal, en un solo panel
plot(lm.res)
par(mfrow = c(1, 1)) # Deja el dispositivo gráfico como estaba

# Otra clase de objeto son árboles filogenéticos.
# Para instalar el paquete *ape* (solo hace falta una vez):
# install.packages("ape")

# Este bloque solo corre si *ape* ya está instalado, para que el archivo
# completo pueda ejecutarse aunque falte el paquete:
if (requireNamespace("ape", quietly = TRUE)) {

  library(ape) # Esto abre el paquete

  # El paquete *ape* contiene un árbol filogenético de murciélagos
  data(chiroptera, package = "ape")
  print(class(chiroptera))

  # A pesar de ser un objeto de clase *phylo*, este objeto tiene la estructura
  # de una lista
  str(chiroptera)

  # La función *plot* sabe que hacer cuando se le da un árbol filogenético.
  # Son ~800 especies: con show.tip.label=TRUE los nombres no se alcanzan a leer.
  plot(chiroptera, show.tip.label = FALSE)

} else {
  message("El paquete 'ape' no está instalado; se omite el ejemplo del árbol.")
}
