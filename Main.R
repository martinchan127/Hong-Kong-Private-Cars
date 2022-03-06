install.packages("rlang")
install.packages("tidyverse")
install.packages("dbplyr")
install.packages("readxl")
library(tidyverse)
library(readxl)
library(dbplyr)
sept_2018<-read.csv('particulars of first registered vehicles_september 2018.csv')

#check data type
str(sept_2018)
sept_2018

#delete empty row
sept_2018 <- sept_2018[-c(5087), ]

#Cylinder Capacity remove comma and convert to number
sept_2018$Cylinder.capacity.of.engine..c.c.. = as.numeric(gsub(",", "", sept_2018$Cylinder.capacity.of.engine..c.c..))
#Convert Cyliner NA to 0 
sept_2018$Cylinder.capacity.of.engine..c.c..[is.na(sept_2018$Cylinder.capacity.of.engine..c.c..)] = 0
