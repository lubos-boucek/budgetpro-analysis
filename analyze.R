library(stringr)
# library(stringi)

library(xlsx)
library(dplyr)
library(tidyr)
library(lubridate)

library(ggplot2)
library(hrbrthemes)

source("helpers.R")

reports <- list.files(path = "data", pattern = "report_All_accounts_*", full.names = T)
mtimes <- file.mtime(reports)
current_report <- reports[max(mtimes) == mtimes]

df_current <- read.csv(current_report) %>% 
  select(-`AMOUNT....`, -`CURRENCY....`, -`EXCHANGE.RATE....`) %>%
  mutate(DATE = as.POSIXct(DATE, format = "%d. %m. %Y"), 
         CATEGORY = paste0(MAIN.CATEGORY, "/", SUB.CATEGORY), 
         AMOUNT = as.double(format_amount(AMOUNT)))