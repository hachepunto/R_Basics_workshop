################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 8-3: Control de flujo: bucles y aleatorización                 ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## OBJETIVO:
## Practicar el uso de bucles ("loops") en una prueba de aleatorización.

# El análisis de componentes principales (PCA) es un procedimiento estadístico 
# que utiliza una transformación ortogonal para convertir un conjunto de 
# observaciones de variables posiblemente correlacionadas en un conjunto de 
# variables linealmente ortogonales llamadas componentes principales. El número 
# de componentes principales es menor o igual que al número de variables 
# originales. Esta transformación se define de tal manera que el primer 
# componente principal tiene la mayor varianza posible (es decir, representa 
# tanta variabilidad en los datos como sea posible), y cada componente 
# subsiguiente a su vez tiene la mayor varianza posible bajo la restricción de 
# ser ortogonal a los componentes anteriores (Wikipedia).

# El código en este ejercicio examina la significancia estadística de un PCA 
# hecho sobre los datos morfológicos de los Iris de Edgar Anderson (ver 
# help(iris)). Para esto usamos un método basado en la aleatorización de 
# datos descrito en el apartado 2.1.2. de Peres-Neto et al. 2005 (How many 
# principal components? stopping rules for determining the number of non-trivial 
# axes revisited. Computational Statistics & Data Analysis 49:974-997.). Este 
# método pone a prueba la significancia estadística de los "eigenvalues" del 
# PCA, y por lo tanto la significancia de cada componente principal. 

data(iris) # Carga el conjunto de datos iris del paquete "datasets"

iris[1:5, ] # Imprime las primeras 5 filas del marco de datos


## TAREA 1 ##
## La línea de abajo crea un objeto llamado 'morpho' que contiene sólo las
## primeras 4 columnas de "iris" (las morfológicas; la quinta es la especie).
## ¿Por qué hay que dejar fuera la quinta columna antes de hacer un PCA?

morpho <- iris[, 1:4]
head(morpho)


# Esto corre un PCA usando la función "prcomp" sobre los datos morfológicos.
# OJO con el punto en 'scale.': el argumento de 'prcomp' se llama así, con
# punto final, para no chocar con la función 'scale'. Escribir 'scale=TRUE'
# también funciona porque R completa nombres de argumentos a medias, pero si
# se escribe mal (por ejemplo 'sclale=TRUE') R NO avisa: el argumento se va al
# '...' y se ignora en silencio, y el PCA se corre SIN escalar. Es un error
# difícil de detectar.
pca.iris <- prcomp(morpho, scale. = TRUE) 

# Hace un resumen de los resultados del PCA
summary(pca.iris) 

# Muestra la estructura de "pca.iris" que contienen los resultados del PCA
str(pca.iris)

# Este es un vector que contiene la raíz cuadrada de los "eigenvalues" 
pca.iris$sdev 

# Esto pone "eigenvalues" empíricos (de los datos reales) en un objeto. 
# Estos valores se compararan con "eigenvalues" generados al azar. 
empirical.ev <- pca.iris$sdev
names(empirical.ev) <- paste("PC", 1:length(empirical.ev), sep=" ")

# Para cada componente principal existe un "eigenvalue" o valores propio. Estos
# valores pueden interpretarse como proporcionales a la variación de todas las
# variables originales (e.g. las variables morfológicas) que puede ser capturada
# por cada componente principal. 


## TAREA 2 ##
## Haga un "barplot" que muestre los "eigenvalues" empíricos. Recuerde que
## 'pca.iris$sdev' tiene la RAÍZ CUADRADA de los eigenvalues, así que hay que
## elevar al cuadrado.


# Esto crea un objeto que va a definir el número de iteraciones que la 
# prueba de aleatorización utilizará
k <- 999


# Esto crea una matriz "vacía" (llena de NAs) que será llenada en cada iteración 
# del bucle con "eigenvalues" aleatorios
rand.ev <- matrix(data=NA, nrow=k, ncol=length(empirical.ev))
rownames(rand.ev) <- paste("rand", 1:k, sep="_")


for (i in 1:k)
{
  
  # Esto copia los datos morfológicos empíricos que luego serán randomizados
  rand.morpho <- morpho
  
  # Esto aleatoriza la posición de los valores en la primera variable (columna) 
  # en "rand.morpho". 
  rand.morpho[,1] <- sample(rand.morpho[,1])

  # Las tres líneas siguientes hacen lo mismo con las demás columnas (TAREA 3):
  rand.morpho[,2] <- sample(rand.morpho[,2])
  rand.morpho[,3] <- sample(rand.morpho[,3])
  rand.morpho[,4] <- sample(rand.morpho[,4])

  # Y esta repite el PCA con los datos aleatorizados (TAREA 4):
  rand.pca.iris <- prcomp(rand.morpho, scale. = TRUE)

  ## TAREA 3 ##
  ## Esta prueba se basa en la comparación de los "eigenvalues" empíricos en 
  ## una PCA con "eigenvalues" del PCA donde las relaciones entre las variables 
  ## han sido randomizadas (donde las correlaciones entre las variables son 
  ## destruidas). Esto implica que los valores dentro de cada variable sean
  ## randomizados de manera independiente a como los valores son randomizados en 
  ## otras variables. Por esto:
  ## Repita el paso anterior de forma independiente para cada una de las otras
  ## columnas del marco de datos morfológico 
  

  ## TAREA 4 ##
  ## ¿Por qué hay que volver a correr el PCA DENTRO del bucle y no una sola vez
  ## antes de él?


  ## TAREA 5 ##
  ## La línea de abajo pone los "eigenvalues" del PCA aleatorizado en la matriz
  ## "rand.ev". En cada iteración debería escribirlos en una fila DISTINTA. Tal
  ## como está escrita, ¿en qué fila los escribe siempre? Corríjala.
  ## (Aquí ya va corregida para que el ejercicio corra; compare 'i' contra 'k'
  ## y explique la diferencia.)
  rand.ev[i,] <- rand.pca.iris$sdev
  
}
# termina el bucle


rand.ev <- rbind(empirical.ev, rand.ev)
# Combina por filas ("rbind") el vector de los "eigenvalues" empíricos con la 
# matriz de "eigenvalues" aleatorios. Esto coloca los valores empíricos en la 
# primera fila de la matriz "rand.ev"


## TAREA 6 ##
## La línea de abajo divide la ventana en 4 paneles. Compárela con lo que haría
## 'layout(matrix(1:4, ncol=2))': ¿en qué orden se llenan los paneles en cada caso?
par(mfrow = c(2, 2))


# Esto crea un histograma con la distribución del primer "eigenvalue" (columna 1),
# es decir de la variación capturada por el primer componente principal
hist(rand.ev[,1]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 1")


# Esto resalta con una línea de la posición del "eigenvalue" empírico en esa 
# distribución
abline(v=rand.ev[1,1]^2, col="red")


# Esto calcula el valor de p. El valor de p se calcula como la proporción de
# "eigenvalues" de la distribución aleatorea que que son iguales o mayores que 
# el "eigenvalue" empírico. Tome en cuenta que estamos haciendo la suma de un 
# vector lógico donde los TRUEs se tratan como 1 y los FALSE como 0.
sum(rand.ev[,1] >= rand.ev[1,1]) / (k+1) 


## TAREA 7 ##
## Cree las figuras correspondientes para los "eigenvalues" 2, 3 y 4 en el resto
## de paneles de la figura que está produciendo. Además, calcule también los 
## valores de p para el resto de "eigenvalues".


## TAREA 8 ##
## Repita la figura, pero esta vez haga que se vea lo más profesional posible y
## guárdela en la carpeta "salidas".
##
## Muchas revistas piden TIFF a 600 ppp. Cuidado con el tamaño: un TIFF de
## 25 x 20 cm a 600 ppp son unos 5900 x 4700 pixeles sin comprimir, más de
## 100 MB. El argumento 'compression="lzw"' ayuda, pero se ignora en el
## dispositivo por defecto de macOS ('quartz'). Para trabajar cómodo conviene
## generar la figura en PNG y dejar el TIFF para la versión final que se manda
## a la revista.

par(mfrow = c(1, 1)) # Deja el dispositivo gráfico como estaba


################################################################################
### SOLUCIONES #################################################################
################################################################################

## Las soluciones de este ejercicio están en un archivo aparte:
##
##     soluciones/8-3_flujos_soluciones.r
##
## Inténtalo tú primero y consúltalo después para autoevaluarte. Ese archivo
## vuelve a correr este ejercicio por su cuenta, así que puedes abrirlo en una
## sesión limpia:
##
##     source("soluciones/8-3_flujos_soluciones.r")
