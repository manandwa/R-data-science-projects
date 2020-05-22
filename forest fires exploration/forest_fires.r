# Title: 'Guided Project: Analyzing Forest Fire Data'
# Author: 'Mobin Anandwala'
# Date: 'May 22, 2020'

# Load the required packages
library(readr)
library(dplyr)
library(ggplot2)
library(purrr)

# import the data file as a dataframe

forestfires <- read.csv('forestfires.csv')

# Create a bar chart that shows fires by month
fires_each_month <- forestfires %>% group_by(month) %>% summarise(total_fires_month = n())
ggplot(data = fires_each_month) +
  aes(x = month, y = total_fires_month) +
  geom_bar(stat = 'identity') + 
  theme(panel.background = element_rect(fill = 'white'),
        axis.line = element_line(size = 0.25, colour = 'black'))

# Create a bar chart shows fires by day
fires_each_day <- forestfires %>% group_by(day) %>% summarise(total_fires_day = n())
ggplot(data = fires_each_day) +
  aes(x = day, y = total_fires_day) +
  geom_bar(stat = 'identity') +
  theme(panel.background = element_rect(fill = 'white'),
        axis.line = element_line(size = 0.25, colour = 'black'))

# Change the month and day to specify order and use factor
forestfires <- forestfires %>% mutate(month = factor(month, levels = c('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec')), day = factor(day, levels = c('sun', 'mon', 'tues', 'wed', 'thu', 'fri', 'sat')))

# Rerun month plot
fires_each_month <- forestfires %>% group_by(month) %>% summarise(total_fires_month = n())
ggplot(data = fires_each_month) +
  aes(x = month, y = total_fires_month) +
  geom_bar(stat = 'identity') + 
  theme(panel.background = element_rect(fill = 'white'),
        axis.line = element_line(size = 0.25, colour = 'black'))

fires_each_day <- forestfires %>% group_by(day) %>% summarise(total_fires_day = n())
ggplot(data = fires_each_day) +
  aes(x = day, y = total_fires_day) +
  geom_bar(stat = 'identity') +
  theme(panel.background = element_rect(fill = 'white'),
        axis.line = element_line(size = 0.25, colour = 'black'))

# Create function to make box plots
generate_boxplots <- function(x, y) {
  ggplot(data = forestfires) + 
    aes_string(x = x, y = y) +
    geom_boxplot() +
    theme(panel.background = element_rect(fill = 'white'))
  
}

# Get month day and remaining variables for boxplots
x_month = names(forestfires[3])
x_day = names(forestfires[4])
y_values = names(forestfires[5:12])

month_box <- map2(x_month, y_values, generate_boxplots)
month_day <- map2(x_day, y_values, generate_boxplots)

# Create function to make scatter plots
generate_scatterplots = function(x, y) {
  ggplot(data = forestfires) +
    aes_string(x = x, y = y) + 
    geom_point() +
    theme(panel.background = element_rect(fill = 'white'))
}

# Generate scatter plot variables
x_scatter = names(forestfires)[5:12]
y_scatter = names(forestfires)[13]

scatter_plots <- map2(x_scatter, y_scatter, generate_scatterplots)

                                                              