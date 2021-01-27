#### Preamble ####
# Purpose: 
# Author: Morgaine
# Date: 20 January 2021
# Pre-requisites: None

#### Workspace set-up ####
library(tidyverse)
library(opendatatoronto)

#### Code from opendatatoronto ####
# grab police annual statistics report package
package <- show_package("9d11c7aa-7613-4d3e-95f3-a02e2b1aa2d7")
package

# get package resources
resources <- list_package_resources("9d11c7aa-7613-4d3e-95f3-a02e2b1aa2d7")

# load the first datastore resource as a sample
crime_data <- filter(resources, row_number()==1) %>% get_resource()

#### Save data ####
write_csv(crime_data, "inputs/data/raw_crime_data.csv")

#### Data cleaning ####
# remove id and index columns
crime_clean <- crime_data[-c(1, 2)]

#check data for NAs (0)
sum(is.na(crime_clean))

factors <- c(1:4)
crime_clean[,factors] <- lapply(crime_clean[,factors], as.factor)

#### Descriptive Summaries ####
str(crime_clean)
summary(crime_clean)

#### Saving clean data ####
write_csv(crime_clean, here("inputs/data/clean_crime_data.csv"))
str(crime_clean)
