################################################################################
### R BASICS WORKSHOP                                                					          ###
### PRESENTATION 4-1: ABRIR Y GUARDAR ARCHIVOS                    		                      ###
###                                                               						                      ###
### Unida de Servicios Bioinformáticos    						                      ###
### Instituto Nacional de Medicina Genómica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################


### A. DIRECTORIO DE TRABAJO ###################################################

# El directorio de trabajo es una carpeta la computadora donde R escribe o lee
# archivos de manera pre-determinada.

# Para conocer cual es el directorio de trabajo actual:
getwd()

# Para cambiar el directorio de trabajo:
# setwd(dir="dirección a una carpeta en tu computadora"), por ejemplo:
setwd(dir="/Users/hachepunto/Google Drive/bioinfotmatics_INMEGEN/R_Basics_workshop")

getwd() # Confirma el cambio del directorio de trabajo


## IMPORTANTE: El directorio de trabajo también puede cambiarse utilizando 
# los menús en la barra superior de la ventana de R.
# En Mac: Misc - Change Working Directory
# En Windows: File - Change Dir
# En RStudio: Session/Set Working Directory

# Lista los archivos y carpetas en el directorio de trabajo:
list.files()
dir()


### B. PRINCIPALES FUNCIONES PARA ABRIR Y GUARDAR ARCHIVOS #####################

# 1. read.table: abre marco de datos 
# 2. load: abre cualquier objeto de R
# 3. source: abre un 'script' de R

# 4. write.table: guarda un marco de datos
# 5. save: guarda cualquier objeto de R



### C. ABRIR UNA TABLA DE DATOS ################################################

help(read.table)

## PRINCIPALES ARGUMENTOS:
# 1. file: El nombre del archivo a abrir - y su dirección si el archivo no está
#    en el directorio de trabajo.
# 2. header: TRUE o FALSE. TRUE si la primera fila del archivo representa 
#    los nombres de las columnas.
# 3. sep: El caracter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 


# Esto crea un objeto con nombre *path.to.files* que tiene un carácter con la 
# dirección a una carpeta que tiene los archivos de datos para el taller.
path.to.files <- "/Users/hachepunto/Google Drive/bioinfotmatics_INMEGEN/R_Basics_workshop/Datasets/"

dir(path.to.files)

expr.data <- read.table(file=paste(path.to.files, "Example_expression_set.txt", 
    sep=""), header=TRUE, sep="\t")
expr.data <- read.table(file="/Users/hachepunto/Google Drive/bioinfotmatics_INMEGEN/R_Basics_workshop/Datasets/Example_expression_set.txt", header=TRUE, sep="\t")
# Alternativamente, se puede utilizar la función *file.choose* para buscar el
# archivo en la computadora:
expr.data <- read.table(file=file.choose(), header=TRUE, sep="\t")

## IMPORTANTE: *read.table* siempre abre datos como un marco de datos
class(expr.data)
names(expr.data)

summary(expr.data)

expr.data <- exam.expr.mt

### D. GUARDAR UNA TABLA DE DATOS ##############################################

help(write.table)

## PRINCIPALES ARGUMENTOS:
# 1. x: El objeto de R (marco de datos o matriz) a grabar en un archivo
# 2. file: El nombre del archivo a crear - y su dirección si uno quiere el 
#    archivo en otra carpeta que no es el directorio de trabajo.
# 4. sep: El caracter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 

expr.data # Este es el marco de datos que habíamos creado

list.files(path.to.files) # La lista de archivos en el directorio especificado
                          # en *path.to.files*

write.table(x=expr.data, file=paste(path.to.files, "expr_data.txt", 
    sep=""), sep="\t")

list.files(path.to.files) # La lista actualizada de archivos en el directorio 


# Podemos volver a abrir el archivo que creamos:
expr.data2 <- read.table(file=paste(path.to.files, "expr_data.txt", 
    sep=""), header=TRUE, sep="\t")
       
identical(expr.data, expr.data2)
    
    
### E. GUARDAR OBJETOS BINARIOS DE R  ##############################################
    
# Algunas veces es conveniente guardar objetos de R en un documento binario. Ya sea para:
# 1) Cuando no es eficiente guardar datos en formato de texto.
# 2) Cuando es más conveniente guardar distintos objetos de R juntos.
# 3) Con datos numéricos, con la intención de no perder precisión cuando se convierte a texto.

# La función principal para guardar objetos de R en binario es *save*

help(save)

## PRINCIPALES ARGUMENTOS:
# 1. '...': lista de objetos de R a guardar.
# 2. file: El nombre del archivo a crear - y su dirección si uno quiere el 
#    archivo en otra carpeta que no es el directorio de trabajo.

save(expr.data, file = "expr.data.RData")

load("expr.data.RData")
dir()
# A veces, cuando tienes muchos objetos, es conveniente guardar todo el ambiente de trabajo. La función
# de atajo de *save* para hacer esto es *save.image*.

save.image(file = "R_Basics_workshop.RData")


