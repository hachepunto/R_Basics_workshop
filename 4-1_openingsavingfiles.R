################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 3: ABRIR Y GUARDAR ARCHIVOS                                 ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################


### A. DIRECTORIO DE TRABAJO ###################################################

# El directorio de trabajo es una carpeta la computadora donde R escribe or lee
# archivos de manera pre-determinada.

# Para conocer cual es el directorio de trabajo actual:
getwd()

# Para cambiar el directorio de trabajo:
# setwd(dir="dirección a una carpeta en tu computadora"), por ejemplo:
setwd(dir="~/Dropbox/Teaching/R_Basics_Workshop/")

getwd() # Confirma el cambio del directorio de trabajo


## IMPORTANTE: El directorio de trabajo también puede cambiarse utilizando 
# los menús en la barra superior de la ventana de R.
# En Windows: File - Change Dir
# En Mac: Misc - Change Working Directory


# Lista los archivos y carpetas en el directorio de trabajo:
list.files()



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


# Esto crea un objeto con nombre *path.to.files* que tiene un caracter con la 
# dirección a una carpeta que tiene los archivos de datos para el taller.
path.to.files <- "~/Dropbox/Teaching/R_Basics_Workshop/4_Datasets/"

list.files(path.to.files)

streb.data <- read.table(file=paste(path.to.files, "Data_streblidaeonbats.txt", 
    sep=""), header=TRUE, sep="\t")

# Alternativamente, se puede utilizar la función *file.choose* para buscar el
# archivo en la computadora:
streb.data <- read.table(file=file.choose(), header=TRUE, sep="\t")

## IMPORTANTE: *read.table* siempre abre datos como un marco de datos
class(streb.data)
names(streb.data)

summary(streb.data)


### D. GUARDAR UNA TABLA DE DATOS ##############################################

help(write.table)

## PRINCIPALES ARGUMENTOS:
# 1. x: El objeto de R (marco de datos o matriz) a grabar en un archivo
# 2. file: El nombre del archivo a crear - y su dirección si uno quiere el 
#    archivo en otra carpeta que no es el directorio de trabajo.
# 4. sep: El caracter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 

abund.data # Este es el marco de datos que habíamos creado

list.files(path.to.files) # La lista de archivos en el directorio especificado
                          # en *path.to.files*

write.table(x=abund.data, file=paste(path.to.files, "abund_data.txt", 
    sep=""), sep="\t")

list.files(path.to.files) # La lista actualizada de archivos en el directorio 


# Podemos volver a abrir el archivo que creamos:
abund.data2 <- read.table(file=paste(path.to.files, "abund_data.txt", 
    sep=""), header=TRUE, sep="\t")
       
identical(abund.data, abund.data2)
    
    
    
    
    

