# Installing Library scatterplot3d untuk membuat scatter plot 3 dimensi
library("scatterplot3d")

# 3D R scatterplot
library(scatterplot3d)
set.seed(2)
x <- rnorm(1000)
y <- rnorm(1000)
z <- rnorm(1000)

scatterplot3d(x, y, z, pch = 19, color = "blue")

# install.packages("rgl")
library(rgl)

plot3d(x, y, z,      # Data
       type = "s",   # Type of the plot
       radius = 0.1, # Radius of the observations
       col = "lightblue",   # Color of the observations
       xlab ="X axis lab",  # Label of the X axis
       ylab = "Y axis lab", # Label of the Y axis
       zlab = "Z axis lab") # Label of the Z axis


# Menggunakan Data Iris yang ada di Library RStudio
data(iris)
head(iris)
View(iris)
dim(iris)

# Basic 3d graphics
scatterplot3d(iris[,1:3])

# Change the angle of point view
scatterplot3d(iris[,1:3], angle = 55)

# Change the main title and axis labels
scatterplot3d(iris[,1:3],
              main="3D Scatter Plot",
              xlab = "Sepal Length (cm)",
              ylab = "Sepal Width (cm)",
              zlab = "Petal Length (cm)")

# Change the shape and the color of points
scatterplot3d(iris[,1:3], pch = 16, color="steelblue")

# Change point shapes by groups
shapes = c(16, 17, 18) 
shapes <- shapes[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = shapes)

# Change point colors by groups
colors <- c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(iris$Species)]
scatterplot3d(iris[,1:3], pch = 16, color=colors)

#Remove the box around the plot
scatterplot3d(iris[,1:3], pch = 16, color = colors,
              grid=TRUE, box=FALSE)

# Add grids on the different factes of scatterplot3d graphics:
# 1. Source the function
source('http://www.sthda.com/sthda/RDoc/functions/addgrids3d.r')
# 2. 3D scatter plot
scatterplot3d(iris[, 1:3], pch = 16, color = colors, grid=FALSE, box=FALSE)
# 3. Add grids
addgrids3d(iris[, 1:3], grid = c("xy", "xz", "yz"))

# Add bars
scatterplot3d(iris[,1:3], pch = 16, type="h", 
              color=colors)

# Add legends
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend(s3d$xyz.convert(7.5, 3, 4.5), legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# Specify the legend position using keywords
# "right" position
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("right", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# Use the argument inset
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("right", legend = levels(iris$Species),
       col = c("#999999", "#E69F00", "#56B4E9"), pch = 16, inset = 0.1)

# "bottom" position
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("bottom", legend = levels(iris$Species),
       col = c("#999999", "#E69F00", "#56B4E9"), pch = 16)

# Customize the legend position
# Custom point shapes
s3d <- scatterplot3d(iris[,1:3], pch = shapes)
legend("bottom", legend = levels(iris$Species),
       pch = c(16, 17, 18), 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

# Custom colors
s3d <- scatterplot3d(iris[,1:3], pch = 16, color=colors)
legend("bottom", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), pch = 16, 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

# Custom shapes/colors
s3d <- scatterplot3d(iris[,1:3], pch = shapes, color=colors)
legend("bottom", legend = levels(iris$Species),
       col =  c("#999999", "#E69F00", "#56B4E9"), 
       pch = c(16, 17, 18), 
       inset = -0.25, xpd = TRUE, horiz = TRUE)

# Add point labels
scatterplot3d(iris[,1:3], pch = 16, color=colors)
text(s3d$xyz.convert(iris[, 1:3]), labels = rownames(iris),
     cex= 0.7, col = "steelblue")

# Add regression plane and supplementary points
data(trees)
head(trees)

# 3D scatter plot with the regression plane:
# 3D scatter plot
s3d <- scatterplot3d(trees, type = "h", color = "blue",
                     angle=55, pch = 16)
# Add regression plane
my.lm <- lm(trees$Volume ~ trees$Girth + trees$Height)
s3d$plane3d(my.lm)
# Add supplementary points
s3d$points3d(seq(10, 20, 2), seq(85, 60, -5), seq(60, 10, -10),
             col = "red", type = "h", pch = 8)

