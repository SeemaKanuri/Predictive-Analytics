# Create the Data Frame
cust <- data.frame(id = c(1,2,3,4,5,6),
                   gender = c('Female','Male','Female','Female','Male','Female'),
                   Age = c(23,28,42,34,45,36),
                   Child_prd_yn = c('NO','NO','NO', 'YES', 'NO', 'YES'),
                   Mobile_App_Use = c('Yes','Yes','No','Yes','No','Yes'),
                   Re_Order = c('YES','NO','NO', 'YES', 'NO', 'YES')
                   )

# Convert Continious Age to Discrete age_ds
cust$age_ds <- cust$Age
cust <- within(cust,{
               age_ds[Age<=29] = 'age-20'
               age_ds[Age>29 & Age<=39] = 'age-30'
               age_ds[Age>39]='age-40'
               age_ds=as.factor(age_ds)})

#Drop Age and id and print cust
cust$Age <- NULL
cust$id <- NULL
cust

# Convert Categorical Variable to Binary and print the new data frame cust.new
library(dummies)
cust.new <- data.frame(dummy.data.frame(cust,sep="."))
cust.new <- data.frame(lapply(cust.new,factor))
cust.new

# Find support, confidence and lift
library(arules)
rules<-apriori(cust.new,parameter=list(supp=.6, conf=.7)) 
inspect(rules)
