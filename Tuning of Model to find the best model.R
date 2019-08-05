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

#install the e1071 package for utilizing Support Vector Machine in R

install.packages("e1071")

#loading the e1071 package in order to use Support Vector Machine

library(e1071)

#Building model

mymodel <- svm(Species~., data = iris, kernel = "sigmoid")

#Summary of the mymodel

summary(mymodel)

#plotting our model

plot(mymodel, data = iris,
     Petal.Width~Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))

#Tuning

set.seed(400)

tunemodel <- tune(svm, Species~., data = iris,
     ranges = list(epsilon = seq(0,1,0.1), cost = 2^(2:5)))

plot(tunemodel)

summary(tunemodel)

mymodel <- tunemodel$best.model

summary(mymodel)

pred <- predict(mymodel , iris)

#Find out the Confusion Matrix 

tab <- table(Predicted = pred, Actual = iris$Species)

tab

#Findout the misclassification error rate

1-sum(diag(tab))/sum(tab)

#Conclusion: Radial Based Kernel function provides best performance while Sigmoid based Kernel Function provides worst Performance





