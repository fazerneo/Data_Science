library(datasets)
data()
data(mtcars)
?mtcars

str(mtcars)

nrow(mtcars)
ncol(mtcars)

head(mtcars, 7)
tail(mtcars, 7)

data(iris)
?iris

i = iris$Sepal.Length

hist(i, xlab = "Sepal Length", main = "Histogram of Frequency of Sepal Length", col = blues9)
