library(readr)
fantaloons<-read.csv(file.choose())
View(fantaloons)
attach(fantaloons)
tab<-table(fantaloons $Weekdays, fantaloons $Weekend)
tab

#Ho: The Proportion of Male Vs Female are equal during weekdays and Weekends
#Ha: The Proportion of Male Vs Female are not equal during weekdays and Weekends

prop.test(x=c(66,167),n=c(233,167),conf.level = 0.95,correct = FALSE,alternative = "two.sided")
#p-value < 2.2e-16
prop.test (x=c(66,167),n=c(233,167), conf.level = 0.95,correct = FALSE,alternative = "less")
#p-value < 2.2e-16
#p-value < 0.05 => reject null hypothesis 

#Ho: The Proportion of Male Vs Female during weekdays <Proportion of Male Vs Female during Weekends
#Ha: The Proportion of Male Vs Female during weekdays >Proportion of Male Vs Female during Weekends
prop.test (x=c(66,167),n=c(233,167),conf.level = 0.95,correct = FALSE,alternative = "greater")
#p-value = 1 > 0.05 => accept null hypothesis
#so Proportion of Male Vs Female during weekdays <Proportion of Male Vs Female during Weekends