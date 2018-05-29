library(dplyr)
library(ggplot2)
library("maps")
library(tidyr)
library("readxl")
library(shiny)
library(plotly)

source("data_wrangling.R")

# This file contains the data processing and visualizations for question 3 on our Project Proposal:
# What are some meaningful correlations between quality of health insurance coverage (private
# government, private employee, etc.) based on race/gender?

# The data worked with comes from the Henry J Kaiser Family Foundation and from the Health
# Inequality Project, found at:
# https://www.kff.org/statedata/
# https://healthinequality.org/data/

# read in race-organized data files
total_pop_health_cov <- read.csv("data/health_ins_total_pop_coverage.csv", stringsAsFactors = FALSE)
medicare_by_race_data <- read.csv("data/dist_medicare_benef_by_race.csv", stringsAsFactors = FALSE)
dist_uninsured_by_race <- read.csv("data/dist_uninsured_by_race.csv", stringsAsFactors = FALSE)
dist_medicaid_by_race <- read.csv("data/dist_medicaid_by_race.csv", stringsAsFactors = FALSE)
dist_employer_coverage_by_race <- read.csv("data/dist_employer_coverage_by_race.csv", stringsAsFactors = FALSE)

# read in gender-organized data files
pct_men_poor_health <- read.csv("data/pct_adult_men_poor_health_status.csv", stringsAsFactors = FALSE)
pct_women_poor_health <- read.csv("data/pct_adult_women_poor_health_status.csv", stringsAsFactors = FALSE)

# get state data for map visualizations
state_data <- map_data('state')

# data clean up
medicare_by_race_data <- medicare_by_race_data[, -6]
total_pop_health_cov <- total_pop_health_cov[1:52, -8]
dist_uninsured_by_race <- dist_uninsured_by_race[1:52, -6]
dist_medicaid_by_race <- dist_medicaid_by_race[1:52, -6]
dist_employer_coverage_by_race <- dist_employer_coverage_by_race[1:52, -6]
pct_men_poor_health <- pct_men_poor_health[1:55, -9]
pct_women_poor_health <- pct_women_poor_health[1:55, -9]

dist_uninsured_by_race <- dist_uninsured_by_race %>%
  mutate(Location = tolower(Location))
dist_uninsured_by_race <- rename(dist_uninsured_by_race, region = Location)

# testing out map visualizations with dist data
state_dist_uninsured_by_race <- left_join(state_data, dist_uninsured_by_race)

# more clean-up
state_dist_uninsured_by_race$White[state_dist_uninsured_by_race$White %in% "N/A"] <- "0"
state_dist_uninsured_by_race[state_dist_uninsured_by_race == 0] <- NA
state_dist_uninsured_by_race$White <- as.numeric(state_dist_uninsured_by_race$White)

state_dist_uninsured_by_race$Black[state_dist_uninsured_by_race$Black %in% "N/A"] <- "0"
state_dist_uninsured_by_race[state_dist_uninsured_by_race == 0] <- NA
state_dist_uninsured_by_race$Black <- as.numeric(state_dist_uninsured_by_race$Black)

state_dist_uninsured_by_race$Hispanic[state_dist_uninsured_by_race$Hispanic %in% "N/A"] <- "0"
state_dist_uninsured_by_race[state_dist_uninsured_by_race == 0] <- NA
state_dist_uninsured_by_race$Hispanic <- as.numeric(state_dist_uninsured_by_race$Hispanic)

state_dist_uninsured_by_race$Other[state_dist_uninsured_by_race$Other %in% "N/A"] <- "0"
state_dist_uninsured_by_race[state_dist_uninsured_by_race == 0] <- NA
state_dist_uninsured_by_race$Other <- as.numeric(state_dist_uninsured_by_race$Other)
