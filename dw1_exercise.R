library(dplyr)
library(tidyr)
data <- read.csv("refine_original.csv")
data$company <- tolower(data$company)
#head(data)
#data <- separate(Product.code...number, c('product_code','product_number'), sep="-")
data <- separate(data,Product.code...number, into = c("product_code", "product_number"))
data -< mutate(category, recode())

??recode
