library(readr)
data<-read.csv(file.choose())
View(data)
boxplot(data$East)
boxplot(data$West)
boxplot(data$North)
boxplot(data$South)
#all the data are normal

table<-matrix(c(50,435,142,1523,131,1356,70,	750),nrow=2)
colnames(table)<-c("east","west","north","south")                 
rownames(table)<-c("males","females")
table
chisq.test(table)  
#p-value=0.6603 > 0.05 => all proportions are equal
