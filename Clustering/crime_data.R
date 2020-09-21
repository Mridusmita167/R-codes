crime_data <- read.csv("F:\\excelr\\Assignment\\Clustering\\crime_data.csv")
summary(crime_data)

normalize<-function(x){
  return ( (x-min(x))/(max(x)-min(x)))
}
data_normalize <- as.data.frame(lapply(crime_data[,2:5],normalize))
summary(data_normalize)
cor(data_normalize)
data_normalize <- scale(crime_data[,2:5])
summary(data_normalize)
cor(data_normalize)

d <- dist(data_normalize, method = "euclidean")
fit <- hclust(d, method="complete")
plot(fit) # display dendrogram
plot(fit, hang=-1)
clusters <- cutree(fit, k=5)  #cut tree into 5 clusters
rect.hclust(fit, k=5, border="red")

crimes <- as.matrix(clusters)
final <- data.frame(crime_data,crimes)
final_data <- final[,c(ncol(final),1:(ncol(final)-1))]
aggregate(crime_data[,2:5], by=list(final$crimes), FUN=mean)

write.csv(final_data, file="crimesf_inal.csv")

getwd()
