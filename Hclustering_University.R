input<-read.xlsx("~/Desktop/Datasets_BA 2/Universities_Clustering.xlsx",1)
mydata<- input[1:25,c(1,3:8)]
normalized_data<-scale(mydata[,2:7]) #excluding the university name columnbefore normalizing
d <- dist(normalized_data, method = "euclidean") # distance matrix
fit <- hclust(d, method="complete")
?hclust
plot(fit) # display dendrogram
plot(fit, hang=-1)
groups <- cutree(fit, k=5) # cut tree into 5 clusters

?cutree
rect.hclust(fit, k=5, border="red")
?rect.hclust

membership<-as.matrix(groups)

final <- data.frame(mydata, membership)

final1 <- final[,c(ncol(final),1:(ncol(final)-1))]

?write.xlsx

write.xlsx(final1, file="final1.xlsx")
#explore setcolorder for repositioning the columns in R
# Also install the package "data.table"
install.packages("data.table")
library(data.table)
