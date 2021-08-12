#Read and View Data
CalWT <- read.csv("F:\\excelr\\Assignment\\Simple Linear Regression\\calories_consumed.csv")
View(CalWT)

summary(CalWT)
plot(CalWT)
cor(CalWT)

attach(CalWT)

############## Simle Linear Regression Model ##############

model1 = lm(Calories.Consumed ~ Weight.gained..grams.)
summary(model1)

confint(model1, level = 0.95)
pred1 = predict(model1, interval = "predict")

sqrt(mean(model1$residuals^2)) #RMSE  #232.83

#Visualisation
library(ggplot2)

ggplot(data = CalWT, aes( x = Weight.gained..grams., 
                          y = Calories.Consumed)) + 
  geom_point(color='blue') +
  geom_line(color='red',data = CalWT, aes(x= Weight.gained..grams., y=pred1))

############## Logarithmic Model [Y ~ log(X)] ##############

model2 = lm(Calories.Consumed ~ log(Weight.gained..grams.))
summary(model2)

confint(model2, level = 0.95)
pred2 = predict(model2, interval = "predict")

sqrt(mean(model2$residuals^2)) #RMSE  #253.55

############## Exponential Model [log(Y) ~ X] ##############
model3 = lm(log(Calories.Consumed) ~ Weight.gained..grams.)
summary(model3)

confint(model3, level = 0.95)
pred3 = exp(predict(model3, interval = "confidence"))

error = Calories.Consumed - pred3
#error

sqrt(sum(error^2)/nrow(CalWT))  #RMSE  #692.51

############## Quadratic model ##############
model4 = lm (log(Calories.Consumed) ~ 
               I((Weight.gained..grams.)^2) + Weight.gained..grams.)
summary(model4)

pred4 = exp(predict(model4))

error = Calories.Consumed - pred4
#error

sqrt(sum(error^2)/nrow(CalWT))  #RMSE #240.82

#Visualisation
ggplot( data = CalWT, aes( x = I((Weight.gained..grams.)^2) + Weight.gained..grams.,
                           y = log(Calories.Consumed))) + 
  geom_point(color='blue') +
  geom_line(color='red', data = CalWT, 
            aes(x= I((Weight.gained..grams.)^2) + Weight.gained..grams., 
                y= predict(model4)))
