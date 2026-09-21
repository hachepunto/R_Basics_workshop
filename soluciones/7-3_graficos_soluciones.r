################################################################################
### R BASICS WORKSHOP                                                        ###
### EJERCICIO 7-3: Gráficos - SOLUCIONES                                     ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## Este archivo contiene las soluciones del ejercicio. NO es el archivo que se
## entrega: trabaja sobre "7-3_graficos.r" y usa este solo para comprobar
## tus respuestas.

## OJO CON EL DIRECTORIO DE TRABAJO:
## Aunque este archivo vive en la carpeta "soluciones", tu directorio de trabajo
## tiene que ser la carpeta del taller (la de arriba, la que contiene "Datasets"
## y "soluciones"). R resuelve las rutas contra el directorio de trabajo, no
## contra la ubicación del archivo. En RStudio: Session > Set Working Directory >
## Choose Directory, y elige la carpeta del taller.

if (!file.exists("7-3_graficos.r")) {
  stop("Directorio de trabajo incorrecto.\n",
       "  Estás en : ", getwd(), "\n",
       "  Debería ser la carpeta del taller, la que contiene 'Datasets'.")
}

## Esta línea vuelve a correr el ejercicio, para que existan todos los objetos
## que las soluciones necesitan.
source("7-3_graficos.r")


## TAREA 1 ##
# Ya está resuelta en el cuerpo del ejercicio.


## TAREA 2 ##
pie(hab.freq)
# Se ve mal: las etiquetas son frases completas y se enciman.


## TAREA 3 ##
hab.top <- sort(hab.freq, decreasing = TRUE)[1:4]
hab.top

# Acortamos las etiquetas para que quepan:
etiquetas <- paste(substr(names(hab.top), 1, 22), "\n(n = ", hab.top, ")", sep = "")

pie(hab.top,
    labels = etiquetas,
    col = c("darkolivegreen3", "goldenrod2", "steelblue3", "firebrick2"),
    border = "white",
    cex = 0.8,
    main = "Hábitats con más capturas")


## TAREA 4 ##
# Los tres histogramas comparten 'breaks', si no, no se pueden superponer:
cortes <- seq(floor(min(estreb$Weight)), ceiling(max(estreb$Weight)), by = 2)

hist(estreb$Weight, breaks = cortes, col = "grey85", border = "grey50",
     main = "Peso de los murciélagos", xlab = "Peso (g)", ylab = "Individuos",
     cex.lab = 1.3, cex.axis = 1.2, las = 1)

hist(estreb$Weight[estreb$Sex == "h"], breaks = cortes, add = TRUE,
     col = adjustcolor("firebrick2", alpha.f = 0.5), border = "firebrick4")

hist(estreb$Weight[estreb$Sex == "m"], breaks = cortes, add = TRUE,
     col = adjustcolor("steelblue3", alpha.f = 0.5), border = "steelblue4")

legend("topright", legend = c("Todos", "Hembras", "Machos"),
       fill = c("grey85", adjustcolor("firebrick2", 0.5),
                adjustcolor("steelblue3", 0.5)),
       border = c("grey50", "firebrick4", "steelblue4"), bty = "n")


## TAREA 5 ##
# Primero vemos qué localidades tienen más datos:
sitios.freq <- sort(table(estreb$SiteName), decreasing = TRUE)
head(sitios.freq)

sitios.3 <- names(sitios.freq)[1:3]
sitios.3

sub.estreb <- estreb[estreb$SiteName %in% sitios.3, ]
# 'droplevels' quita los niveles del factor que ya no se usan; si no, el
# boxplot dibuja una caja vacía por cada localidad que filtramos.
sub.estreb$SiteName <- droplevels(sub.estreb$SiteName)

boxplot(Streblidae ~ SiteName, data = sub.estreb,
        col = c("darkolivegreen3", "goldenrod2", "steelblue3"),
        xlab = "Localidad", ylab = "Número de ectoparásitos",
        cex.lab = 1.3, cex.axis = 1.0, las = 1)


## TAREA 6 ##
dir.create("salidas", showWarnings = FALSE)

pdf(file = "salidas/ectoparasitos_por_localidad.pdf", width = 8, height = 6)

  par(mar = c(5, 5, 3, 2))
  boxplot(Streblidae ~ SiteName, data = sub.estreb,
          col = c("darkolivegreen3", "goldenrod2", "steelblue3"),
          xlab = "Localidad", ylab = "Número de ectoparásitos",
          main = "Carga de Streblidae por localidad",
          cex.lab = 1.3, cex.axis = 1.0, las = 1)

dev.off()

list.files("salidas/")
