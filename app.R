library(dplyr)
library(ggplot2)
library("maps")
library(tidyr)
library("readxl")
library(shiny)

source("my_ui.R")
source("my_server.R")

income_by_race <- read_xlsx("data/income_by_race.xlsx")
life_expectancy <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")






shinyApp(ui, server)