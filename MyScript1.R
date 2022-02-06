library(tidyverse)
library(magrittr)
library(lubridate)
install.packages("lubridate")
install.packages('magrittr')

################################################################################

# "Confirmed positive cases of COVID-19 in Ontario"

#> covid_19 is a dataset that compiles daily snapshots of publicly reported data
#> on 2019 Novel Coronavirus (COVID-19) testing in Ontario.

#> Source: 
#> https://open.canada.ca/data/en/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27

################################################################################

# Number of confirmed positive cases of COVID_19 reported on December, 2020 (first try with a small scale)

# Using subset to filter the data only corresponding to the month of December 2020 
(covid_19_december_2020<- subset(covid_19, Case_Reported_Date> "2020-12-01" 
                                 & Case_Reported_Date < "2020-12-31"))

# Create a bar for December, 2020
ggplot(data = covid_19_december_2020) + 
  geom_bar(
    mapping = aes(x = Case_Reported_Date, fill=Client_Gender) #Representation of the genders with fill
  ) +
  labs(
    x = 'Date',
    y = 'Confirmed positive cases',
    fill = 'Gender',
    title = "Confirmed positive cases (COVID_19) reported in Ontario on December, 2020",
    caption = "Source: https://open.canada.ca/data/en/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27")

# Using subset to filter the data for 2020 
(covid_19_2020<- subset(covid_19, Case_Reported_Date> "2020-01-01" 
                        & Case_Reported_Date < "2020-12-31"))

# Create a bar for 2020
ggplot(data = covid_19_2020) + 
  geom_bar(
    mapping = aes(x = Case_Reported_Date)
  ) +
  labs(
    x = 'Date',
    y = 'Confirmed positive cases',
    fill = 'Gender',
    title = "Confirmed positive cases (COVID_19) reported in Ontario in 2020",
    caption = "Source: https://open.canada.ca/data/en/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27"
  )
library(ggplot2)

#############################################################################
# Wanted to use %>% to simplify the code but I will need to study it 
'
covid_19 %>%
  (covid_19_2020<- subset(covid_19, Case_Reported_Date> "2020-01-01" 
                          & Case_Reported_Date < "2020-12-31")) %>%
  ggplot(data = covid_19_2020) %>%
  geom_bar(
    mapping = aes(x = Case_Reported_Date)
  ) %>%
  labs(
    x = 'Date',
    y = 'Confirmed positive cases',
    fill = 'Gender',
    title = "Confirmed positive cases (COVID_19) reported in Ontario in 2020",
    caption = "Source: https://open.canada.ca/data/en/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27"
  )
  '
#############################################################################

#> This code group the data by month and sum the latitude for each month 
#> I want to do the same thing but using the number of cases (variable that
#> I need to create?) instead of the latitude
covid_19 %>%
  group_by(month=floor_date(Case_Reported_Date, "month"))%>%
  summarize(Reporting_PHU_Latitude=sum(Reporting_PHU_Latitude))




