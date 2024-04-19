library(datasets)
data("WorldPhones")
?WorldPhones
summary(WorldPhones)
scatter.smooth(WorldPhones, xlab = "region", main = "Number of phones in the world", col = blues9)
