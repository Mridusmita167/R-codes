library(readxl)
airlines <- read_excel("F:/excelr/Assignment/Clustering~d/EastWestAirlines.xlsx", sheet = 2)
summary(airlines)

normalize<-function(x){
  return ( (x-min(x))/(max(x)-min(x)))
}
normalized_data <- as.data.frame(lapply(airlines[,2:5],normalize))
summary(normalized_data)
cor(normalized_data)
normalized_data <- scale(airlines[,2:12])
summary(normalized_data)
cor(normalized_data)

d <- dist(normalized_data, method = "euclidean" )
fit <- hclust(d, method = "complete" )
plot(fit)
plot(fit,hang =-1)
clusters <- cutree(fit, k=5)  #cut tree into 5 clusters
rect.hclust(fit, k=5, border = "red")

result <- as.matrix(clusters)
final <- data.frame(airlines, result)
final_data <- final[,c(ncol(final),1:(ncol(final)-1))]
aggregate(airlines[,2:12], by=list(final$reslt), FUN=mean)

write.csv(fianl_data, file = "airlines_final.csv")
getwd()
