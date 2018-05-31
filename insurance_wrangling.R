source("data_wrangling.R")

uninsured_data <- coverage_by_race %>% 
  filter(Coverage.Type == "Uninsured", Data.Type == "Percent")

colnames(uninsured_data) <- c("Fips", "Location", "Coverage Type", "Race/Ethnicity", "Year","Data.Type",       
                              "Data", "MOE"  )


multiply_by_100 <- as.numeric(uninsured_data$Data) * 100

uninsured_data$Data <- multiply_by_100

uninsured_data_national <- uninsured_data %>% 
  filter(Location == "United States")


uninsured_data <- uninsured_data %>% 
  filter(Location != "United States")


# uninsured by race in 2016, national

his_uninsured <- uninsured_data_national %>% 
  filter(`Race/Ethnicity` == "Hispanic / Latino", Year == "2016") %>% 
  select(Data)

his_uninsured <- his_uninsured[1,1] #17.927
his_uninsured <- paste(his_uninsured, "%", sep = "")


other_uninsured <- uninsured_data_national %>% 
  filter(`Race/Ethnicity` == "Other / Multiple Races", Year == "2016") %>% 
  select(Data)

other_uninsured <- other_uninsured[1,1] #9.72
other_uninsured <- paste(other_uninsured, "%", sep = "")


afam_uninsured <- uninsured_data_national %>% 
  filter(`Race/Ethnicity` == "African-American / Black", Year == "2016") %>% 
  select(Data)

afam_uninsured <- afam_uninsured[1,1] # 9.555
afam_uninsured <- paste(afam_uninsured, "%", sep = "")


asian_uninsured <- uninsured_data_national %>% 
  filter(`Race/Ethnicity` == "Asian", Year == "2016") %>% 
  select(Data)

asian_uninsured <- asian_uninsured[1,1] #6.599
asian_uninsured <- paste(asian_uninsured, "%", sep = "")


white_uninsured <- uninsured_data_national %>% 
  filter(`Race/Ethnicity` == "White", Year == "2016") %>% 
  select(Data)

white_uninsured <- white_uninsured[1,1] #5.701
white_uninsured <- paste(white_uninsured, "%", sep = "")

insurance_year_range <- range(uninsured_data$Year)

