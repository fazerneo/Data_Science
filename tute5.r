# Load library and check documentations
library(ggplot2)
?ggplot

# Check documentation of dataset
?mtcars

# check structure of the dataset
str(mtcars)

# check first 6 rows of the data
head(mtcars)

# make a simple scatter plot. The first line creates an object and second executes
ggplot(mtcars, aes(x=factor(cyl), y=mpg)) +
  geom_point()
# the x value was categorical but was taken as discrete, with factor() we convert it to categorical

# simple scatter plot with weight as x and mpg as y, color as displacement
ggplot(mtcars, aes(wt, mpg, color=disp)) +
  geom_point()

# storing aes in a variable and using that to plot the data
a <- aes(x=cyl, y=mpg)
ggplot(mtcars,a) +
  geom_point()

# choosing displacement as the size of the points of data
b <- aes(wt, mpg, size=disp)
ggplot(mtcars, b) +
  geom_point()

# mapping displacement to shape but shape cannot take a continuous variable
c <- aes(wt, mpg, shape=disp)
ggplot(mtcars, c) +
  geom_point()

# This is more informative as we can see difference in data
d <- aes(wt, mpg, shape=factor(cyl))
ggplot(mtcars, d) +
  geom_point()

# This is more informative as we can see difference in data
e <- aes(wt, mpg, color=factor(cyl))
ggplot(mtcars, e) +
  geom_point()

# The geo,_point layer is always above and as such will undo the settings inside aes
ggplot(mtcars,
       aes(wt, mpg, color = factor(cyl))
       ) + geom_point(shape=12,
                      color='red')

ggplot(mtcars,
       aes(wt, mpg, color = factor(cyl))
) + geom_point(shape='triangle',
               color='blue')

library(tidyverse)
?diamonds
str(diamonds)
head(diamonds)
view(diamonds)

#trying out geom_smooth, which makes a line through the distribution
a <- aes(carat, price)
ggplot(diamonds, a)+
  geom_point() +
  geom_smooth()

# storing the plottable object to a variable
plt_price_vs_carat <- ggplot(diamonds, a)
# storing the object and type of plot to a variable and then calling the variable
plt_price_vs_carat_point <- plt_price_vs_carat + geom_point()
plt_price_vs_carat_point

# using the previous variable for a different plot
plt_price_vs_carat_line <- plt_price_vs_carat + geom_smooth()
plt_price_vs_carat_line

p <- ggplot(diamonds, aes(carat, price, color = clarity))
p + geom_point(alpha = 0.5, shape = 14) + geom_smooth()

ggplot(mtcars, aes(factor(cyl), mpg, color = factor(am))) +
  geom_jitter(width = 0.3)

#binwidth is the width of the bars
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 5)

# storing a color hex code into a var
light_blue <- "#51A8C9"

# using density to show frequency and adding color fill
ggplot(mtcars, aes(mpg, ..density..)) +
  geom_histogram(binwidth = 5, fill = light_blue)


ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 5)

ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 5, position = 'dodge')

ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 5, position = 'fill')

ggplot(mtcars, aes(mpg, fill = factor(am))) +
  geom_histogram(binwidth = 5, position = 'identity', alpha = 0.5)

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar()

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'dodge')

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'fill')

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'identity', alpha = 0.5)

# reading documents for themes function
?theme
?theme_classic

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'dodge') +
  theme(legend.position = 'none')

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'dodge') +
  theme(legend.position = 'bottom')

ggplot(mtcars, aes(factor(cyl), fill = factor(am))) +
  geom_bar(position = 'dodge') +
  theme(legend.position = c(0.12, 0.8))

?economics
str(economics)
head(economics)

ggplot(economics, aes(date, unemploy)) +
  geom_line()

ggplot(economics, aes(date, unemploy/pop)) +
  geom_line()
