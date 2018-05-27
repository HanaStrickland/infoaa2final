income_by_race <- read_xlsx("data/income_by_race.xlsx")
le_national <- read_xlsx("data/life_expectancy_death_rates.xlsx")
pct_insurance_by_race <- read_xlsx("data/pct_insurance_by_race.xlsx")
le_by_state <- read.csv("data/IHME_US_STATE_LIFE_EXPECTANCY_1987_2009.csv", stringsAsFactors = FALSE)
le_by_income_state <- read.csv("data/health_ineq_online_table_5.csv", stringsAsFactors = FALSE)
le_at_birth_race <- read.csv("data/le_at_birth_race.csv", stringsAsFactors = FALSE)


income_by_race <- as.data.frame(income_by_race)
le_national <- as.data.frame(le_national)
pct_insurance_by_race <- as.data.frame(pct_insurance_by_race)


