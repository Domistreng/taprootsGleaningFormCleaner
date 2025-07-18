library(data.table)
library(dplyr)
library(tidyverse)
library(plotmo)

wideForm <-fread('./data/raw/Gleaning Responses Sheet - Form Responses 1.csv')
View(wideForm)

items1 <- wideForm[,c(1,3,4,5,50,7,8)]
View(items1)