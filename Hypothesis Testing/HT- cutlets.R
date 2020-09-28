cutlets <- read.csv("F:\\excelr\\Assignment\\Hypothesis Testing\\Cutlets.csv")
attach(cutlets)

#####Normality Test######
shapiro.test(Unit.A)
#p-value = 0.32 > 0.05 => p high null fly => Unit.A is normal

shapiro.test(Unit.B)
#p-value = 0.5225 > 0.05 => p high null fly => Unit.B is normal

######Variance Test######
var.test(Unit.A , Unit.B)
#p-value = 0.3136 > 0.05 => p high null fly => equal variances

########2-saple t test#######
t.test(Unit.A,Unit.B,alternative = "two.sided",conf.level = 0.95,correct = TRUE)
# H0 => both the units have cutlets of equal diameter
# H1 => the units have cutlets of unequal diameter
# p-value = 0.4723 > 0.05 => p high null fly => both units have cutlets of equal diameter
# since all the cutlets have equal diameter there is no action needed to be taken