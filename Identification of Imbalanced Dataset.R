#Identification of Imbalanced Data using Iris Dataset

#Downloading the iris data

data("iris")

#Viewing the iris data

str(iris)

#installing the ggplot2 to find the scatter plot

install.packages("ggplot2")

#loading the ggplot2

library(ggplot2)

#viewing the scatter plot between petal.length and petal.width

qplot(Petal.Length, Petal.Width, data = iris, color = Species)

