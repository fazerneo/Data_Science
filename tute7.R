# correlation analysis checks for direct or inverse relation between two continuous variables
# Eg: checking for correlation between age and height. between -1 and 1 in increasing correlation
# regression analysis uses multiple predictors and seeks to find a variable that is effected by the predictors
# Eg: Age, sec, education may be predictors for household income 

# install.packages("tidyverse")
# install.packages('openintro')
library(openintro)
library(tidyverse)

head(ncbirths)

aes1 <- aes(weeks, weight)

obj1 <- ggplot(ncbirths, aes1)

obj1 + geom_point()

?cut()

# using cut function to break weeks into 6 intervals by using 5 breaks 
aes2 <- aes(cut(weeks, 5), weight)

obj2 <- ggplot(ncbirths, aes2)

obj2  + geom_boxplot()

ncbirths$mage

# using correlation function to find correlation between two variables
cor(ncbirths$weight, ncbirths$mage)

# Here we summarize using n() functions that gives the number of observations and correlation function
# N and r are just placeholders or name of the var header
ncbirths %>%
  summarise(N = n(),
            r = cor(weight, mage))


