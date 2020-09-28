reports <- read.csv("F:\\excelr\\Assignment\\Hypothesis Testing\\LabTAT.csv")
View(reports)
stacked <- stack(reports)
View(stacked)
attach(stacked)

############Normality Test###########
shapiro.test(reports$`Laboratory.1`)  #p-value=0.5508 > 0.05
shapiro.test(reports$`Laboratory.2`)  #p-value=0.8637 > 0.05
shapiro.test(reports$`Laboratory.3`)  #p-value=0.4205 > 0.05
shapiro.test(reports$`Laboratory.4`)  #p-value=0.6619 > 0.05
#since p-value is high => data is normal
summary(reports)

###########Variance Test########
library(car)
leveneTest(values~ ind, data = stacked)
#p-value=0.051 => variances are equal

###########ANOVA Test#########
anova_results <- aov(values~ind, data = stacked)
summary(anova_results)
#p-value=2e-16 < 0.05 => there is difference in the average TAT 