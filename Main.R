install.packages("rlang")
install.packages("tidyverse")
install.packages("dbplyr")
install.packages("readxl")
install.packages('Rcpp')
library(Rcpp)
library(tidyverse)
library(readxl)
library(dbplyr)
library(lubridate)
library(readxl)

#combine data from 2018 excels#

pv201801 <- read_excel("particulars for first registered vehicles (jan 2018).xls", 
                       na = "-", skip = 0)
pv201801$`Number of passenger seats`= day(pv201801$`Number of passenger seats`)
pv201801$`Year Of Manufacture`= as.integer(2+difftime(pv201801$`Year Of Manufacture`, as.POSIXct("1900-01-01"), units = "days"))

pv201802 <- read_excel("particulars for first registered vehicles (feb 2018).xls", 
                       na = "-", skip = 0)

pv201803 <- read_excel("particulars for first registered vehicles (mar 2018).xls", 
                       na = "-", skip = 0)

pv201804 <- read_excel("particulars for first registered vehicles (apr 2018).xls", 
                       na = "-", skip = 0)

pv201805 <- read_excel("particulars for first registered vehicles (may 2018).xls", 
                       na = "-", skip = 0)

pv201806 <- read_excel("particulars for first registered vehicles (jun 2018).xlsx", 
                       na = "-", skip = 2)

pv201807 <- read_excel("particulars for first registered vehicles (jul 2018).xlsx", 
                       na = "-", skip = 2)

pv201808 <- read_excel("particulars for first registered vehicles (aug 2018).xlsx", 
                       na = "-", skip = 2)

pv201809 <- read_excel("particulars for first registered vehicles (sep 2018).xls", 
                       na = "-", skip = 2)

pv201810 <- read_excel("particulars for first registered vehicles (oct 2018).xlsx", 
                       na = "-", skip = 2)

pv201811 <- read_excel("particulars for first registered vehicles (nov 2018).xlsx", 
                       na = "-", skip = 2)

pv201812 <- read_excel("particulars for first registered vehicles (dec 2018).xlsx", 
                       na = "-", skip = 2)


df.list <- list(pv201801,pv201802,pv201803,pv201804,pv201805,pv201806,pv201807,pv201808,pv201809,pv201810,pv201811,pv201812)
month_list <- list(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in 1:(length(df.list))) {
  colnames (df.list[[i]]) <- colnames(pv201801)
  df.list[[i]] <- df.list[[i]] %>% mutate(Month = month_list[i])
}
pv2018all <- dplyr::bind_rows(df.list)

##