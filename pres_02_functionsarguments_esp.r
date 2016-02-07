 q################################################################################
### R BASICS WORKSHOP                                                        ###
### PRESENTATION 2: FUNCTIONS AND ARGUMENTS                                  ### 
###                                                                          ###
### Center for Conservation and Sustainable Development                      ###
### Missouri Botanical Garden                                                ###
### Website: rbasicsworkshop.weebly.com                                      ### 
################################################################################


### A. ESCRIBIR EN R ES SIMILAR A ESCRIBIR EN ESPAÑOL ##########################

# Un comando en español: Salta tres veces 
# 1. *Salta* es el verbo que define una acción
# 2. *tres veces* y *hacia adelante* son dos modificadores de esa acción

# Otro comando en español: Genera una secuencia del 5 al 20 con valores cada 0.5
# 1. *Genera una secuencia* es la acción a tomar
# 2. *Del 5* modifica la acción definiendo donde empezar
# 3. *al 20* define el final de la secuencia
# 4. *con valores cada 0.5* define como construir la secuencia 

# ¿Cómo darle el comando anterior a una computadora? Utilizando un lenguaje de 
# programación como R!

seq(from=5, to=20, by=0.5)

# 1. *seq* es el nombre de una función, y define una acción a tomar en R
# 2. *from*: es el nombre de un argumento que define el inicio de la secuencia, 
# en este caso el valor de from es 5
# 3. *to=20* es un segundo argumento con su valor 20 que define el final de la
# secuencia
# 4. *by=0.5* es un tercer argumento que define la separación entre valores en 
# la secuencia



### B. LA ANATOMÍA BÁSICA DE UN COMANDO EN R ###################################

seq(from=5, to=20, by=0.5)

# 1. Nombre de la función
# 2. Paréntesis abierto
# 3. Nombre del argumento
# 4. Símbolo de igual (=)
# 5. Valor dado al argumento
# 6. Coma (,)
# 7. Repetir 3,4, y 5 para cada argumento.
# 8. Paréntesis cerrado



### C. ALGUNAS REGLAS BÁSICAS SOBRE ARGUMENTOS #################################

# 1. Los argumentos casi siempre tienen nombres (e.g. from, to, by).

# 2. Cada función tiene un orden pre-determinado de argumentos. Por ejemplo, 
# para la función *seq* el orden es *from* primero, luego *to*, y luego *by*. 

# 3. Uno asigna valores a los argumentos utilizando el símbolo de igual (e.g. 
# *from=5*)

# 4. Los nombres de los argumentos pueden ser eliminados si los valores se dan
# a la función en el orden pre-determinado. Por ejemplo, estos dos comandos son 
# equivalentes:

seq(from=5, to=20, by=0.5)
seq(5, 20, 0.5)

# Pero son distintos de este: 
seq(0.5, 5, 20)

# 5. El orden de los argumentos puede modificarse SOLO si se utilizan los
# nombres. Por ejemplo, estos comandos son equivalentes: 

seq(from=5, to=20, by=0.5)
seq(by=0.5, from=5, to=20)

# 6. Algunos argumentos tienen valores pre-determinados! 

seq(to=20)

# Estos argumentos con valores pre-determinados no necesitan ser especificados
# para que la función trabaje, pero uno tiene que tener cuidado de que los 
# valores predeterminados son los que uno quiere. 

# 7. La descripción de cada función y sus argumentos puede encontrarse en la 
# ayuda de la función. Para acceder a la ayuda, utiliza la función *help*

help(seq)

# o usa el símbolo de interrogación:
?seq



### D. UNOS EJEMPLOS ADICIONALES DE FUNCIONES Y ARGUMENTOS #####################

rep(x="R", times=10)

c(19, 4, 2, 6, 2)

sum(19, 4, 2, 6, 2)

paste("R", "Basics", "Workshop")

rnorm(10)

rpois(10)



### E. FUNCIONES DENTRO DE FUNCIONES ###########################################

# Es muy común en R tener comandos que tienen varias funciones, e incluso que 
# tienen funciones dentro de funciones. Por ejemplo:

c(19, 4, 2, 6, 2) # Concatena varios valores
 
mean(x=c(19, 4, 2, 6, 2)) # Calcula el promedio de los valores en el argumento x

mean(x=19, 4, 2, 6, 2) # Esta versión NO hace lo mismo

# Otro ejemplo un poco más complejo:
rnorm(n=50, mean=0, sd=1) # Genera 50 valores de una distribución normal con 
                           # un promedio de 0 y una desviación estándar de 1
                           
rnorm(n=50, mean=3, sd=1) # Genera 50 valores de una distribución normal con 
                           # un promedio de 3 y una desviación estándar de 1

boxplot(x=list(rnorm(n=50, mean=0, sd=1), rnorm(n=50, mean=3, sd=1)))

# LAS ACCIONES DENTRO SIEMPRE SE EJECUTAN ANTES QUE LAS ACCIONES FUERA. Cuando 
# uno encuentra estos comandos complejos es útil traducirlos al español 
# de dentro hacia afuera. 



### F. UNA MIRADA BREVE A OPERADORES ###########################################

# Operadores son similares a funciones en R porque representan acciones, pero
# su sintaxis es distinta. Los operadores se ponen ENTRE valores. Los más 
# comunes son los operadores aritméticos.

# Estos dos comandos son equivalentes:
sum(19, 5) # Usando la función *sum*
19 + 5 # Usando el operador *+*

# Otros ejemplos:
19-5
19*5
19/5
19^5



### G. FUENTES PRINCIPALES DE AYUDA SOBRE FUNCIONES Y SUS ARGUMENTOS  ##########

# 1. Lee el archivo de ayuda para la función
# 2. Has una búsqueda en la web - usa www.rseek.org
# 3. Pregunta a un amigo
# 4. Has una pregunta en un foro en línea
# 5. Estudia el código detrás de la función 



### H. EL ARCHIVO DE AYUDA PARA UNA FUNCIÓN ####################################

# Dos maneras principales de acceder el archivo de ayuda: *help* y *?*
help(seq)
?seq

# Las partes más importantes del archivo de ayuda:
# 1. DESCRIPTION -  una breve descripción de que es lo que la función hace
# 1. USAGE - como implementar la función
# 2. ARGUMENTS - una descripción de los argumentos de la función
# 3. DETAILS - detalles sobre la acción de la función o sus argumentos
# 4. VALUE - una descripción de los resultados de la función
# 5. SEE ALSO - una lista de funciones relacionadas
# 6. EXAMPLES - una serie de ejemplos del uso de la función









