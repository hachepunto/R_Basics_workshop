################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 10-1: ESCRIBIR TUS PROPIAS FUNCIONES                          ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################

# Además de utilizar las funciones en los paquetes que están disponibles en R,
# uno puede escribir funciones propias. Esta funciones tienen las mismas 
# propiedades que otras funciones en R. Empecemos viendo la ayuda de la función
# *function*

help("function")

# La estructura básica de la definición de una función es la siguiente:

# nombre <- function(argumento1, argumento2)
#{
#   código
#   resultado
#}


## Ejemplo fácil 2 ##

my.fun # Todavía no existe una función con este nombre


my.fun <- function(x) 
{
    resultado <- x + 10
    
    resultado
}


# Ahora utilizamos esta función:

my.fun(4)
my.fun(34)



## Ejemplo fácil 2 ##

# Esta función calcula el estadístico t para comparar la media de dos 
# vectores:

my.twosam # Todavía no existe una función con este nombre


my.twosam <- function(y1, y2) # dos argumentos sin valores pre-determinados
{
    # Tamaño muestral
    n1 <- length(y1) 
    n2 <- length(y2)
    
    # Promedios
    yb1 <- mean(y1)
    yb2 <- mean(y2)
    
    # Varianzas
    s1 <- var(y1)
    s2 <- var(y2)
    
    # Varianza conjunta
    s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)
    
    # Estadístico de t
    tst <- (yb1 - yb2) / sqrt(s*(1/n1 + 1/n2))
    
    # Resultado que exporta la función
    tst
}
# ahora utilizamos esta función para calculare el estadístico de usando 
# dos vectores:

data(iris)

PL.versi <- iris$Petal.Length[which(iris$Species=="versicolor")]
PL.seto <- iris$Petal.Length[which(iris$Species=="setosa")]

boxplot(PL.versi, PL.seto)


tstat <- my.twosam(PL.versi, PL.seto)

tstat


# Muchas funciones en R están escritas en R, y el código detrás de estas 
# funciones puede accederse si uno escribe el nombre de la función en la consola

lm



## Ejemplo 3 ##

# El siguiente código crea una función para simular las dinámicas de una 
# población de acuerdo al modelo de Ricker. Este modelo incluye los siguientes
# parámetros que se utilizan para definir los argumentos de la función:

# "nzero": el tamaño inicial de la población
# "r": la taza de crecimiento
# "K": la capacidad de carga
# "time": es el número total de unidades de tiempo sobre las que la población 
#         va a ser simulada. 

my.ricker.fun <- function(nzero, r, K, time)
{
	N <- numeric(time+1)
	
	N[1] <- nzero
	
	for(i in 1:time)
	{
		N[i+1] <- N[i]*exp(r*(1 - (N[i]/K)))
	}
	
	Time <- 0:time
	
	plot(Time, N, type="l", xlim=c(0, time), cex.axis=1.5, cex.lab=1.5, bty="n", lwd=2)
	
	abline(h=K, lty=3)
	
	N
}

par(mfrow=c(1,2))
sim.abunds.1 <- my.ricker.fun(nzero=1, r=0.1, K=30, time=100)
sim.abunds.2 <- my.ricker.fun(nzero=1, r=0.05, K=500, time=100)





