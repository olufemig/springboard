library(dplyr)
library(tidyr)
df.titanic <- read.csv("titanic_original.csv",na.strings=c("","na"))
summary(df.titanic$embarked)
# lookup all missing values in embarked column
df.titanic[is.na(df.titanic$embarked),]
df<-df.titanic
#convert to string in order for next stage not fail
df$embarked <- lapply(df$embarked,as.character)
#update missing fields with S
df$embarked[which(is.na(df$embarked))]<- "S"
df.final<-df
#check if there are any nulls left
df.final[is.na(df.titanic$embarked),]

#age

#check if age has nulls
df.final[is.na(df.final$age),]
#input calculated mean into nulls
df.final$age[which(is.na(df.final$age))] <- mean(df.final$age,na.rm = TRUE)
#check if there are any nulls left behind
df.final[is.na(df.final$age),]

#lifeboat nulls

#search for boat nulls
df.final[is.na(df.titanic$boat),]
df3<-df.final
#convert boat variable to chr
df3$boat <- lapply(df3$boat,as.character)
#update missing fields with NA
df3$boat[which(is.na(df3$boat))]<- "NA"
#check if there are any nulls left
df3[is.na(df3$boat),]


#cabin

df3$cabin <-lapply(df3$cabin, as.character)
df3$has_cabin_number <- ifelse(df3$cabin == "NA", 0, 1)
df.cabin<-df3
df.cabin$has_cabin_number[which(is.na(df.cabin$has_cabin_number))] <- 0
str(df.cabin)
#export to csv
df.cabin = data.frame(df.cabin)
head(df.cabin)
str(df.cabin)
#convert back to factors to avoid list error when spooling to csv
df.cabin$boat <- lapply(df.cabin$boat,as.character)
df.cabin$cabin <- lapply(df.cabin$cabin,as.character)
write.csv(df.cabin,"titanic_clean.csv",row.names = FALSE)
