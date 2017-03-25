library(dplyr)
library(tidyr)
library(Amelia)
df.titanic <- read.csv("titanic3.csv",,na.strings=c("","na"))
summary(df.titanic$embarked)
# lookup all missing values in embarked column
df.titanic[is.na(df.titanic$embarked),]
df<-df.titanic
#convert to string in order for next stage not fail
df$embarked <- lapply(df$embarked,as.character)
#update missing fields with S
df$embarked[which(is.na(df$embarked))]<- "S"
df2<-df
#check if there are any nulls left
df2.titanic[is.na(df.titanic$embarked),]

