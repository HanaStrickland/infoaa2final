library(dplyr)
library(highcharter)
library(plotly)
library(ggplot2)

#reading in data from IHME US State Life Expectancy csv File
life_expectancy <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009_lowercase_Q4.csv", stringsAsFactors = FALSE)
le_state <- as.data.frame(life_expectancy)

#filtering the data frame to contain only state, year, male LE, female LE, and the change in LE for
#both sexes between 1987-2009
le_state <- le_state %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years., 
         Male.life.expectancy.change.1987.to.2009..years., Female.life.expectancy.change.1987.to.2009..years.)

#filtering for all state data in year 1987
le_state_1987 <- le_state %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.) %>% 
  filter(Year == 1987) %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.)

#adding another column that contains the average LE
le_state_1987 <- mutate(le_state_1987, avg.life.expectancy = (Male.life.expectancy..years. + 
                          Female.life.expectancy..years.) / 2)

#map shows LE for each state in year 1987
map_1987 <- hcmap("countries/us/us-all", data = le_state_1987, value = "avg.life.expectancy",
      joinBy = c("name", "State"), name = "Life Expectancy (in years)",
      dataLabels = list(enabled = TRUE, format = "{point.name}"),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 2, valueSuffix = " years"))

map_1987

#filtering for all state data in year 2009
le_state_2009 <- le_state %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.) %>% 
  filter(Year == 2009) %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.)

#adding another column that contains the average LE
le_state_2009 <- mutate(le_state_2009, avg.life.expectancy = (Male.life.expectancy..years. + 
                                                                Female.life.expectancy..years.) / 2)

#map shows LE for each state in year 2009
# map_2009 <- hcmap("countries/us/us-all", data = le_state_2009, value = "avg.life.expectancy",
#       joinBy = c("name", "State"), name = "Life Expectancy (in years)",
#       dataLabels = list(enabled = TRUE, format = "{point.name}"),
#       borderColor = "#FAFAFA", borderWidth = 0.1,
#       tooltip = list(valueDecimals = 2, valueSuffix = " years"))
# 
# map_2009

#dataframe contains the trend between 1987-2009
trend <- le_state %>% 
  select(State, Male.life.expectancy.change.1987.to.2009..years., Female.life.expectancy.change.1987.to.2009..years.)
trend <- mutate(trend, avg.life.expectancy = (Male.life.expectancy.change.1987.to.2009..years. +
                                                Female.life.expectancy.change.1987.to.2009..years.) / 2)
trend <- trend %>% select(State, avg.life.expectancy)
trend <- unique(trend)

#plotting data that shows the trend of life expectancy for each state from 1987 to 2009
#set.seed(955)
#trend_plot <- ggplot(trend, aes(x = State, y = avg.life.expectancy, color = State)) +
 # geom_point(shape = 11) + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
#trend_plot <- ggplotly(trend_plot) + labs(
 # title = "Life Expectancy Change From 1987 to 2009",
  #x = "States",
  #y = "Change in Life Expectancy (in years)")
#trend_plot
