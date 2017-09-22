library(caret)
set.seed(123)
idx <- createDataPartition(y=iris$Species,p=0.7,list = F)
trainData <- iris[idx,]
testDate <- iris[-idx,]

# trainData <- cbind(trainData$Species,scale(trainData[-5]))
# colnames(trainData)[1] <- colnames(iris)[5]

training.data<- scale(trainData[-5])
summary(training.data)

iris.kmeans <- kmeans(training.data[,-5],centers = 3, iter.max = 1000)
iris.kmeans
iris.kmeans$centers

trainData$Cluster <- as.factor(iris.kmeans$cluster)
head(trainData)
table(trainData$Species,trainData$Cluster)

library(NbClust)
nc <- NbClust(training.data,min.nc = 2,max.nc = 15,method = 'kmeans')
nc
nc$Best.nc

par(mfrow=c(1,1))
best<-table(nc$Best.nc,nc[1,])
barplot(best,xlab = '# of cluster',ylab = 'criteria',main = 'Barplot')

library(cluster)
distance <- dist(training.data)
sk <- silhouette(iris.kmeans$cluster,distance)
plot(sk)
