# install.packages("modeldata")
library(modeldata)
data(mlc_churn)

?mlc_churn

head(mlc_churn)

!names(mlc_churn) %in% c("state", "area_code", "account_length")

mlc_churn = 
  mlc_churn[,
            ! names(mlc_churn) %in%
              c("state", "area_code", "account_length")]

head(mlc_churn)
?c

set.seed(123)
ind = sample(2, nrow(mlc_churn), 
             replace = TRUE,
             prob=c(0.7, 0.3))

trainset = mlc_churn[ind == 1,]
testset = mlc_churn[ind == 2,]
head(trainset)
head(testset)

dim(trainset)
dim(testset)

library(e1071)

model = svm(churn~., # here churn is the outcome we are predicting and . means all variables are predictors
            data = trainset,
            kernel = 'radial',
            cost = 1,
            gamma = 1/col(trainset))

summary(model)
svm.pred = predict(model, testset[, !names(testset)
                                  %in% c("churn")])

svm.table = table(svm.pred, 
                  testset$churn)

library(caret)

confusionMatrix(svm.table)
