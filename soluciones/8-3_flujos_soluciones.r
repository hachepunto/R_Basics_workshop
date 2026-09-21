################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 8-3: Control de flujo - SOLUCIONES                             ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "8-3_flujos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("8-3_flujos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("8-3_flujos.r")


## TAREA 1 ##
morpho <- iris[,1:4]
# Hay que dejar fuera la quinta columna porque es un factor (la especie) y el
# PCA sólo opera sobre variables numéricas continuas.


## TAREA 2 ##
barplot(empirical.ev^2, col="firebrick1", border="firebrick1", 
  xlab="Principal Components", ylab="Eigenvalue")


## TAREA 3 ##
rand.morpho[,2] <- sample(rand.morpho[,2])
rand.morpho[,3] <- sample(rand.morpho[,3])
rand.morpho[,4] <- sample(rand.morpho[,4])
  

## TAREA 4 ##
rand.pca.iris <- prcomp(rand.morpho, scale. = TRUE)
# Hay que rehacerlo dentro del bucle porque en cada iteración 'rand.morpho'
# contiene una aleatorización NUEVA. Un solo PCA fuera del bucle daría 999 veces
# el mismo resultado.

 
## TAREA 5 ##
rand.ev[i,] <- rand.pca.iris$sdev
# El error era escribir 'rand.ev[k,]'. Como 'k' vale 999 y nunca cambia, las 999
# iteraciones escribían siempre en la fila 999 y el resto de la matriz se
# quedaba llena de NAs. El índice del bucle es 'i'.


## TAREA 6 ##
par(mfrow=c(2,2))
# 'par(mfrow=...)' llena los paneles por FILAS; 'layout' con esa matriz los
# llena por COLUMNAS, porque así es como R construye las matrices:
matrix(1:4, ncol=2)
# Alternativa:
# layout(mat=matrix(1:4, ncol=2))
# layout.show(4)


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
dir.create("salidas", showWarnings = FALSE)


line.wd <- 2
line.col <- "black"
bar.col <- "firebrick3"
main.size <- 1.75
axis.size <- 1.5
lab.size <- 1.5
breaks.n <- 50


png(filename = "salidas/PCA_exercise.png", width = 25, height = 20,
  units = "cm", pointsize = 12, res = 300)

# La versión para la revista sería esta (descoméntala cuando la necesites):
# tiff(filename = "salidas/PCA_exercise.tiff", width = 25, height = 20,
#   units = "cm", pointsize = 12, res = 600, compression = "lzw")

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

list.files("salidas/")
