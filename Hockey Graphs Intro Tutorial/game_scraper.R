library(RCurl)
library(xml2)
library(rvest)
library(jsonlite) 
library(foreach)
library(lubridate)
library(tidyverse)

# This is the web scraper that the tutorial is using

source('https://raw.githubusercontent.com/evolvingwild/evolving-hockey/master/EH_scrape_functions.R')

# These are the game ids that the tutorial is using 

game_ids <- c("2019020336","2019020349","2019020367","2019020384")

# Scrape the games based on game ids (we are using play by play data here)

pbp_scrape <- sc.scrape_pbp(game_ids)

# Generate the dataframe using the play by play base data

PHI_tutorial_data <- pbp_scrape$pbp_base

# Create the csv file

write_excel_csv(PHI_tutorial_data, "PHI_tutorial_data.csv")
