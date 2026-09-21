################################################################################
### R BASICS WORKSHOP                                                        ###
### EXTRA: Heatmap para expresión diferencial                                ###
###                                                                          ###
### Métodos de biología computacional                                        ###
### Facultad de Ciencias, UNAM                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                         ###
################################################################################
### Autor original: Ángel García-Campos https://github.com/AngelCampos
### Basado en el trabajo de Sebastian Raschka https://github.com/rasbt
################################################################################

## DIRECTORIO DE TRABAJO:
## Este script lee un archivo de la carpeta "Datasets". Tu directorio de trabajo
## debe ser la carpeta del taller (la que contiene "Datasets").

################################################################################
### A) Paquetes necesarios: "gplots" y "RColorBrewer"
################################################################################

# Para instalarlos (solo hace falta una vez):
# install.packages(c("gplots", "RColorBrewer"))

# Todo el script corre dentro de este 'if' para que el archivo pueda ejecutarse
# completo aunque falten los paquetes:
if (!requireNamespace("gplots", quietly = TRUE)) {

  message("El paquete 'gplots' no está instalado; se omite el heatmap.")

} else {

  library(gplots)
  library(RColorBrewer)

################################################################################
## B) Datos
################################################################################

  # Matriz de expresión: genes en las filas, muestras en las columnas.
  exprs <- read.table(file = "Datasets/Example_expression_set.txt", sep = "\t",
                      header = TRUE, row.names = 1)

  dim(exprs)

  # En un análisis real, aquí se leería la lista de genes diferencialmente
  # expresados producida por limma, DESeq2, edgeR, etc.:
  #   DE <- read.table(file = "mis_genes_DE.txt", sep = "\t", header = TRUE,
  #                    row.names = 1)
  #   DEGmatrix <- as.matrix(exprs[rownames(DE), ])
  #
  # Para que este ejemplo corra solo, usamos como sustituto los 40 genes con
  # mayor varianza entre muestras:
  varianzas <- apply(exprs, 1, var)
  genes.top <- names(sort(varianzas, decreasing = TRUE))[1:40]

  DEGmatrix <- as.matrix(exprs[genes.top, ])
  dim(DEGmatrix)

################################################################################
## C) Paleta de colores
################################################################################

  # Una paleta que va de azul, pasando por blanco, hasta rojo
  my_palette <- colorRampPalette(c("royalblue", "white", "red"))(n = 100)

################################################################################
## D) Métodos de agrupamiento (clustering)
################################################################################

  # Para cambiar el método por defecto (ligamiento completo con distancia
  # euclidiana) se definen por separado la distancia y el agrupamiento. En una
  # matriz que no es cuadrada hay que hacerlo para filas y columnas por
  # separado, o se obtiene el error "subscript out of bounds".

  row.distance <- dist(DEGmatrix, method = "euclidean")
  row.cluster  <- hclust(row.distance, method = "complete")

  col.distance <- dist(t(DEGmatrix), method = "euclidean")
  col.cluster  <- hclust(col.distance, method = "complete")

  # Opciones de 'dist':  euclidean (por defecto), maximum, canberra, binary,
  #                      minkowski, manhattan
  # Opciones de 'hclust': complete (por defecto), single, average, mcquitty,
  #                       median, centroid, ward.D2

################################################################################
## E) La figura
################################################################################

  dir.create("salidas", showWarnings = FALSE)

  png("salidas/heatmap.png",  # Nombre del archivo
      width  = 7 * 300,       # 7 x 300 = 2100 px
      height = 7 * 300,
      units = "px",           # px (por defecto), in, cm o mm
      res = 300,              # puntos por pulgada
      pointsize = 7)          # tamaño de letra

  heatmap.2(x = DEGmatrix,
            main = "Expresión diferencial",
            density.info = "none", # quita la densidad dentro de la leyenda
            trace = "none",        # quita las líneas de traza
            margins = c(8, 8),     # márgenes alrededor de la figura
            col = my_palette,
            Rowv = as.dendrogram(row.cluster),
            Colv = as.dendrogram(col.cluster),
            keysize = 1.2,
            cexRow = 0.6,
            cexCol = 0.5
            # dendrogram = "row"   # Descomenta para mostrar solo el de filas
  )

  dev.off() # Cierra el dispositivo PNG

  list.files("salidas/")

}
