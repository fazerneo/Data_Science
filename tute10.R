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

fit <- cutree(hc, k = 4)

fit

table(fit)

plot(hc, hang = -1)


rect.hclust(hc, k = 4, border = "red")
abline(h = 0.96, col = "blue")

data3 <- data.frame(data2, sex=x)
str(data3)

hc = hclust(
  dist(data3,
       method="euclidean"),
  method = "ward.D2"
)

hc

plot(hc,
     hang = -0.1,
     cex = 0.6)

fit <- cutree(hc, k = 4)

fit

table(fit)

plot(hc, hang = -1)


rect.hclust(hc, k = 3, border = "red")
abline(h = 5.5, col = "blue")
