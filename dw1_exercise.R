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

