#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Shengyi Dai
# Data: 5 April 2022
# Contact: celina.dai@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
# Read in the raw data. 
getwd()
<<<<<<< HEAD
raw_data <- readr::read_csv("/home/jovyan/1STA304/STA304-FINAL/inputs/data/Robbery.csv")
# Just keep some variables that may be of interest (change 
# this depending on your interests)

#### Cleaning Process ####
clean_data <- raw_data%>%
  filter(reportedyear == "2021",
         reportedmonth == "December")%>%
  mutate(days = case_when(
    occurrencedayofweek == "Monday" ~ "Weekday",
    occurrencedayofweek == "Tuesday" ~ "Weekday",
    occurrencedayofweek == "Wednesday" ~ "Weekday",
    occurrencedayofweek == "Thursday" ~ "Weekday",
    occurrencedayofweek == "Friday" ~ "Weekday",
    occurrencedayofweek == "Saturday" ~ "Weekend",
    occurrencedayofweek == "Sunday" ~ "Weekend",
  ))%>%
  mutate(occurrencedayofweek = case_when(
    occurrencedayofweek == "Monday" ~ "1",
    occurrencedayofweek == "Tuesday" ~ "2",
    occurrencedayofweek == "Wednesday" ~ "3",
    occurrencedayofweek == "Thursday" ~ "4",
    occurrencedayofweek == "Friday" ~ "5",
    occurrencedayofweek == "Saturday" ~ "6",
    occurrencedayofweek == "Sunday" ~ "7",
    ))%>%
  mutate(location_type = case_when(
    location_type == "Parking Lots (Apt., Commercial Or Non-Commercial)" ~ "Parking_Lots",
    location_type == "Streets, Roads, Highways (Bicycle Path, Private Road)" ~ "Streets",
    location_type =="Other Non Commercial / Corporate Places (Non-Profit, Gov'T, Firehall)" ~ "Other_Non_Commercial",
    location_type =="Bank And Other Financial Institutions (Money Mart, Tsx)" ~ "Banks",
    location_type =="Apartment (Rooming House, Condo)" ~ "Apartment",
    location_type =="Open Areas (Lakes, Parks, Rivers)" ~ "Open_Areas",
    location_type == "Other Commercial / Corporate Places (For Profit, Warehouse, Corp. Bldg" ~ "Other_Commercial",
    location_type == "Ttc Subway Tunnel / Outdoor Tracks" ~ "TTC_Subway_Tunnel",
    location_type =="Bar / Restaurant" ~ "Bar_or_Restaurant",
    location_type == "Commercial Dwelling Unit (Hotel, Motel, B & B, Short Term Rental)" ~ "Commercial_Dwelling_Unit",
    location_type == "Convenience Stores" ~ "Convenience_Stores",
    location_type == "Gas Station (Self, Full, Attached Convenience)" ~ "Gas_Station",
    location_type == "Homeless Shelter / Mission" ~ "Homeless_Shelter",
    location_type == "Pharmacy" ~ "Pharmacy",
    location_type == "Schools During Supervised Activity" ~ "Schools_During_Supervised_Activity",
    location_type == "Single Home, House (Attach Garage, Cottage, Mobile)" ~ "Single_Home_or_House",
    location_type == "Ttc Bus" ~ "TTC_Bus",
    location_type == "Ttc Bus Stop / Shelter / Loop" ~ "TTC_Bus_Stop",
    location_type == "Ttc Subway Station" ~ "TTC_Subway_Station",
    location_type == "Ttc Subway Train" ~ "TTC_Subway_Train",
  ))%>%
  mutate(offence = case_when(
    offence =="Robbery - Business" ~ "Business",
    offence == "Robbery - Delivery Person" ~ "Delivery_Person",
    offence == "Robbery - Financial Institute" ~ "Financial_Institute",
    offence == "Robbery - Home Invasion" ~ "Home_Invasion",
    offence == "Robbery - Mugging" ~ "Mugging",
    offence == "Robbery - Other" ~ "Other",
    offence == "Robbery - Purse Snatch" ~ "Purse_Snatch", 
    offence == "Robbery - Swarming" ~ "Swarming",
    offence == "Robbery - Taxi" ~ "Taxi",
    offence == "Robbery - Vehicle Jacking" ~ "Vehicle_Jacking",
    offence == "Robbery With Weapon" ~ "Robbery_With_Weapon",
  ))%>%
  mutate(time = case_when(
    occurrencehour =="5" ~ "Morning",
    occurrencehour =="6" ~ "Morning",
    occurrencehour =="7" ~ "Morning",
    occurrencehour =="8" ~ "Morning",
    occurrencehour =="9" ~ "Morning",
    occurrencehour =="10" ~ "Morning",
    occurrencehour =="11" ~ "Morning",
    occurrencehour =="12" ~ "Afternoon",
    occurrencehour =="13" ~ "Afternoon",
    occurrencehour =="14" ~ "Afternoon",
    occurrencehour =="15" ~ "Afternoon",
    occurrencehour =="16" ~ "Afternoon",
    occurrencehour =="17" ~ "Afternoon",
    occurrencehour =="18" ~ "Afternoon",
    occurrencehour =="19" ~ "Night",
    occurrencehour =="20" ~ "Night",
    occurrencehour =="21" ~ "Night",
    occurrencehour =="22" ~ "Night",
    occurrencehour =="23" ~ "Night",
    occurrencehour =="0" ~ "Night",
    occurrencehour =="1" ~ "Night",
    occurrencehour =="2" ~ "Night",
    occurrencehour =="3" ~ "Night",
    occurrencehour =="4" ~ "Night",
  ))%>%
  mutate(occurrenceday = case_when(
    occurrenceday == 1 ~ "Begin",
    occurrenceday == 2  ~ "Begin",
    occurrenceday == 3  ~ "Begin",
    occurrenceday == 4 ~ "Begin",
    occurrenceday == 5 ~ "Begin",
    occurrenceday == 6 ~ "Begin",
    occurrenceday == 7  ~ "Begin",
    occurrenceday == 8  ~ "Begin",
    occurrenceday == 9  ~ "Begin",
      occurrenceday == 10  ~ "Begin",
    occurrenceday == 11  ~ "Middle",
    occurrenceday == 12  ~ "Middle",
    occurrenceday == 13  ~ "Middle",
    occurrenceday == 14  ~ "Middle",
    occurrenceday == 15  ~ "Middle",
    occurrenceday == 16 ~ "Middle",
    occurrenceday == 17 ~ "Middle",
    occurrenceday == 18 ~ "Middle",
    occurrenceday == 19 ~ "Middle",
    occurrenceday == 20 ~ "Middle",
    occurrenceday == 21 ~ "End",
    occurrenceday == 22 ~ "End",
    occurrenceday == 23 ~ "End",
    occurrenceday == 24 ~ "End",
    occurrenceday == 25 ~ "End",
    occurrenceday == 26 ~ "End",
    occurrenceday == 27 ~ "End",
    occurrenceday == 28 ~ "End",
    occurrenceday == 29 ~ "End",
    occurrenceday == 30 ~ "End",
    occurrenceday == 31 ~ "End",
  ))%>%
  
  
  
  select(location_type, offence, occurrencehour,occurrenceday, premises_type, occurrencedayofweek, days, time)
clean_data

#### Save Data ####

write.csv(clean_data, "/home/jovyan/1STA304/STA304-FINAL/outputs/data/reduced_data.csv")

=======
raw_data <- readr::read_csv("/home/jovyan/STA304-final/inputs/data/Robbery.csv")
# Just keep some variables that may be of interest (change 
# this depending on your interests)
clean_data <- raw_data%>%
  filter(reportedyear == "2021",
         reportedmonth == "December")%>%
  select(location_type, offence, occurrencehour,occurrenceday, occurrencedayofweek, Neighbourhood)
clean_data

write.csv(clean_data, "/home/jovyan/STA304-final/outputs/data/reduced_data.csv")

#### What's next? ####
>>>>>>> b210e7f46c654c6c98be60a7c7c6a77975ad9572
