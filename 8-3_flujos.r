################################################################################
### R BASICS WORKSHOP                                                                    ###
### EJERCICIO 9-3: Control de flujo                                          ###
###                                                                                                 ###
### Unida de Servicios Bioinformáticos                                      ###
### Instituto Nacional de Medicina Genómica                                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                                         ### 
################################################################################

## OBJETIVO:
## PracticaR el uso de de bucles ("loops")

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
# help(Iris)"). Para esto, utilizamos un método basado en la randomización de 
# datos descrito en el apartado 2.1.2. de Peres-Neto et al. 2005 (How many 
# principal components? stopping rules for determining the number of non-trivial 
# axes revisited. Computational Statistics & Data Analysis 49:974-997.). Este 
# método pone a prueba la significancia estadística de los "eigenvalues" del 
# PCA, y por lo tanto la significancia de cada componente principal. 

data(iris) # Carga el set de datos Iris del paquete "datasets"

iris[1:5, ] # Imprime las primeras 5 filas del marco de datos


## TAREA 1 ##
## Cree un objeto llamado morfo que contiene sólo las primeras 4 columnas
## del marco de datos "iris"


pca.iris <- prcomp(morpho, scale=TRUE) 
# Esto corre un PCA usando la función "prcomp" sobre los datos morfológicos

summary(pca.iris) 
# Hace un resumen de los resultados del PCA

str(pca.iris)
# Muestra la estructura de "pca.iris" que contienen los resultados del PCA

pca.iris$sdev 
# Este es un vector que contiene la raíz cuadrada de los "eigenvalues" 

empirical.ev <- pca.iris$sdev
names(empirical.ev) <- paste("PC", 1:length(empirical.ev), sep=" ")
# Esto pone "eigenvalues" empíricos (de los datos reales) en un objeto. 
# Estos valores se compararan con "eigenvalues" generados al azar. 

# Para cada componente principal existe un "eigenvalue" o valores propio. Estos
# valores pueden interpretarse como proporcionales a la variación de todas las
# variables originales (e.g. las variables morfológicas) que puede ser capturada
# por cada componente principal. 


## TAREA 2 ##
## Haga una "barplot" que muestre los "eigenvalues" empíricos


k <- 999
# Esto crea un objeto que va a definir el número de iteraciones que la 
# prueba de aleatorización utilizará


rand.ev <- matrix(data=NA, nrow=k, ncol=length(empirical.ev))
rownames(rand.ev) <- paste("rand", 1:k, sep="_")
# Esto crea una matriz "vacía" (llena de NAs) que será llenada en cada iteración 
# del bucle con "eigenvalues" aleatorios


for (i in 1:k)
{
  
  rand.morpho <- morpho
  # Esto copia los datos morfológicos empíricos que luego serán randomizados
  
  rand.morpho[,1] <- sample(rand.morpho[,1])
  # Esto aleatoriza la posición de los valores en la primera variable (columna) 
  # en "rand.morpho". 

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
  ## Despues de randomizar todas las variables, ejecute un nuevo análisis de 
  ## componentes principales pero esta vez utilizando los datos morfológicos 
  ## aleatorizados. Guarde los resultados de este PCA en un objeto denominado 
  ## "rand.pca.iris"


  ## TAREA 5 ##
  ## La línea de abajo pone los "eigenvalues" del PCA randomizado en la matriz
  ## "rand.ev". Con cada iteración del bucle, se supone que el código debe poner 
  ## estos valores en una fila distinta de esta matriz. Sin embargo hay un error,
  ## y los resultados están siempre siendo colocandos en la última fila. 
  ## Solucione el problema en esta línea de código.
  rand.ev[k,] <- rand.pca.iris$sdev
  
}
# termina el bucle


rand.ev <- rbind(empirical.ev, rand.ev)
# Combina por filas ("rbind") el vector de los "eigenvalues" empíricos con la 
# matriz de "eigenvalues" aleatorios. Esto coloca los valores empíricos en la 
# primera fila de la matriz "rand.ev"


## TAREA 6 ##
## Abra una ventana y dividala en 4 paneles con las funciones "par" o "layout"


hist(rand.ev[,1]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 1")
# Esto crea un histograma con la distribución del primer "eigenvalue" (columna 1),
# es decir de la variación capturada por el primer componente principal


abline(v=rand.ev[1,1]^2, col="red")
# Esto resalta con una línea de la posición del "eigenvalue" empírico en esa 
# distribución


sum(rand.ev[,1] >= rand.ev[1,1]) / (k+1) 
# Esto calcula el valor de p. El valor de p se calcula como la proporción de
# "eigenvalues" de la distribución aleatorea que que son iguales o mayores que 
# el "eigenvalue" empírico. Tome en cuenta que estamos haciendo la suma de un 
# vector lógico donde los TRUEs se tratan como 1 y los FALSE como 0.


## TAREA 7 ##
## Cree las figuras correspondientes para los "eigenvalues" 2, 3 y 4 en el resto
## de paneles de la figura que está produciendo. Además, calcule también los 
## valores de p para el resto de "eigenvalues".


## TAREA 8 ##
## Repita la figura, pero esta vez haga que se vea lo más profesional posible y
## guardela como un archivo TIFF con una alta resolución (600 ppp).




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
morpho <- iris[,1:4]


## TAREA 2 ##
barplot(empirical.ev^2, col="firebrick1", border="firebrick1", 
  xlab="Principal Components", ylab="Eigenvalue")


## TAREA 3 ##
rand.morpho[,2] <- sample(rand.morpho[,2])
rand.morpho[,3] <- sample(rand.morpho[,3])
rand.morpho[,4] <- sample(rand.morpho[,4])
  

## TAREA 4 ##
rand.pca.iris <- prcomp(rand.morpho, sclale=TRUE) 

 
## TAREA 5 ##
rand.ev[i,] <- rand.pca.iris$sdev


## TAREA 6 ##
par(mfrow=c(2,2))
#or
layout(m=matrix(1:4, ncol=2))
layout.show(4)


## TAREA 7 ##
hist(rand.ev[,2]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 2")
abline(v=rand.ev[1,2]^2, col="red")
sum(rand.ev[,2] >= rand.ev[1,2]) / (k+1) 

hist(rand.ev[,3]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 3")
abline(v=rand.ev[1,3]^2, col="red")
sum(rand.ev[,3] >= rand.ev[1,3]) / (k+1) 

hist(rand.ev[,4]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 4")
abline(v=rand.ev[1,4]^2, col="red")
sum(rand.ev[,4] >= rand.ev[1,4]) / (k+1) 


## TAREA 8 ##
getwd() # Revise el directorio de trabajo y cámbielo si es necesario


line.wd <- 2
line.col <- "black"
bar.col <- "firebrick3"
main.size <- 1.75
axis.size <- 1.5
lab.size <- 1.5
breaks.n <- 50


tiff(filename = "PCA_exercise.tiff", width = 25, height = 20, units = "cm", 
  pointsize = 12, res = 600)

  par(mfrow=c(2,2), mar=c(5, 6, 4, 2), mgp=c(3.75, 1, 0))
  
  hist(rand.ev[,1]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 1", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,1]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,2]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 2", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,2]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,3]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 3", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,3]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,4]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 4", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,4]^2, col=line.col, lwd=line.wd)

dev.off()


