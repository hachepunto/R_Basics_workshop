################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 9: CONTROL DE FLUJO                                         ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################


### INTRODUCCIÓN ###############################################################

# En R hay una serie de elementos que te permiten controlar el flujo del código.
# Hay 4 tipos principales maneras de controlar flujo:

# 1. Bucles (loops) *for*
# 2. Bucles (loops) *while*
# 3. Condicionales 
# 4. Rupturas (breaks)

# Para esta presentación nos vamos a enfocar en *for*, *while* e *if*

## IMPORTANTE: para ayuda con control de flujo:
help(Control)



### BUCLES *for* ###############################################################

# Un bucle permite repetir un pedazo de código múltiples veces sin tener que 
# repetirlo.

# *for* es la manera mas común de construir bucles. Este tipo de bucle repite 
# un pedazo de código un numero pre-determinado de veces.


# La estructura general de un bucle *for* es la siguiente:
#
# for(i in vector)
# {
#   code
# }


# Esto quiere decir aproximadamente:
#
# para cada valor que i toma del vector repetir
# {
#   este código
# }


## Ejemplo fácil 1 ##
#
v <- 1:10

for(i in v)
{
    print(i)
}

# Esto se traduce como:
#
# Crear una secuencia del 1 al 10 y guardarla como un objeto llamado *v*
# 
# Para cada valor que la variable *i* toma del vector *v* hacer lo siguiente:
# imprimir el valor de i
#


## Ejemplo fácil 2 ##

v <- letters

v

for(i in v)
{
    print(i)
}


## Ejemplo fácil 3 ##

v <- letters

length(v)

result <- 0

for(i in v)
{
	print(i)
	result <- result + 1
}

result


## Ejemplo fácil 4 ##

v <- c(1,3,5,2,4)

result <- 0

for(i in 1:length(v))
{
	print( c(i, v[i]) )

	result <- result + v[i]
}

result


## Ejemplo fácil 5 ##

col.v <- rainbow(100)
cex.v  <- seq(1, 10, length.out=100)

plot(0:1, 0:1, type="n")

for(i in 1:200)
{
	print(i)

	points(runif(1), runif(1), pch=16, col=sample(col.v, 1), 
	    cex=sample(cex.v, 1))

	Sys.sleep(0.1)
}


## Ejemplo fácil 6 ##

# Abrir el archivo BatsEnviroAmerica.txt. Este archivo contiene datos de riqueza
# de especies en celdas de 100x100 km, así como medidas de varias variables
# ambientales. 

BatData <- read.table(file=file.choose(), header=TRUE, sep="\t")

# Alternativamente, si el archivo esta en el directorio de trabajo, también se
# puede abrir con el siguiente comando:

BatData <- read.table(file="Data_BatsEnviroAmerica.txt", header=TRUE, sep="\t")


class(BatData)

head(BatData)

rich <- BatData$richness

enviro <- BatData[,5:ncol(BatData)]
colnames(enviro)


# Aquí vamos a calcular el R2 de la relación entre riqueza de especies y varias
# variables predictoras utilizando un bucle en vez de tener que escribir el 
# mismo código varias veces

# Esto crea un vector vacío que va a guardar los resultados (el R2) de cada 
# repetición del bucle
lm.R2 <- rep(NA, ncol(enviro))

names(lm.R2) <- colnames(enviro)

lm.R2

for(i in 1:ncol(enviro))
{
	lm.i <- lm(rich ~ enviro[,i])

	res.lm.i <- summary(lm.i)

	lm.R2[i] <- res.lm.i$adj.r.squared
}

lm.R2

barplot(lm.R2)



### BUCLES *while* #############################################################

# *while* también es muy útil para construir bucles. Este tipo de bucle repite
# un pedazo de código mientras una condición determinada es cierta.

# La estructura general de un bucle *while* es la siguiente:
#
# while(condición)
# {
#   código
# }

# Esto quiere decir aproximadamente:
#
# mientras esta condición es verdadera repetir
# {
#   este código
# }


## Ejemplo fácil 1 ##
v <- 1:10

# Versión 1
i <- 0
while(i < max(v))
{
	i <- i+1
	print(i)
}

# Versión 2
i <- 0
while(i < max(v))
{
	print(i)
	i <- i+1
}


## Ejemplo 2 ##

Bp <- 0.1 
Dp <- 0.1 
Np <- 1-Bp-Dp

max.t <- 100
time <- 0
abund <- 10

plot(c(0, max.t), c(0, 100), type="n")


while(abund>0 & time<= max.t)
{
	change <- sample(c(-1,0,1), size=abund, prob=c(Dp, Np, Bp), replace=TRUE)

	abund <- abund + sum(change)
	time <- time + 1

	points(time, abund, pch=16, col="black")
}



### Condicional *if* ########################################################### 

# El condicional *if* permite correr un pedazo de código solamente si una 
# condición en particular es verdadera

## Ejemplo fácil 1 ##

v <- 1:10

for(i in v)
{
	print(i)

	if(i == 5)
		print("Reached 5") # Con un solo comando, las llaves {} no son necesarias
}


## Ejemplo fácil 2 ##

trait <- 0
max.time <- 100

plot(c(0,max.time), c(-20, 20), type="n", 	ylab="Trait Value", xlab="Time")

points(0, trait, pch=16, col="black")

for(i in 1:max.time)
{
	trait.shift <- rnorm(1, 0, 0.5)
	trait <- trait + trait.shift 

	if(trait.shift > 0) 
	    COL <- "gold"
	if(trait.shift < 0) 
	    COL <- "lightblue"
	
	points(i, trait, pch=16, col=COL)

	Sys.sleep(0.2)
}



### Rupturas *breaks* ########################################################## 

# La función *break* causa que un bucle termine. Se usa frecuentemente en 
# conjunto con un condicional

## Ejemplo fácil 1 ##

v <- 1:10

for(i in v)
{
	print(i)

	if(i == 5) # Con mas de un comando, las llaves {} son necesarias
	{ 
		print("Reached 5")
		break()
	}
}



### Evitar bucles  #############################################################

# Los bucles son extremadamente útiles, pero también pueden ser lentos. Cuando
# es posible, es buena idea evitar utilizar bucles en R y utilizar funciones
# que ya existen en R. A esto se le llama: vectorización.

# Por ejemplo, supongamos que tenemos una matriz muy grande de abundancia de 
# 10 especies en 1,000,000 de sitios

M <- matrix(rpois(50000000, 10), ncol=50)


dim(M) 

head(M)

# Como calcular la abundancia total de individuos por sitio (fila)?


## Opción 1 - un bucle muy ineficiente ##

abund.1 <- numeric()

system.time( 
{
 
  for(i in 1:nrow(M)) 
  { 
	abund.1 <- c(abund.1, sum(M[i,]))
  } 

}) 


## Opción 2 - un bucle un poco mejor ##

abund.2 <- rep(NA, nrow(M))

system.time( 
{
 
  for(i in 1:nrow(M)) 
  { 
	abund.2[i] <- sum(M[i,])
  } 

}) 


## Opción 3 - uso de la función apply ##

system.time( 
{
  abund.3 <- apply(M, 1, sum)
}) 


## Opción 4 – vectorización ##
system.time( 
{
  abund.4 <- colSums(M)
}) 


?apply











