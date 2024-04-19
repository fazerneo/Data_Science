# install.packages("fivethirtyeightdata", repos =
#                  'https://fivethirtyeightdata.github.io/drat/', type = 'source')

library(fivethirtyeight)
library(tidyverse)

head(biopics, 10)
?biopics

?is.na()
?colSums()

biopics %>% is.na()

biopics %>%
  is.na() %>%
  colSums() # Counts the number of true in a column

?lm
?~
  
# In r scripts, you dont have to specifically say data = biopics,
# if it is data place in arguments and only biopics is typed, r will interpret correctly 
model_1 <- lm(box_office ~ country + year_release, 
              data = biopics)

model_1$fitted.values

median(
  abs(biopics$box_office - model_1$fitted.values),
  na.rm = TRUE)

install.packages("VIM")
library(VIM)

head(tao, 3)

tao %>% 
  is.na() %>%
  colSums()

tao %>% group_by(Year) %>% summarise (
  is.na(Air.Temp) %>% sum()
)

tao_imp <- tao %>%
  mutate(Air.Temp_imp = ifelse(
    is.na(Air.Temp),
    TRUE,
    FALSE)) %>%
  mutate(Air.Temp = ifelse(
    is.na(Air.Temp),
    mean(Air.Temp, na.rm = TRUE),
    Air.Temp))

head(tao)
head(tao_imp$Air.Temp)

tao_imp %>%
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>%
  marginplot(delimiter = "imp")

tao_imp <- hotdeck(tao, variable = "Air.Temp")

tao_imp %>% is.na %>% colSums

tao_imp %>%
  select(Air.Temp, Sea.Surface.Temp, Air.Temp_imp) %>%
  marginplot(delimiter = "imp")

head(tao_imp$Air.Temp)

tao %>%
  group_by(Year) %>%
  summarise(average_air_temp =
              mean(Air.Temp, na.rm = TRUE))

tao_imp <- hotdeck(tao,
                   variable = "Air.Temp",
                   domain_var = "Year")

tao_imp <- hotdeck(tao,
                   variable = "Air.Temp",
                   ord_var = "Sea.Surface.Temp")
