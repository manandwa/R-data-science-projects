library(readxl)
library(readr)
library(stringr)
library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)

# Load data
brooklyn <- read_excel("rollingsales_brooklyn.xls", skip = 4)

test <- brooklyn %>% filter(`BUILDING CLASS AT TIME OF SALE` == "R4") %>% head()

test_overall <- brooklyn %>% filter(`BUILDING CLASS AT TIME OF SALE` == "R4")
unique(test_overall$`BUILDING CLASS AT TIME OF SALE`)

gsf <- unique(test_overall$`GROSS SQUARE FEET`)
gsf_no_na <- brooklyn %>% filter(`GROSS SQUARE FEET` != "NA")
unique(gsf_no_na$`BUILDING CLASS AT TIME OF SALE`)

test_R_code <- brooklyn %>% filter(`BUILDING CLASS AT TIME OF SALE` == "R5") 
unique(test_R_code$`GROSS SQUARE FEET`)
