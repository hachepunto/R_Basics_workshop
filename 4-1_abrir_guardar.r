################################################################################
### R BASICS WORKSHOP                                                        ###
### CLASE 4-1: Abrir y guardar archivos                                      ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################


# Las salidas de este archivo (tablas y objetos guardados) van a la carpeta
# "salidas", que se crea aquí si no existe:
dir.create("salidas", showWarnings = FALSE)


### A. DIRECTORIO DE TRABAJO ###################################################

# El directorio de trabajo es una carpeta de la computadora donde R escribe o lee
# archivos de manera pre-determinada.

# Para conocer cual es el directorio de trabajo actual:
getwd()

# Para cambiar el directorio de trabajo se usa *setwd*, dándole la dirección de
# una carpeta de TU computadora. La ruta es distinta en cada máquina, así que la
# línea de abajo está comentada: descoméntala y pon tu propia ruta.

# setwd(dir = "/ruta/a/tu/carpeta/R_Basics_workshop")

getwd() # Confirma el directorio de trabajo

## IMPORTANTE: De aquí en adelante este archivo supone que tu directorio de
## trabajo es la carpeta del taller, es decir, la que contiene la carpeta
## "Datasets". Si no es así, los read.table de abajo no van a encontrar nada.


## IMPORTANTE: El directorio de trabajo también puede cambiarse utilizando 
# los menús en la barra superior de la ventana de R.
# En Mac: Misc - Change Working Directory
# En Windows: File - Change Dir
# En RStudio: Session/Set Working Directory

# Lista los archivos y carpetas en el directorio de trabajo:
list.files()
dir()


### B. PRINCIPALES FUNCIONES PARA ABRIR Y GUARDAR ARCHIVOS #####################

# Para ABRIR:
# 1. read.table: abre una tabla de datos como marco de datos
# 2. load: abre objetos de R guardados con *save*
# 3. source: corre un 'script' de R
# 4. readRDS: abre un objeto guardado con *saveRDS*

# Para GUARDAR:
# 5. write.table: guarda un marco de datos como texto
# 6. save: guarda uno o varios objetos de R en binario
# 7. saveRDS: guarda UN objeto de R en binario


### C. ABRIR UNA TABLA DE DATOS ################################################

help(read.table)

## PRINCIPALES ARGUMENTOS:
# 1. file: El nombre del archivo a abrir - y su dirección si el archivo no está
#    en el directorio de trabajo.
# 2. header: TRUE o FALSE. TRUE si la primera fila del archivo representa 
#    los nombres de las columnas.
# 3. sep: El carácter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 


# Con una ruta RELATIVA al directorio de trabajo (lo recomendable: así el
# código funciona en la computadora de cualquiera):
expr.data <- read.table(file = "Datasets/Example_expression_set.txt",
                        header = TRUE, sep = "\t")

# También se puede dar la ruta ABSOLUTA, pero entonces el código solo sirve en
# tu computadora:
# expr.data <- read.table(file = "/ruta/completa/Datasets/Example_expression_set.txt",
#                         header = TRUE, sep = "\t")

# Y se puede usar *file.choose* para buscar el archivo con el explorador. OJO:
# esto abre una ventana y espera a que elijas, así que un archivo que use
# file.choose ya no puede correrse solo de principio a fin:
# expr.data <- read.table(file = file.choose(), header = TRUE, sep = "\t")

## IMPORTANTE: *read.table* siempre abre datos como un marco de datos
class(expr.data)
names(expr.data)

summary(expr.data)

### D. GUARDAR UNA TABLA DE DATOS ##############################################

help(write.table)

## PRINCIPALES ARGUMENTOS:
# 1. x: El objeto de R (marco de datos o matriz) a grabar en un archivo
# 2. file: El nombre del archivo a crear - y su dirección si uno quiere el 
#    archivo en otra carpeta que no es el directorio de trabajo.
# 4. sep: El caracter que se usa para separar valores, más frecuentemente: "\t"
#    o ",". 

head(expr.data) # Este es el marco de datos que habíamos creado

list.files("Datasets/") # La lista de archivos en el directorio "Datasets"

write.table(x = expr.data, file = "Datasets/expr_data.txt", row.names = FALSE,
            sep = "\t")

list.files("Datasets/") # La lista actualizada de archivos en el directorio 


# Podemos volver a abrir el archivo que creamos:
expr.data2 <- read.table(file = "Datasets/expr_data.txt", header = TRUE, sep = "\t")
       
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

# Guardamos dos objetos en un solo archivo binario. Solo se pueden guardar
# objetos que existan en la sesión: si listas uno que no creaste, *save* falla.
save(expr.data, expr.data2, file = "salidas/expr_data.RData")

load("salidas/expr_data.RData")
list.files("salidas/")
# A veces, cuando tienes muchos objetos, es conveniente guardar todo el ambiente de trabajo. La función
# de atajo de *save* para hacer esto es *save.image*.

save.image(file = "salidas/R_Basics_workshop.RData")


### F. UN SOLO OBJETO: saveRDS / readRDS #######################################

# *save* guarda objetos CON SU NOMBRE: al hacer *load* reaparecen llamándose
# igual. *saveRDS* guarda UN objeto sin su nombre, y al leerlo con *readRDS* tú
# decides cómo llamarlo. Es más limpio cuando solo quieres guardar una cosa.

saveRDS(expr.data, file = "salidas/expr_data.rds")

expr.data3 <- readRDS("salidas/expr_data.rds")
identical(expr.data, expr.data3)
