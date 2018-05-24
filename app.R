library(dplyr)
library(ggplot2)
library("maps")
library(tidyr)
library("readxl")
library(shiny)
library(plotly)


source("my_ui.R")
source("my_server.R")

income_by_race <- read_xlsx("data/income_by_race.xlsx")
le_national <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")
le_by_state <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009.csv", stringsAsFactors = FALSE)
le_by_income_state <- read.csv("data/health_ineq_online_table_5.csv", stringsAsFactors = FALSE)

income_by_race <- as.data.frame(income_by_race)
le_national <- as.data.frame(le_national)
pct_insurance_by_race <- as.data.frame(pct_insurance_by_race)

# Combine income and le dataframes 
income_black_white <- income_by_race %>% 
  filter(Race %in% c("All Races", "White Alone", "Black Alone")) %>% 
  select(Year, Race, median)

le_black_white <- le_national %>% 
  filter(Sex == "Both Sexes") %>% 
  select(-Age.Adusted.Death.Rate)

income_black_white_wide_median <- spread(income_black_white, 
                                         key = "Race", 
                                         value = "median" )

colnames(income_black_white_wide_median) <- c("Year", "All Races", "Black", "White")

income_black_white <- gather(income_black_white_wide_median, 
                             key = "Race", 
                             value = "median_income", "All Races", "Black", "White")

income_by_le <- left_join(income_black_white, le_black_white, by = c("Year", "Race"))


shinyApp(ui, server)






#le_by_state source
#http://ghdx.healthdata.org/record/united-states-adult-life-expectancy-state-and-county-1987-2009#

#le_by_income_state
#https://healthinequality.org/data/ table 5#