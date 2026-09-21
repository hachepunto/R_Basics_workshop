################################################################################
### R BASICS WORKSHOP                                                        ###
### CLASE 5-1: Operadores                                                    ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################

## AYUDA CON OPERADORES ########################################################

help("*")

# Para pedir ayuda de un operador hay que poner su nombre ENTRE COMILLAS. Sin
# comillas no funciona, porque R intenta interpretar el símbolo como código:
?"*"
# ?*   # Esto daría un error de sintaxis


# Un par de vectores y matrices que vamos a utilizar para ejemplos
p <- seq(1, 10, 1)
z <- seq(9, 18,1)

p
z

P <- matrix(seq(1, 25, 1), ncol=5)
Z <- matrix(seq(26, 50, 1), ncol=5)

P
Z



## OPERADORES ARITMÉTICOS ######################################################

# Estos sirven para hacer varias operaciones aritméticas; estos son los más 
# comunes:

# + suma
# - resta
# * multiplicación
# / división
# ^ potencia
# %% modulo - calcula el resto en una división
# %/% división de enteros - calcula la parte entera de una división


## IMPORTANTE: Es critico entender como los operadores trabajan en diferentes 
## situaciones.


## Caso 1. Dos escalares (números únicos): el caso más sencillo ##
10 + 3

10 - 3

10 * 3

10 / 3

10 ^ 3

10 %% 3

10 %/% 3


## Caso 2. Un vector o matriz y un escalar ##
p
P

p - 3
P - 3

# Como se puede ver, la operación se produce entre cada elemento en p o P con el 
# escalar. El resultado es del mismo tamaño que el vector o matriz. Lo mismo
# pasa para todo el resto de operadores, por ejemplo:

p ^ 3
P ^ 3

p %% 3
P %% 3


## Caso 3. Dos vectores o matrices de mismo tamaño ##
z
Z

p * z
P / Z

# En este caso la operación es entre elementos correspondientes de los dos 
# vectores o matrices. El resultado es del mismo tamaño que los objetos 
# originales. 


## Caso 4. Dos vectores o matrices de tamaños distintos ##
length(p)

p - c(1,2)

p - c(1,2,3)

## IMPORTANTE: en el primer caso, la longitud del objeto pequeño (2) es un 
## múltiplo de la longitud del grande (10). La operación se realiza "reciclando"
## o repitiendo elementos del objeto más pequeño. En el segundo caso, también
## pasa lo mismo, pero la longitud del pequeño (3) no es un múltiplo de la 
## longitud del grande. Esto genera un mensaje de advertencia. 


## Caso 5. Operaciones con NA ##

# En cualquier situación cuando hay NAs, las operaciones siempre devuelven NA
p - NA

p - c(1, NA)



## OPERADORES COMPARATIVOS #####################################################

# >  mayor que

# < menor que

# >= mayor o igual que

# <= menor o igual que

# == igual que (no es un solo "=", son dos juntos!)

# != no es igual que


## IMPORTANTE: Las operaciones entre objetos se llevan a cabo bajo las mismas 
## reglas que para los operadores aritméticos, pero devuelven ya sea TRUE o 
## FALSE:

p < 5
z > 8

p <= z
Z >= P


p == c(33, 37) # 10 es múltiplo de 2: recicla sin quejarse
Z != c(NA, 37) # 25 NO es múltiplo de 2: recicla, pero avisa con un warning

# Aunque no es un operador, las funciones *is.na* y *!is.na* son útiles en este
# contexto
x <- c(3, NA, 34, 23, 19, NA)

is.na(x) # función "is.na"

!is.na(x) # función "is.na" con lógico "no"


p < c(5, NA)

is.na(p < c(5, NA))

!is.na(p < c(5, NA))



## OPERADORES LÓGICOS #########################################################
# &: quiere decir 'y'
# |: quiere decir 'o'

5 > 3 # Esto es TRUE (verdadero)

5 < 3 # Esto es FALSE (falso)


2 > 4 # Esto es FALSE 

2 < 4 # Esto es TRUE 


## & ##

# Es 5 menos que tres Y 2 mayor que 4?
5<3 & 2>4 # Esto es FALSE porque NINGUNA de las comparaciones son TRUE

# Es 5 mayor que tres Y 2 mayor que 4?
5>3 & 2>4 # Esto también es FALSE porque NO TODAS las comparaciones son TRUE

# Es 5 mayor que tres Y 2 menor que 4?
5>3 & 2<4 # Ahora ambas comparaciones son TRUE, entonces todo junto también es TRUE


## | ##

# Es 5 menor que 3 O 2 mayor que 4?
5<3 | 2>4 # Esto es FALSE porque NINGUNA de las comparaciones son TRUE

# Es 5 mayor que 3 O 2 mayor que 4?
5>3 | 2>4 # Esto también es TRUE porque AL MENOS UNA las comparaciones son TRUE

# Es 5 mayor que 3 O 2 menor que 4?
5>3 | 2<4 # Esto también es TRUE porque AL MENOS UNA las comparaciones son TRUE


## IMPORTANTE: Cuando *&* o *|* se usan con vectores o matrices, las 
## comparaciones se hacen elemento por elemento. Por ejemplo:

p > 5
z < 15


p>5 & z<15 # Es TRUE solo para los elementos donde p>5 Y z<15 son TRUE

p>5 | z<15 # Es TRUE para los elementos donde p>5 O z<15 son TRUE


## IMPORTANTE: *&&* y *||* también existen, pero NO son la versión "doble" de
## *&* y *|*: sirven para comparar UN SOLO valor lógico contra otro, no vectores.
## Se usan en condiciones de 'if' y 'while', donde hace falta un único TRUE/FALSE.

length(p) # p tiene 10 elementos

## OJO, ESTO CAMBIÓ CON LAS VERSIONES DE R:
## - Hasta R 4.1, *&&* con vectores usaba en silencio solo el PRIMER elemento.
## - En R 4.2 eso pasó a ser una advertencia.
## - Desde R 4.3 es un ERROR.
## Como el comportamiento silencioso escondía errores, ahora R obliga a ser
## explícito. Las dos líneas siguientes van en try() porque, en un R actual,
## fallan a propósito:

try(p>5 && z<15)

try(p>5 || z<15)

## Así se escribe hoy lo que antes hacía *&&* "por accidente": tomar
## explícitamente el primer elemento.

(p>5)[1] && (z<15)[1]

(p>5)[1] || (z<15)[1]

## Y cuando lo que quieres es resumir TODO el vector en un solo valor lógico,
## las funciones correctas son *all* y *any*:

all(p > 5) # ¿TODOS los elementos de p son mayores que 5?
any(p > 5) # ¿ALGUNO de los elementos de p es mayor que 5?

if (any(p > 5) && all(z > 0)) {
  print("Aquí sí tiene sentido usar && : ambos lados son un solo TRUE/FALSE")
}
