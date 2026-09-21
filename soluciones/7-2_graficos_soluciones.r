################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 7-2: Gráficos - SOLUCIONES                                     ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "7-2_graficos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("7-2_graficos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("7-2_graficos.r")


## TAREA 1 ##
# 'xlim' y 'ylim' fijan los límites de cada eje. Reciben un vector de dos
# valores: el mínimo y el máximo.
plot(iris$Petal.Width, iris$Sepal.Width, xlim = c(0, 3), ylim = c(1, 5))


## TAREA 2 ##
plot(iris$Petal.Width, iris$Sepal.Width,
     type = "p",                            # 'p' = puntos
     main = "Ancho de sépalo contra ancho de pétalo",
     sub  = "Datos de Anderson (iris)",
     xlab = "Ancho del pétalo (cm)",
     ylab = "Ancho del sépalo (cm)",
     asp  = 1)                              # misma escala en los dos ejes


## TAREA 3 ##
# 'bty' controla el recuadro alrededor de la región de graficado. Compare:
par(mfrow = c(2, 3))
for (b in c("o", "l", "7", "c", "u", "n")) {
  plot(iris$Petal.Width, iris$Sepal.Width, bty = b, main = paste("bty =", b),
       xlab = "", ylab = "", pch = 19, cex = 0.7)
}
par(mfrow = c(1, 1))


## TAREA 4 ##
# 'type = "n"' dibuja los ejes pero NO los datos: sirve para armar el marco y
# después ir agregando los puntos por grupos con 'points'.
colores <- c(setosa = "gold", versicolor = "navy", virginica = "firebrick2")
simbolos <- c(setosa = 21, versicolor = 22, virginica = 24)

plot(iris$Petal.Width, iris$Sepal.Width, xlab = "Ancho del pétalo (cm)",
     ylab = "Ancho del sépalo (cm)", cex.axis = 1.5, cex.lab = 1.5, bty = "n",
     type = "n")

for (sp in levels(iris$Species)) {
  points(iris$Petal.Width[iris$Species == sp],
         iris$Sepal.Width[iris$Species == sp],
         pch = simbolos[sp], bg = colores[sp], col = "white", cex = 1.5)
}


## TAREA 5 ##
legend(x = "topright",
       legend = c(expression(italic("Iris setosa")),
                  expression(italic("Iris versicolor")),
                  expression(italic("Iris virginica"))),
       pch = simbolos, pt.bg = colores, col = "white", pt.cex = 1.5, bty = "n")


## TAREA 6 ##
summary(iris$Sepal.Length)
summary(iris$Petal.Width)

# 'par(new=TRUE)' le dice a R que NO borre la figura anterior antes de dibujar
# la siguiente, de modo que las dos quedan superpuestas. Para que la superposición
# tenga sentido, los dos histogramas deben compartir 'breaks' y 'ylim'.
hist(iris$Sepal.Length, breaks = seq(0, 8, 0.5), col = "gray70",
     border = "gray40", xlab = "", ylab = "", main = "", xaxt = "n", yaxt = "n",
     ylim = c(0, 40))
par(new = TRUE)
hist(iris$Petal.Width, breaks = seq(0, 8, 0.5), density = 30, xlab = "",
     ylab = "", main = "", xaxt = "n", yaxt = "n", ylim = c(0, 40))

axis(side = 1, at = seq(0, 8, 1), cex.axis = 1.5)
axis(side = 2, at = seq(0, 40, 10), cex.axis = 1.5, las = 1)
mtext(text = "Longitud (cm)", side = 1, line = 3, cex = 1.5)
mtext(text = "Especímenes", side = 2, line = 3, cex = 1.5)
legend(x = "topright", legend = c("Largo del sépalo", "Ancho del pétalo"),
       fill = c("gray70", "black"), density = c(NA, 30),
       border = c("gray40", "black"), bty = "n")


## TAREA 7 ##
# Dos problemas: (1) con ylim=c(0,40) la barra más alta del ancho de pétalo se
# corta, y (2) el título del eje vertical se sale de la figura.
# El primero se arregla subiendo el límite; el segundo, ampliando el margen
# izquierdo con 'mar' (el orden es c(abajo, izquierda, arriba, derecha)).

par.viejo <- par(no.readonly = TRUE)

max(c(max(table(cut(iris$Sepal.Length, breaks = seq(0, 8, 0.5)))),
      max(table(cut(iris$Petal.Width,  breaks = seq(0, 8, 0.5))))))
# Ese número dice qué tan alto tiene que ser el eje y.

par(mar = c(5, 6, 4, 2))

hist(iris$Sepal.Length, breaks = seq(0, 8, 0.5), col = "gray70",
     border = "gray40", xlab = "", ylab = "", main = "", xaxt = "n", yaxt = "n",
     ylim = c(0, 60))
par(new = TRUE)
hist(iris$Petal.Width, breaks = seq(0, 8, 0.5), density = 30, xlab = "",
     ylab = "", main = "", xaxt = "n", yaxt = "n", ylim = c(0, 60))

axis(side = 1, at = seq(0, 8, 1), cex.axis = 1.5)
axis(side = 2, at = seq(0, 60, 10), cex.axis = 1.5, las = 1)
mtext(text = "Longitud (cm)", side = 1, line = 3, cex = 1.5)
mtext(text = "Especímenes", side = 2, line = 4, cex = 1.5)
legend(x = "topright", legend = c("Largo del sépalo", "Ancho del pétalo"),
       fill = c("gray70", "black"), density = c(NA, 30),
       border = c("gray40", "black"), bty = "n")

par(par.viejo)
