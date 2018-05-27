income_by_race <- read_xlsx("data/income_by_race.xlsx")
le_national <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")
le_by_state <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009.csv", stringsAsFactors = FALSE)
le_by_income_state <- read.csv("data/health_ineq_online_table_5.csv", stringsAsFactors = FALSE)
le_at_birth_race <- read.csv("data/le_at_birth_race.csv", stringsAsFactors = FALSE)
life_expectancy <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009_lowercase_Q4.csv", stringsAsFactors = FALSE)



income_by_race <- as.data.frame(income_by_race)
le_national <- as.data.frame(le_national)
pct_insurance_by_race <- as.data.frame(pct_insurance_by_race)

################## 
### Question 1 ###
##################
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
income_by_le



################## 
### Question 2 ###
##################
#find life expectancy per state for African Americans

le_at_birth_race <- le_at_birth_race %>%
  mutate(Location = tolower(Location))
le_at_birth_race <- rename(le_at_birth_race, region = Location)

state_data <- map_data('state')
new_data <- left_join(state_data, le_at_birth_race)
new_data$African.American[new_data$African.American %in% "NSD"] <- "0"
new_data[new_data == 0] <- NA
new_data$African.American <- as.numeric(new_data$African.American)
change <- new_data %>%
  mutate(cut(new_data$African.American, breaks = 4))

################## 
### Question 4 ###
##################

#reading in data from IHME US State Life Expectancy csv File
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
hcmap("countries/us/us-all", data = le_state_1987, value = "avg.life.expectancy",
      joinBy = c("name", "State"), name = "Life Expectancy (in years)",
      dataLabels = list(enabled = TRUE, format = "{point.name}"),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 2, valueSuffix = " years"))

#filtering for all state data in year 2009
le_state_2009 <- le_state %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.) %>% 
  filter(Year == 2009) %>% 
  select(State, Year, Male.life.expectancy..years., Female.life.expectancy..years.)

#adding another column that contains the average LE
le_state_2009 <- mutate(le_state_2009, avg.life.expectancy = (Male.life.expectancy..years. + 
                                                                Female.life.expectancy..years.) / 2)

#map shows LE for each state in year 2009
# hcmap("countries/us/us-all", data = le_state_2009, value = "avg.life.expectancy",
#       joinBy = c("name", "State"), name = "Life Expectancy (in years)",
#       dataLabels = list(enabled = TRUE, format = "{point.name}"),
#       borderColor = "#FAFAFA", borderWidth = 0.1,
#       tooltip = list(valueDecimals = 2, valueSuffix = " years"))

#dataframe contains the trend between 1987-2009
trend <- le_state %>% 
  select(State, Male.life.expectancy.change.1987.to.2009..years., Female.life.expectancy.change.1987.to.2009..years.)
trend <- mutate(trend, avg.life.expectancy = (Male.life.expectancy.change.1987.to.2009..years. +
                                                Female.life.expectancy.change.1987.to.2009..years.) / 2)
trend <- trend %>% select(State, avg.life.expectancy)
trend <- unique(trend)

#plotting data that shows the trend of life expectancy for each state from 1987 to 2009
set.seed(955)
# trend_plot <- ggplot(trend, aes(x = State, y = avg.life.expectancy, color = State)) +
#   geom_point(shape = 11) + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
# trend_plot <- ggplotly(trend_plot) + labs(
#   title = "Life Expectancy Change From 1987 to 2009",
#   x = "States",
#   y = "Change in Life Expectancy")
# trend_plot



#le_by_state source
#http://ghdx.healthdata.org/record/united-states-adult-life-expectancy-state-and-county-1987-2009#

#le_by_income_state
#https://healthinequality.org/data/ table 5#