################################################################################
### R BASICS WORKSHOP                                                        ###
### CLASE 10-1: Escribir tus propias funciones                               ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
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


## Ejemplo 1 ##

try(my.fun) # Error A PROPÓSITO: todavía no existe nada con este nombre


my.fun <- function(x){
    resultado <- x + 10
    
    resultado
}


# Ahora utilizamos esta función:

my.fun(4)
my.fun(34)



## Ejemplo 2 ##

# Esta función calcula el estadístico t para comparar la media de dos 
# vectores:

try(my.twosam) # Error A PROPÓSITO: tampoco existe todavía


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
# Ahora usamos esta función para calcular el estadístico t con dos vectores:

data(iris)

# Para indexar con una condición no hace falta 'which': el vector lógico se
# puede usar directamente entre corchetes.
PL.versi <- iris$Petal.Length[iris$Species == "versicolor"]
PL.seto  <- iris$Petal.Length[iris$Species == "setosa"]

boxplot(PL.versi, PL.seto)


tstat <- my.twosam(PL.versi, PL.seto)

tstat


# Comparemos el resultado con la función que R ya trae:
t.test(PL.versi, PL.seto, var.equal = TRUE)$statistic
tstat
# Deben coincidir: 'my.twosam' calcula exactamente la t de varianza conjunta.


# Muchas funciones de R están escritas en R, y el código detrás de ellas puede
# verse escribiendo el nombre de la función SIN paréntesis en la consola:

lm



## Ejemplo 3 ##

# El siguiente código crea una función para simular la dinámica de una 
# población de acuerdo al modelo de Ricker. Este modelo incluye los siguientes
# parámetros que se utilizan para definir los argumentos de la función:

# "nzero": el tamaño inicial de la población
# "r": la tasa de crecimiento
# "K": la capacidad de carga
# "time": es el número total de unidades de tiempo sobre las que la población 
#         va a ser simulada. 

my.ricker.fun <- function(nzero, r, K, time){
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
par(mfrow=c(1,1)) # Deja el dispositivo gráfico como estaba

# La función devuelve el vector de abundancias ADEMÁS de dibujar la gráfica:
head(sim.abunds.1)
length(sim.abunds.1)

# Con valores altos de 'r' el modelo de Ricker deja de converger a K y empieza a
# oscilar, y para r > ~2.7 se vuelve caótico. Pruébalo:
par(mfrow=c(1,2))
invisible(my.ricker.fun(nzero=1, r=2.0, K=30, time=100))
invisible(my.ricker.fun(nzero=1, r=3.0, K=30, time=100))
par(mfrow=c(1,1))
