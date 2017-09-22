dvd <- read.csv('C:/Users/parth/Desktop/DTM/dvd.csv',header = T)
str(dvd)

library(caret)
library(arules)

# idx <- createDataPartition(y=dvd$id,p=.7,list = F)
# trainData <- dvd[idx,]
# testData <- dvd

table(dvd$id)
dvd.list <- split(dvd$Item,dvd$id)
# trans <- as(dvd.list,"transactions")
# summary(trans)
# inspect(trans)
rules<-apriori(dvd.list,parameter=list(supp=.3, conf=.7, target="rules")) 
inspect(rules)
