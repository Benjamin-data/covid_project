library(tidyverse)

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
    caption = "Source: https://open.canada.ca/data/en/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27"
    )
