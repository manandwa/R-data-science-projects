library(RCurl)
library(xml2)
library(rvest)
library(jsonlite) 
library(foreach)
library(lubridate)
library(tidyverse)

# This is the web scraper that the tutorial is using

source('https://raw.githubusercontent.com/evolvingwild/evolving-hockey/master/EH_scrape_functions.R')

game_ids <- read_csv("Playoff_ids.csv")

# Scrape the data

games <- game_ids$Game_ID

pbp_scrape <- sc.scrape_pbp(games)

# Generate the dataframe using the play by play base data

CHI_Playoff_data <- pbp_scrape$pbp_base

write_excel_csv(CHI_Playoff_data, "CHI_Playoff_data.csv")
