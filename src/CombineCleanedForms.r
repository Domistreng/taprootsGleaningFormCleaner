library(data.table)
library(dplyr)
library(tidyverse)
library(plotmo)

wideForm <-fread('./data/processed/WideFormCleaned.csv')
tallForm <-fread('./data/processed/TallFormCleaned.csv')

retForm <- rbind(wideForm, tallForm)

fwrite(retForm, paste('./data/processed/CompletedForm' , toString(Sys.Date()) , '.csv'))
print("Complete")