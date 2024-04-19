# install.packages("tidyverse")
library(tidyverse)

rbinom(100, 1, 0.3)

dist1 = rbinom(100, 10, 0.3)

hist(dist1)

mean(dist1)/10

sum(dist1 == 2)
sum(dist1 == 4)

dbinom(2, 10, 0.3)
dbinom(4, 10, 0.3)

mean (dist1 == 2)
mean (dist1 == 4)

dist2 = rnorm(10000, 200, sqrt(160))
hist(dist2)

dbinom(0, 10, 0.3)+dbinom(1, 10, 0.3)+dbinom(2, 10, 0.3)
1 - pbinom(5, 10, 0.3)
