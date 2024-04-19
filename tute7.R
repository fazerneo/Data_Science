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

?cor()

# using an argument of the correlation function to compute only for those rows that dont have missing values for both of the vars
ncbirths %>%
  summarise(N = n(),
            r = cor(weight, mage, use = "pairwise.complete.obs"))

?bdims

head(bdims)

ggplot(data = bdims,
       aes(x = hgt, y = wgt)) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

?geom_smooth()

# making a new data frame called bdims_summary
bdims_summary <- data.frame(
  N = 507,
  r = 0.7173011,
  mean_hgt = 171.1438,
  sd_hgt = 9.407205,
  mean_wgt = 69.14753,
  sd_wgt = 13.34576
)

is.data.frame(bdims_summary)

bdims_summary %>% mutate(
  slope = r * (sd_wgt/sd_hgt),
  intercept = mean_wgt - slope * mean_hgt 
)

# linear model with weight as targeted outcome and hgt as predictor. can use hgt+variable_name to add predictors
# outputs slope and intercept
mod = lm(wgt ~ hgt,
         data = bdims)

coefs = coef(mod)

summary(mod)

new <- data.frame(
  wgt = 74.8,
  hgt = 182.8
)

# using mod object to find new data weight
predict(mod, newdata = new)

x <- residuals(mod)
x

dof <- df.residual(mod)

mean(x)

RMSE <- sqrt(sum(x^2) / dof)

