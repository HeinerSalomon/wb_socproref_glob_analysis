## ---------------------------
##
## Script name: Global analysis of social protection receipt of displaced populations
##
## Purpose of script:
##
## Author: Heiner Salomon (h.salomon@odi)
##
## Date Created: 2021-05-07
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

## set directories for Mac and PC

path <- "C:/Users/h.salomon/OneDrive - Overseas Development Institute/Projects/2020_09 WB Global quant analysis data/"

## ---------------------------

options(scipen = 6, digits = 4)
memory.limit(30000000)

## ---------------------------

## Load packages:

library(tidyverse)
library(foreign)
library(readstata13)
library(gmodels)
# source("functions/packages.R")

## ---------------------------

## Load functions:

# source("functions/summarise_data.R") 

## ---------------------------


## ---------------------------
## 
## SECTION 1: Preparing individual data sets
##
## ---------------------------

## ------ Bangladesh

## Loading the data

data <- file.path(path,"/bgd/2018 PDM/UNHCR_BGD_PDM_2018_JULY_household_v2.1.dta") %>%
  read.dta13() %>%
  select(household_id,weight,C1_food,C1_c4w,C1_nfi,C1_other,C2)

## Adding data set level values

data$year <- 2018
data$type <- "Post-distribution Monitoring"
data$country <- "Bangladesh"

## Data transformation before assigning variables

data <- data %>%
  mutate(received_any = pmax(C1_food,C1_c4w,C1_nfi,C1_other))


## Assigning the crucial variables

data$pid <- NA
data$hhid <- data$household_id
data$weight <- data$weight
data$access_socpro_any <- data$received_any
data$access_socpro_any_gov <-NA
data$access_socpro_any_nongov <- NA
data$access_socpro_cash <- NA
data$access_socpro_inkind <- NA
data$received_socpro_any <- data$received_any
data$received_socpro_past_1w <- NA
data$received_socpro_past_2w <- NA
data$received_socpro_past_1m <- data$received_any
data$received_socpro_past_6m <- NA
data$received_socpro_past_1y <- NA 
data$value_socpro_LCU_all <- data$C2
data$value_socpro_LCU_cash <- data$C2

## Assigning the specific data set name

bgd_pdm_2018 <- data


## ---------------------------
## 
## SECTION 2: Creating the data set of outputs
##
## ---------------------------


for (dataset in c(bgd_pdm_2018,)){
  view(dataset)
}


## ---------------------------
## 
## SECTION 3: Producing visual output of shared data set
##
## ---------------------------
