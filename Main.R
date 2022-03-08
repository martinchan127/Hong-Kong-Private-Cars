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
pv201809 <- read_excel("particulars for first registered vehicles (sep 2018).xls", 
                        na = "-", skip = 2)
View(pv201809)
str(pv201809)

pv201801 <- read_excel("particulars for first registered vehicles (jan 2018).xls", 
                       na = "-", skip = 0)
pv201801$`Number of passenger seats`= day(pv201801$`Number of passenger seats`)

str(pv201801)
