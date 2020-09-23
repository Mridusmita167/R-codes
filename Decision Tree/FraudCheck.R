# Reading and Viewing Data

data <- read.csv("F:/excelr/Assignment/Decision Tree~d/Fraud_check.csv")
View(data)
colnames(data)
str(data)

# Categorising Data as Risky or Good

Risk <- ifelse(data$Taxable.Income <= 30000, "Good", "Risky")
FraudCheck <- data.frame(data[-3], Risk)
View(FraudCheck)

# Splitting Data into Train and Test Components

train <- FraudCheck[1:420,]
test <- FraudCheck[421:600,]

# Building model with C5.0
library(C50)
tree = C5.0(train[,-6], train$Risk)
plot(tree)

pred <- predict(tree, newdata = test)
mean(pred == test$Risk) # Accuracy = 85%

# Cross Table

library(gmodels)
CrossTable(test$Risk, pred)
