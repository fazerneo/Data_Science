
# import data from csv in the tute8_csvs folder with seperator as "," and header set to TRUE 
data = read.csv("tute8_csvs/Tips.csv", sep = ",", header = TRUE)

# View full data in table form
view(data)

# get working directory and set working directory
getwd()
setwd("C:/Users/35126921/Documents/Data_Science/")

# go through the details of the function
?pairs
data[2:5]

# make a scatter plot with col 2 to col 5 of the data, col 1 is just numbers of rows 
pairs(data[2:5], lower.panel = NULL)

# find correlations of the data
cor(data[2:5])

# formula for logit regression. equivalent to y ~ x where y is the outcome we are predicting and x is the predictors
formula1 = CustomerWillTip ~ Service + Food + Ambience

# building the model
LGModel <- glm(formula1, data = data, family = binomial(logit))
?glm
?binomial

# get summary of results, where coefficient is interpreted as 1 unit increase in predictor results in X increase in result
# p value below 0.05 means estimate is more trustworthy
summary(LGModel)

# the results from here shows the likeliness of customer tipping. The value is taken from service estimate from summary(LGModel)
exp(1.2819)

# Let's try then to see what happens if we remove from the model, terms that are not statistically significant (Ambience and Food):

LGModel1<-glm(CustomerWillTip ~ Service, data = data, family = binomial(logit))
summary(LGModel1)
exp(1.3715)

?predict

# Using predict function to predict using the model, type is response to get probabilistic results
LGModel1predprobabilities <- predict(LGModel1, data, type = "response")

# Finding binary predictions using round function
LGModel1pred <- round(predict(LGModel1, data, type = "response"))

# install.packages("caret")
library(caret)
?confusionMatrix

# using confusion matrix to see the accuracy of the model
confusionMatrix(
  table(
    LGModel1pred, 
    data[, "CustomerWillTip"]
    )
  , positive = "1" 
  )

# install.packages("ROCR")
library(ROCR)

# use ROC curve to assess accuracy of model. 
pred <- prediction(LGModel1predprobabilities, data[,"CustomerWillTip"])
perf <- performance(pred, "tpr", "fpr")
plot(perf, colorize = FALSE)
