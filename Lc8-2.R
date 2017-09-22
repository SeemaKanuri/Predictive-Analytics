library(caret)
set.seed(123)
air <- read.csv('C:/Users/parth/Desktop/DTM/air.csv',header = T)
# idx <- createDataPartition(y=air$Species,p=0.7,list = F)
# trainData <- air[idx,]
# testDate <- air[-idx,]

# trainData <- cbind(trainData$Species,scale(trainData[-5]))
# colnames(trainData)[1] <- colnames(air)[5]

# training.data<- scale(trainData[-5])
# summary(training.data)

air.kmeans <- kmeans(air,centers = 3, iter.max = 1000)
air.kmeans
air.kmeans$centers

air$Cluster <- as.factor(air.kmeans$cluster)
head(air)
#table(trainData$Species,trainData$Cluster)

library(NbClust)
nc <- NbClust(air,min.nc = 2,max.nc = 15,method = 'kmeans')
nc
nc$Best.nc

par(mfrow=c(1,1))
best<-table(nc$Best.nc,nc[1,])
barplot(best,xlab = '# of cluster',ylab = 'criteria',main = 'Barplot')