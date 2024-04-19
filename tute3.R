#install.packages("tidyverse", dependencies = TRUE )
library(tidyverse)
library(ggplot2)
n = 50000

sample_n1 = rnorm(n, mean=0, sd = sqrt(1))
sample_n2 = rnorm(n, mean=1, sd = sqrt(3))
sample_n3 = rnorm(n, mean=2, sd = sqrt(1))

hist(sample_n1)
hist(sample_n2)
hist(sample_n3)

data = data.frame(sample_n1, sample_n2, sample_n3)

data = gather(data, key=distribution, value =value)

p <- ggplot(data, aes(x=value, fill=distribution))

p <- p + geom_density(alpha = 0.2)

p

dist1 = rnorm(1000000, 0, 1)
hist(dist1)

sample_prob = mean(dist1 <= 2)
true_prob = pnorm(2)

small_sample = sample(1:6, size = 20, replace=TRUE)
mean(small_sample)

big_sample = sample(1:6, size = 2000000, replace=TRUE)
mean(big_sample)

# simulate 1000 die roll outputs
die_outputs <- vector(mode = "numeric",length = 1000)
for (i in 1:1000) {
  die_outputs[i] <- mean(sample(1:6, size = 1))
}

barplot(table(die_outputs))

# There is missing argument but it doesnt matter. select the variable and run it to get the output.
mean_die_outputs <- vector(,length = 1000)
for (i in 1:1000) {
  mean_die_outputs[i] <- mean(sample(1:6, size = 30, replace = TRUE))
}

hist(mean_die_outputs)

#install.packages("MASS")
library(MASS)

?cats
hist(cats$Bwt)

ks.test(cats$Bwt,"pnorm")
