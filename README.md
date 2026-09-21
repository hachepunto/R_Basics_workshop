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

## Material de referencia

### Hojas de referencia incluidas

**[`cheatsheet_eng_30mar2015.pdf`](cheatsheet_eng_30mar2015.pdf)** — 3 páginas de
base R: funciones y argumentos, clases de objetos, indexado, control de flujo,
gráficos y estadística. Es la hoja del curso original de Tello y Jiménez, y sigue
el mismo orden y vocabulario que las clases 2, 3 y 6 de este taller, por lo que
encaja mejor que una hoja genérica.

A pesar de la fecha, nada de lo que dice quedó obsoleto: no habla de
`stringsAsFactors`, y su sección de operadores documenta solo `&` y `|`
(elemento a elemento), así que los dos cambios de R que sí afectan a este
material (ver *Versión de R*) no la contradicen. Lo que **no** trae es lo
posterior a R 4.1: el pipe nativo `|>` y las lambdas `\(x)`. Tampoco se enseñan
en este curso, así que van a la par.

Ojo: el PDF conserva el encabezado y los datos de contacto del curso original
(`rbasicsworkshop.weebly.com`), no los de este.

**[`colorPaletteCheatsheet.pdf`](colorPaletteCheatsheet.pdf)** — 5 páginas sobre
color en R, con muestras impresas de las paletas: notación hexadecimal,
`col2rgb`, el modelo HSV y las paletas de RColorBrewer (`brewer.pal`). Útil de la
clase 7-1 en adelante. Tampoco envejece: las paletas son las mismas.

**[`1-1_introduccion.pdf`](1-1_introduccion.pdf)** — las diapositivas de la
primera sesión.

### Sitios de consulta

<https://www.r-project.org/> — sitio oficial de R

<https://rseek.org/> — buscador especializado en R (filtra el ruido que mete
Google cuando buscas una letra sola)

<https://www.statmethods.net/> — Quick-R, referencia rápida por tema

<https://www.r-bloggers.com/> — agregador de blogs sobre R

<https://stackoverflow.com/questions/tagged/r> — casi cualquier error que veas
ya se lo encontró alguien más

### Libros libres

<https://r4ds.hadley.nz/> — *R for Data Science*, la continuación natural de
este taller (hay [traducción al español](https://es.r4ds.hadley.nz/))

<https://adv-r.hadley.nz/> — *Advanced R*, para cuando quieras entender cómo
funciona R por dentro

### Guías de estilo

Escribir código que otra persona pueda leer es parte del trabajo. Las dos guías
de referencia:

[Guía de estilo de tidyverse](https://style.tidyverse.org/) — la más usada hoy

[Guía de estilo de R de Google](https://google.github.io/styleguide/Rguide.html) —
una variante de la anterior, con algunas diferencias

### Cursos de R

<https://swirlstats.com> — aprende R dentro de R; se instala como un paquete y
da lecciones interactivas en la consola. Muy buena opción después de este taller.

<https://www.coursera.org/learn/r-programming> — R Programming (Johns Hopkins)

<https://www.coursera.org/learn/intro-data-science-programacion-estadistica-r> —
en español

<https://www.datacamp.com/courses/free-introduction-to-r> — introducción gratuita

### Editores y entornos de desarrollo (IDE)

**Para empezar: [RStudio](https://posit.co/products/open-source/rstudio/).** Es
lo que usa casi todo el mundo y lo que se asume en este taller cuando se habla
de menús. Trae editor, consola, gráficos, ayuda y manejo de directorio de
trabajo en una sola ventana. (La empresa que lo hace ahora se llama Posit; el
programa sigue llamándose RStudio y es gratuito.)

**Si ya te mueves bien en la terminal**, hay alternativas que valen la pena:

[VS Code](https://code.visualstudio.com/) con la extensión
[vscode-R](https://github.com/REditorSupport/vscode-R) — editor de propósito
general con soporte de R: ejecución por línea, ayuda, visor de objetos y de
gráficos. Conviene si ya lo usas para otros lenguajes y no quieres cambiar de
programa según el proyecto.

[radian](https://github.com/randy3k/radian) — **no es un editor sino una consola
de R**, en reemplazo de la que trae R por omisión. Agrega resaltado de sintaxis,
edición multilínea, autocompletado y un historial decente. Se instala con
`pip install radian` y se lanza escribiendo `radian`. Combina bien con VS Code,
que puede usarla como terminal de R.

Nota: su autor anunció que ya no le agregará funciones nuevas (sigue arreglando
errores). Funciona perfectamente y es la opción madura; si te interesa algo en
desarrollo activo, él mismo sugiere [arf](https://github.com/eitsupi/arf), una
consola equivalente escrita en Rust, aún marcada como inestable.

[Positron](https://positron.posit.co/) — el IDE nuevo de Posit, construido sobre
VS Code y pensado para trabajar con R y Python a la vez. Todavía es joven: vale
la pena tenerlo en el radar, pero para este curso quédate con RStudio.

**Editores de texto de propósito general.** No sustituyen a un IDE para trabajar
en R, pero sirven para abrir un script rápido, revisar un archivo de datos
enorme o escribir código sin arrancar todo RStudio. Todos los siguientes son
gratuitos y de código abierto:

[Zed](https://zed.dev/) — multiplataforma, muy rápido, con extensión de R para
resaltado de sintaxis. El más moderno de esta lista.

[CotEditor](https://coteditor.com/) — Mac, ligero y nativo. Está en la App Store.

[Notepad++](https://notepad-plus-plus.org/) — Windows, el clásico.

[gedit](https://gedit-text-editor.org/) — multiplataforma, sencillo.

Dos que quizá conozcas y conviene aclarar: [Sublime
Text](https://www.sublimetext.com/) es excelente pero **de paga** (la evaluación
no caduca, pero la licencia cuesta); y [BBEdit](https://www.barebones.com/products/bbedit/)
(Mac) tiene un modo gratuito permanente y sin molestias, aunque con menos
funciones que la versión con licencia.
