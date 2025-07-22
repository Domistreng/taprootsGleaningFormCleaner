library(data.table)
library(dplyr)
library(tidyverse)
library(plotmo)

wideForm <-fread('./data/raw/Gleaning (Responses) - Form Responses 1.csv')

View(wideForm)
newItems <- wideForm[,c(1, 6, 3, 9, 7, 5, 4)]
colnames(newItems) = c("Time Logged", "Source", "Name", "Quality", "Price", "Amnt", "Unit")
View(newItems)

newItems <- filter(newItems, !(is.na(Name) | Name == ""))


fwrite(newItems,'./data/processed/WideFormCleaned.csv')

print("Complete")