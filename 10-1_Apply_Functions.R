################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 9-1: Las Funciones apply de R                          ### 
###                                                                                                                                                   ###
### Unida de Servicios Bioinformáticos                                                                                           ###
### Instituto Nacional de Medicina Genómica                                                                                 ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################

# La familia de funciones apply es usada para aplicar una función a cada 
# elemento de una estructura de datos. En particular, es usada para aplicar 
# funciones en matrices, data frames, arrays y listas.
# Con esta familia de funciones podemos automatizar tareas complejas usando 
# poca líneas de código y es una de las características distintivas de R como 
# lenguaje de programación.

### RECORDATORIO. Operaciones con vectores

# Para enterder más facilmente como trabajan las funciones apply, recordemos la
# vectorización de operaciones:

# Hay operaciones que, si las aplicamos a un vector, son aplicadas a todos sus 
# elementos.

mi_vector <- 1:10
mi_vector

mi_vector ^ 2


## APPLY

# Se utiliza la función *apply()* sobre matricez. Esta funión toma cinco 
# argumentos:
#
#	apply(X, MARGIN, FUN, ...)
#
# -X: una matriz o cualquier otro objeto que sea posible coercionar a una matriz
# -MARGIN: Define sobre qué se va ejecutar la función y toma valores entre 1 y 2:
#	-MARGIN=1`: La manipulación se hace por renglón
#	-MARGIN=2`: La manipulación se hace por columnas
#	-MARGIN=c(1,2)`: La manipulación se hace por rengloes y columnas
# -FUN: Indica que función se aplicará. Se puede usar funciones integradas como 
#       mean, median, sum, min, max e incluso funciones definidas por el usuario.

# La funcion apply ejecuta la funcion "FUN", sobre todos las columnas 
# (MARGIN =2) o renglones (MARGIN = 1) de una matriz.

# Creamos una matriz de cuatro renglones
matriz <- matrix(1:16, nrow = 4)

# Aplicamos *apply*, dando la función *sum* el argumento FUN, nota que 
# sólo necesitamos el nombre de la función, sin paréntesis.
# Por último, damos el argumento MARGIN = 1, para aplicar la función por renglón.

apply(X = matriz, MARGIN = 1, FUN = sum)

# Esto es equivalente a hacer lo siguiente:

sum(matriz[1, ])
sum(matriz[2, ])
sum(matriz[3, ])
sum(matriz[4, ])

# Si cambiamos el argumento MARGIN de MARGIN = 1 a MARGIN = 2, entonces la 
# función se aplicará por columna.

apply(X = matriz, MARGIN = 2, FUN = sum)

### PREPARACIÓN DE DATOS: Comencemos por cargar unos datos de expresión de 
# ENSEMBLE de Drosophila Los renglones son genes y hay información de cuatro 
# tiempos (2, 6, 8 y 10) y otros metadatos.

data <- read.table("Datasets/rpkm_clase.tab", header=T, sep="\t")

head(data)

# Filtramos los datos para quedarnos solo con los genes que tienen un RPKM mayor
# a 10 y luego generamos una matriz con los datos de expresión únicamente.

expressed <- subset(data, (rpkm2 >10 & rpkm6 >10 & rpkm8 >10 &rpkm10 >10))
#expressed$chr <- as.character(expressed$chr)
head(expressed)


rpkm <- cbind(expressed$rpkm2, expressed$rpkm6, expressed$rpkm8, expressed$rpkm10)
is.matrix(rpkm)

head(rpkm)
class(rpkm)


# Para obtener la media de la expresion para cada gene, a traves de los cuatro 
# tiempos:

apply(rpkm, 1, mean) ##per row

# para obtener la media de la expresion para cada tiempo, sumando la expresion
# de todos los genes:

apply(rpkm, 2, mean) ##per column


# podemos utilizar estos resultados para hacer una grafica, o visualizar los 
# datos de alguna manera

hist( apply(rpkm, 1, mean), 
	xlab = "Nivel de expresion", 
	ylab = "Numero de genes",
	main = "Distribucion de la expresion promedio",
	breaks=seq(min(apply(rpkm, 1, mean)), 
				max(apply(rpkm, 1, mean)), 
			length.out = 50)
	)

##  lapply y sapply

?lapply

rpkm.df <- as.data.frame(rpkm)
names(rpkm.df) <- c("t2", "t6", "t8", "t10")

###### lappy EJECUTA LA FUNCION FUN SOBRE CADA ELEMENTO DE X

##### QUIERO AGREGARLE 5 AL VALOR DE EXPRESION DE TODOS LOS GENES DEL TIEMPO 2
head(rpkm.df$t2)
lapply(head(rpkm.df$t2), function(x){x+5} )

###### sappy TE REGRESA EL OBJETO MAS SIMPLE QUE PUEDE, DEPENDIENDO DEL RESULTADO DE LA FUNCION FUN
sapply(head(rpkm.df$t2), function(x){x+5}, simplify = F)


###### QUIERO ELIMINAR EL PREFIJO "FB" DEL id DE FLYBASE PARA CADA UNO DE LOS GENES

lapply(data$flybase_id, function(x){ sub("FB", "", x) })

head(sapply(data$flybase_id, function(x){ sub("FB", "", x) }, simplify = T))


##### SAPPLY ES BASTANTE INTELIGENTE AL DECIDIR EL TIPO DE DATO QUE NOS QUIERE REGRESAR
##### PROBEMOS INCLUIR UNA FUNCION PERSONALIZADA ADENTRO DEL APPLY

#### QUEREMOS OBTENER LA EXPRESION PROMEDIO DE LOS GENES POR CROMOSOMA PARA CADA UNO DE LOS TIEMPOS

#### NECESITAMOS:
## 1. OBTENER TODOS LOS GENES DE UN CROMOSOMA ESPECIFICO
## 2. OBTENER EL PROMEDIO DE LA EXPRESION PARA ESOS GENES EN EL TIEMPO 1
## 3. OBTENER EL PROMEDIO DE LA EXPRESION PARA ESOS GENES EN EL TIEMPO 2... Y ASI SUCESIVAMENTE
## REPETIR DE 1 A 3 PARA TODOS LOS CROMOSOMAS


#### PRIMERO VAMOS A GENERAR UNA FUNCION QUE HAGA LO QUE QUEREMOS PARA UN CROMOSOMA

cromosoma <- "chr4"
genes.cromosoma <- subset(data, chr == cromosoma)
tiempos <- as.matrix(cbind(genes.cromosoma$rpkm2, genes.cromosoma$rpkm6, genes.cromosoma$rpkm8, genes.cromosoma$rpkm10))

dim(tiempos)

### QUEREMOS OBTENER LA EXPRSION PROMEDIO POR COLUMNA
mean.expr <- apply(tiempos, 2, mean)

#### CREEMOS UNA FUNCION CON LAS INSTRUCCIONES QUE ACABAMOS DE ESCRIBIR

gene_mean_expr <-  function(x, data){
  genes.cromosoma <- subset(data, chr == x)
  tiempos <- as.matrix(cbind(genes.cromosoma$rpkm2, genes.cromosoma$rpkm6, genes.cromosoma$rpkm8, genes.cromosoma$rpkm10))
  mean.expr <- apply(tiempos, 2, mean)
}


#### HAGAMOSLO PARA TODOS LOS CROMOSOMAS UTILIZANDO UN APPLY

cromosomas <- as.character(unique(data$chr))

res_expr_perchr_lapply <- lapply(cromosomas, gene_mean_expr, data=data)

res_expr_perchr_sapply <- sapply(cromosomas, gene_mean_expr, data=data, simplify = T)


############
### TAPPLY: 
#######

### APLICA UNA FUNCION PARA CADA SUBCONJUNTO DE LOS DATOS
### LOS SUBCONJUNTOS SON OBTENIDOS CON BASE EN EL FACTOR ESPECIFICADO EN INDEX

tapply(expressed$flybase_id, expressed$chr, length)
tapply(expressed$rpkm2, expressed$chr, mean)


tapply(expressed$flybase_id, list(expressed$chr, expressed$strand), length)

tapply(expressed$rpkm2, list(expressed$chr, expressed$strand), mean)

