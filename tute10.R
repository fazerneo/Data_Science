data = read.csv("customer.csv", header=TRUE)
head(data)
str(data)

x <- factor(data$Sex)
str(x)
data$Sex <- x
str(data)

data2 = scale(
  data[, -c(1, 4)]
)

head(data2)

hc = hclust(
  dist(data2,
       method="euclidean"),
  method = "single"
)

hc

plot(hc,
     hang = -0.1,
     cex = 0.6)
