library(data.table)
library(dplyr)
library(tidyverse)
library(plotmo)

wideForm <-fread('./data/raw/Gleaning (Responses) - Form Responses 1.csv')


newItems <- wideForm[,c(1, 6, 3, 9, 7, 5, 4)]
colnames(newItems) = c("Time Logged", "Source", "Name", "Quality", "Price", "Amnt", "Unit")


newItems <- newItems %>%
    filter(!(is.na(Name) | Name == "")) %>%
    mutate(Amount = paste0(Amnt, " ", Unit))

newItems$Amnt = NULL
newItems$Unit = NULL

fwrite(newItems,'./data/processed/TallFormCleaned.csv')
print("Complete")