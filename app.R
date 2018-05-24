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
life_expectancy <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")

income_by_race <- as.data.frame(income_by_race)
life_expectancy <- as.data.frame(life_expectancy)
pct_insurance_by_race <- as.data.frame(pct_insurance_by_race)

# Combine income and le dataframes 
income_black_white <- income_by_race %>% 
  filter(Race %in% c("All Races", "White Alone", "Black Alone")) %>% 
  select(Year, Race, median)

le_black_white <- life_expectancy %>% 
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

plot1 <- ggplot(data = income_by_le) +
  geom_point(mapping = aes(x = Avg.Life.Expectancy.Years, y = median_income,  color = Race))




shinyApp(ui, server)