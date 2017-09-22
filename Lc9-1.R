library(kohonen)
data(wines)
data <- wines
head(data)

winesdata <- scale(data)
str(winesdata)

index <- sample(1:dim(winesdata)[1],115)
trainData <- winesdata[index,]
testData <- winesdata[-index,]
# idx <- createDataPartition(winesdata$alcohol,p=.7,list = F)
# trainData <- as.list(winesdata[idx,])
# testData <- winesdata[-idx,]
# str(trainData)
# str(testData)

# set.seed(7)
# sommap <- supersom(list(measurements = scale(trainData),
#                         vintages = vintages),
#                    grid = somgrid(6, 4, "hexagonal"))
# obj.dists <- object.distances(sommap, type = "data")
# code.dists <- object.distances(sommap, type = "codes")

result <- som(trainData,grid=somgrid(5,5,'hexagonal'))
names(result)
result$unit.classif

par(mfrow=c(2,2))
result$codes
plot(result,type = 'property',property = result$codes[[1]][,1],
     main = colnames(result$codes[[1]])[1])
plot(result,type = 'property',property = result$codes[[1]][,2],
     main = colnames(result$codes[[1]])[2])
plot(result,type = 'property',property = result$codes[[1]][,3],
     main = colnames(result$codes[[1]])[3])
plot(result,type = 'property',property = result$codes[[1]][,4],
     main = colnames(result$codes[[1]])[4])
