###############################################################################
## Heatmap for Differential Gene Expression
### Author: Angel García-Campos https://github.com/AngelCampos
#### Base by wonderful: Sebastian Raschka https://github.com/rasbt
###############################################################################

###############################################################################
### A) Loading required packages "gplots" "RColorBrewer"
############################################################################### 

  library(gplots)
  library(RColorBrewer)

###############################################################################
## B) Loading data
###############################################################################

cat("Select file which contains expression matrix (tab separated)")
exprs <- read.table(file = file.choose(), sep = "\t", header = T,
                    row.names = 1)

cat("Select file which contains Differentially-Expressed genes name in first 
    column")
DE <- read.table(file = file.choose(), sep = "\t", header = T,
                 row.names = 1)

DEGmatrix <- as.matrix(exprs[row.names(DE),]) # DEG expression matrix

###############################################################################
## C) Creating Palette
###############################################################################

# creates a color palette passing from blue, green yellow to red
my_palette <- colorRampPalette(c("red", "white", "royalblue"))(n = 100)

###############################################################################
## D) Clustering Methods
###############################################################################

# If you want to change the default clustering method (complete linkage method 
# with Euclidean distance measure), this can be done as follows: For non-square 
# matrix, we can define the distance and cluster based on our matrix data by

row.distance = dist(DEGmatrix, method = "euclidean")
row.cluster = hclust(row.distance, method = "complete")

col.distance = dist(t(DEGmatrix), method = "euclidean")
col.cluster = hclust(col.distance, method = "complete")

# Arguments for the dist() function are: euclidean (default), maximum, canberra, 
# binary, minkowski, manhattan

# Arguments for hclust(): complete (default), single, average, mcquitty, 
# median, centroid, ward. 

# Note that for non-square matrices you have to define the distance and cluster 
# for both row and column dendrograms separately.
# Otherwise you will get a not so pleasant Error in:
# x[rowInd, colInd] : subscript out of bounds.

###############################################################################
## E) Plotting the Heatmap
###############################################################################

png("heatmap.png",        # Name of png file       
    width = 5 * 300,      # Easier re-scaling X*300 = Y pixels
    height = 5 * 300,     # 5 x 300 = 1500 px
    units = "px",         # px (Pixels = default), in (inches), cm or mm
    res = 300,            # 300 pixels per inch
    pointsize = 7)        # font size

heatmap.2(x = DEGmatrix,
          main = "Differential Gene Expression",  # heat map title
          density.info = "none", # turns off density plot inside color legend
          trace = "none",        # turns off trace lines inside the heat map
          margins = c(1,10),     # widens margins around plot
          col = my_palette,      # use on color palette defined earlier 
          Rowv = as.dendrogram(row.cluster), # apply selected clustering method
          Colv = as.dendrogram(col.cluster), # apply selected clustering method
          keysize = 1.2,         # size of color key
          # dendrogram = "row"   # Uncomment for only showing row dendrogram
)

## Legend for ColumnSide color labeling 
par(lend = 1)           # square line ends for the color legend
legend("topright",      # location of the legend on the heatmap plot
       legend = c("Over-expressed", "Equal-expression", "Sub-expressed"), 
       col = c("red", "white","royalblue"),  # color key
       lty= 1,          # line style
       lwd = 5          # line width
)

dev.off()               # close the PNG device