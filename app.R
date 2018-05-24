library(dplyr)
library(ggplot2)
library("maps")
library(tidyr)
library("readxl")
library(shiny)

install.packages("readxl")

source("my_ui.R")
source("my_server.R")

income_by_race <- read_xlsx("data/income_by_race.xlsx")
life_expectancy <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")
le_by_state <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009.csv", stringsAsFactors = FALSE)
le_by_income_state <- read.csv("data/health_ineq_online_table_5.csv", stringsAsFactors = FALSE)





shinyApp(ui, server)




#le_by_state source
#http://ghdx.healthdata.org/record/united-states-adult-life-expectancy-state-and-county-1987-2009#

#le_by_income_state
#https://healthinequality.org/data/ table 5#