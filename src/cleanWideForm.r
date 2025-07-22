library(data.table)
library(dplyr)
library(tidyverse)
library(plotmo)

wideForm <-fread('./data/raw/Gleaning Responses Sheet - Form Responses 1.csv')


newItems <- wideForm[,c(1,3,4,5,50,7,8)]
colnames(newItems) = c("Time Logged", "Source", "Name", "Weight", "Amount", "Quality", "Price")


for(i in 1: 8) {
    wideForm <-fread('./data/raw/Gleaning Responses Sheet - Form Responses 1.csv')
    currentIndices <- c(1, 3, 5+(4*i), 6+(4*i), 50 + i, 7+(4*i), 8+(4*i))
    nextItems <- wideForm[,..currentIndices]
    colnames(nextItems) = c("Time Logged", "Source", "Name", "Weight", "Amount", "Quality", "Price")
    newItems <- rbind(newItems,nextItems)
}
newItems <- filter(newItems, !(is.na(Name) | Name == ""))
itemLbs <- filter(newItems, !(is.na(Weight)))
newItems <- filter(newItems, (is.na(Weight)))

itemLbs <- itemLbs %>%
    mutate(Amount = paste0(Weight, " lbs"))

newItems <- rbind(newItems, itemLbs)

newItems$Weight = NULL



fwrite(newItems,'./data/processed/WideFormCleaned.csv')

print("Complete")