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
crime_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
crime_data

#### Save data ####
write_csv(crime_data, "inputs/data/raw_crime_data.csv")