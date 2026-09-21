# R Basics workshop

Curso básico de R impartido por [Hugo Tovar](https://github.com/hachepunto) en
**Métodos de biología computacional**, Facultad de Ciencias, UNAM.

Basado en el [curso](http://rbasicsworkshop.weebly.com/) de
[J. Sebastián Tello](http://www.missouribotanicalgarden.org/plant-science/plant-science/research-staff/article/400/tello-j-sebastian.aspx)
e [Iván Jiménez](http://www.missouribotanicalgarden.org/plant-science/plant-science/research-staff/article/396/jimenez-ivan.aspx)
(Center for Conservation and Sustainable Development, Missouri Botanical Garden).

## Cómo está organizado

Los archivos siguen la numeración `tema-número`:

* Los `-1` son **clases** (`3-1_objetos.R`).
* Los `-2` en adelante son **ejercicios y tareas** (`3-2_objetos.r`, `3-3_objetos_EN.r`).

Las soluciones viven en la carpeta `soluciones/`, un archivo por ejercicio:

```
3-2_objetos.r                          <- el ejercicio (esto es lo que se entrega)
soluciones/3-2_objetos_soluciones.r    <- las soluciones (para autoevaluarse)
```

Cada archivo de soluciones vuelve a correr su ejercicio con `source()`, así que
se puede abrir solo, en una sesión limpia, sin haber corrido nada antes.

## Cómo usarlo

1. Pon tu directorio de trabajo en **la carpeta del taller**, es decir, la que
   contiene la carpeta `Datasets`. Compruébalo con `getwd()` y cámbialo con
   `setwd()`. Todos los archivos leen sus datos con rutas relativas
   (`Datasets/...`), así que funcionan igual en cualquier computadora.
2. Cualquier archivo se puede correr completo de principio a fin, por ejemplo
   con `source("3-2_objetos.r")`. Ninguno se detiene a pedir nada ni truena.
3. Las figuras y tablas que generan los scripts se escriben en la carpeta
   `salidas/`, que se crea sola y está en el `.gitignore`.

El directorio de trabajo sigue siendo la carpeta del taller **también para los
archivos de `soluciones/`**: R resuelve las rutas contra el directorio de
trabajo, no contra la ubicación del script. Si te equivocas, los archivos de
soluciones se detienen con un mensaje que te lo dice, en vez de un
`cannot open file` sin contexto. En RStudio, cuidado con
*Session > Set Working Directory > To Source File Location*.

### Estilo de los comentarios

Los comentarios que **explican** una línea van siempre *arriba* de ella, para
que al ejecutar el archivo paso a paso se lea la explicación antes de correr el
código. Los comentarios que **observan un resultado** ("estos dos números no son
iguales", "fíjate cómo desaparece la diferencia") van *debajo*, porque hablan de
algo que ya se imprimió.

### Errores a propósito

Varios archivos contienen líneas con errores **deliberados**: son parte de la
lección. Van envueltas en `try()` y marcadas con un comentario
`# Error A PROPÓSITO`, de modo que el mensaje de error se imprime pero el
archivo sigue corriendo. Los errores de *sintaxis* no se pueden rescatar con
`try()`, así que esos van comentados con una nota que explica el problema.

### Versión de R

El material está probado con **R 4.1 o más reciente**. Hay dos puntos donde el
comportamiento de R cambió y el código lo señala explícitamente:

* Desde R 4.0.0, `read.table` ya **no** convierte texto a factores. Donde la
  lección necesita factores se pide `stringsAsFactors = TRUE` a mano.
* Desde R 4.3.0, usar `&&` o `||` con vectores de más de un elemento es un
  **error** (antes tomaba en silencio el primer elemento). Ver `5-1_operadores.R`.

### Paquetes externos

Las clases mencionan `ape`, `car`, `gplots` y `RColorBrewer`. Los bloques que los
usan están dentro de un `requireNamespace(...)`, así que el archivo corre
completo aunque el paquete falte; simplemente se salta ese ejemplo.

## Conjuntos de datos

Todos están en `Datasets/`. Algunos ejercicios usaban archivos que nunca
estuvieron en este repositorio (densidad de madera, datos de Blonder et al. 2014,
coordenadas de parcelas de EUA, checklist de Nicaragua, consumo de alcohol); esos
ejercicios se reescribieron sobre los datos que sí están incluidos, conservando
el contenido estadístico original.

### Websites sobre R

<http://www.r-project.org/> Official R website 

<http://www.rseek.org/> Web searches for R related content 

<http://www.statmethods.net/> Quick R

<http://www.r-bloggers.com/> R-bloggers

[Guía de estilo de R](https://google.github.io/styleguide/Rguide.xml)

### Cursos de R

<https://www.codeschool.com/courses/try-r>

<https://www.datacamp.com/courses/free-introduction-to-r>
 
<https://campus.datacamp.com/courses/introduccion-a-r> (en español)

<https://www.coursera.org/learn/r-programming> (en cursera)

<https://www.coursera.org/learn/intro-data-science-programacion-estadistica-r> (en cursera, en español)

<http://swirlstats.com> (aprende R en R)

### Editores de texto y entornos de desarrollo integrado 
#### (integrated development environment, IDE)

#### Multiplataforma:
[RStudio](https://www.rstudio.com/) (IDE)

[Atom](https://atom.io/)

[Gedit](https://wiki.gnome.org/Apps/Gedit)

[SublimeText](https://www.sublimetext.com/)

#### Mac
[BBEdit](http://www.barebones.com/products/bbedit/)

#### Windows
[Notepad++](https://notepad-plus-plus.org/)
