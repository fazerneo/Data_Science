# calling library tidyverse
library(tidyverse)

# loading built in data-set cars using the data function
data("cars")

# viewing do# viewing do# viewing documentation about cars. Gives insights about the dataset
?cars

# using view function to check the dataset in tabular form. can use other methods like head or just typing dataset name
view(cars)

# storing speed from cars data set into a variable
carspeed = cars$speed

# our null hypothesis is that the distribution is normal. Alternative hypothesis is that it is not normal.
# building a histogram using the previously built variable with the x being speed. Seeing if the histogram looks normal
hist(carspeed, xlab = "speed")

# using ks.test to test carspeed data for normality against pnorm( which is the function for normal distributions)
# if output p-value is lower than 0.5 then it means the distribution is not normal so null hypothesis is rejected.
ks.test(carspeed, "pnorm")

cardist = cars$dist
hist(cardist, xlab = "dist")
ks.test(cardist, "pnorm")

# below are some other ways of doing it. similar but bit different styles
data("storms")
?storms
storms

hist(storms$pressure, xlab = "pressure")
ks.test(storms$pressure, "pnorm")

wind = storms$wind
hist(wind)
ks.test(wind, "pnorm")

data("us_rent_income")
?us_rent_income
head(us_rent_income)
variable = us_rent_income$estimate

hist(variable)
ks.test(variable, "pnorm")
