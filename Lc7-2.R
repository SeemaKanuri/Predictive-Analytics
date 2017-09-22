crime <- read.csv('C:/Users/parth/Desktop/DTM/crime2.csv',header = T)
str(crime)
x <- crime[,3:4]
x

dx <- round(dist(x),digits = 1)
dx

# Hiererchial clustering - Average
hc1 <- hclust(dx,method = 'average')
plot(hc1,main = 'Average Linkage')

#SCatter Plot
cl.num <- 4 # Number of clusters
colnames(x) <- colnames(crime)[3:4]

hc1.result <- cutree(hc1,k=cl.num)
hc1.result

plot(x,pch=hc1.result)
text(x,labels = crime$City)