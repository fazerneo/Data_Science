# install.packages("gapminder")
# Load gapminder dataset, which is a dataset about GDP
library(gapminder)
library(dplyr)
?gapminder
g = gapminder
head(gapminder)
# Gives a glimpse of the dataset
glimpse(gapminder)
# Shows the structure of the dataset
str(gapminder)
# tibble is a key value pair type of dataset

# selecting columns from a dataset
select(gapminder, c(country, continent, year, lifeExp))

# same as above, %>% is pipe in R
gapminder %>%
  select(country, continent, year, lifeExp)

# same as above but using ends_with to select columns with p as the ending character
a <- gapminder %>%
  select(country, continent, ends_with("p"))
head(a)

# filtering data using the year as filter parameter
b <- gapminder %>%
  filter(year %in% c(1997, 2007, 2002))
b

# using or operator to filter same as above
c <- gapminder %>%
  filter(year == 1997 | year == 2007 | year == 2002)
c

filter(gapminder, gapminder$country %in% c("Australia", "New Zealand")
       & gapminder$year %in% c(2002, 2007))

con <- gapminder$country
a <- c("Australia", "New Zealand")
y <- gapminder$year
n <- c(2002, 2007)

filter(gapminder, con %in% a & y %in% n)

filter(gapminder, con %in% a & !y %in% n)

# sort in descending order
g = gapminder %>% arrange(desc(pop))

# First filter and then arrange in ascending order
gapminder %>% 
  filter(year == 2007) %>%
  arrange(pop)

# use mutate to change life Exp into months
g = gapminder %>% mutate(lifeExp = lifeExp * 12)
# rather than changing the values in the column, this makes a new column to the right with new values
g = gapminder %>% mutate(lifeExpMonths = lifeExp * 12)

# selecting the country with the highest life expectancy
g <- gapminder %>%
  # mutating the column
  mutate(lifeExpMonths = lifeExp * 12) %>%
  # filtering by year
  filter(year == 2007) %>%
  # arranggin in descending order
  arrange(desc(lifeExpMonths))

# showing row 1, column 1 item of variable g
g[1,1]
# showing row 1 and column 1 and 2 items
g[1, c(1,2)]
# showing row 1 and column country and continent
g[1,c("country", "continent")]
# showing row 1 to 3 and column 1 to 3  
g[c(1:3), c(1:3)]

#summarizing median of lifeExp
gapminder %>%
  summarize(medianLifeExp = median(lifeExp))

# filtering for the year 2007 and summarizing the median of lifeExp
gapminder %>%
  filter(year == 2007) %>%
  summarize(median(lifeExp))

# summarizing median life Exp and max function for gdpPercap for the year 1957
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# using group_by function to group data using country and then summarizing and arranging
gapminder %>%
  group_by(country) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap)) %>%
  arrange(desc(maxGdpPercap))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(median(lifeExp),
            max(gdpPercap))

g = gapminder %>%
  group_by(continent, year) %>%
  summarize(median(lifeExp),
            max(gdpPercap))

# using count function to count number of data instances
count(gapminder, continent)
count(gapminder, country)
count(gapminder, continent, wt = pop)


gapminder %>%
  filter(year == 1952) %>%
  count(continent, wt = pop, sort = TRUE)

# using top_n function to filter gapminder data's top 5 instances of population
top_n(gapminder, 5, pop)

# use -2 for example to show lowest 2 insatnces
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  top_n(-2, pop) %>%
  arrange(desc(continent))

g <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  top_n(2, gdpPercap) %>%
  arrange(desc(continent))

g[c("country", "continent", "gdpPercap")]
