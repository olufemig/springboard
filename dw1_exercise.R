library(dplyr)
library(tidyr)
#car package is needed for the recode function
library(car)
#load the data
data <- read.csv("refine_original.csv")
#lowercase all the company data before we separate
data$company <- tolower(data$company)
#head(data)
# split the product code variable
data <- separate(data,Product.code...number, into = c("product_code", "product_number"))
#use the recode function to decode the category codes
data$category <- recode(data$product_code,"'p'='smartphone';'v'='TV';'x'='Laptop';'q'='Tablet'")
#convert the factors to chr before we can concatenate
data$address <- as.character(data$address)
data$city <- as.character(data$city)
data$country <- as.character(data$country)
#use the paste function
data$full_address <- paste(data$address,data$city,data$country, sep = ",")
#create 4 new dummy company variables
data$company_philips <- recode(data$company,"'philips'= 1; else = 0")
data$company_akso <- recode(data$company,"'akso'= 1; else = 0")
data$company_van_houten <- recode(data$company,"'van_houten'= 1; else = 0")
data$company_unilever <- recode(data$company,"'unilever'= 1; else = 0")
# create 4 new category dummy variables
data$category_smartphone <- recode(data$category,"'smartphone'= 1; else = 0")
data$category_tv <- recode(data$category,"'tv'= 1; else = 0")
data$category_laptop <- recode(data$category,"'laptop'= 1; else = 0")
data$category_tablet <- recode(data$category,"'tablet'= 1; else = 0")






