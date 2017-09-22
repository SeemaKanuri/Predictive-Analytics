crime <- read.csv('C:/Users/parth/Desktop/DTM/crime1.csv',header = T)
str(crime)
x <- crime[,3:4]
x

dx <- round(dist(x),digits = 1)
dx

# Hiererchial clustering - Single
hc1 <- hclust(dx,method = 'single')
plot(hc1,main = 'Single Linkage')

# Hiererchial clustering - Complete
hc2 <- hclust(dx,method = 'complete')
plot(hc2,main = 'Complete Linkage')

# Hiererchial clustering - Average
hc3 <- hclust(dx,method = 'average')
plot(hc3,main = 'Average Linkage')

# Hiererchial clustering - Ward
hc4 <- hclust(dx,method = 'ward.D')
plot(hc4,main = 'Ward Linkage')

#SCatter Plot
cl.num <- 2 # Number of clusters
colnames(x) <- c('Murder','rape')

hc1.result <- cutree(hc1,k=cl.num)
hc1.result

plot(x,pch=hc1.result)
text(x,labels = crime$city)