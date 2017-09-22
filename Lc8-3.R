library(fclust)
df <- data.frame(X1=c(-1,-2,1,3),X2 = c(-2,-1,3,2))
m <- matrix(c(0.2,.8,.2,.8,.8,.2,.8,.2),nrow = 4, ncol = 2)
fl <- FKM(X = df, k = 2, m = 2,stand = m, RS = 2)
fl
plot(fl)