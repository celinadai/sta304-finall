#### Simulate Progress ####
# The purpose of this is to simulate some data that can be use for robbery cases

#The sample size had been set at 10000


library(tidyverse)

case <-  1: 10000


location_type <- sample(c("Apartment","Banks","Bar_or_Restaurant","Commercial_Dwelling_Unit",
                          "Convenience_Stores", "Gas_Station", "Homeless_Shelter", "Open_Areas",
                          "Other_Commercial","Other_Non_Commercial", "Parking_Lots",
                          "Pharmacy", "Schools_During_Supervised_Activity","Single_Home_or_House", 
                          "Streets", "TTC_Bus", "TTC_Bus_Stop", "TTC_Subway_Station", "TTC_Subway_Train",
                          "TTC_Subway_Tunnel"), 
                 size = 10000, 
                 prob = c(0.13, 0.03, 0.005, 0.009, 0.05, 0.024, 0.009, 0.009, 0.21, 0.004, 0.1, 0.066,
                          0.004, 0.057, 0.25, 0.004, 0.009, 0.013, 0.013, 0.004), 
                 replace = TRUE)


    
offence <- sample(c("Business", "Delivery_Person", "Financial_Institute", "Home_Invasion", "Mugging", "Other", 
                    "Purse_Snatch", "Swarming", "Taxi", "Vehicle_Jacking", "Robbery_With_Weapon"), 
              size = 10000, 
              prob = c(0.212, 0.014, 0.033, 0.038, 0.212, 0.166, 0.024, 0.024, 0.005,0.07, 0.202), 
              replace = TRUE)
occurrencehour <- sample(c("1","2","3","4","5","6","7","8","9","10","11","12","13",
                           "14","15","16","17","18","19","20","21","22","23","0"),
                         size = 10000, 
                         prob = c(0.009, 0.033, 0.014, 0.018, 0.009, 0.009, 0.009, 0.018, 
                                  0.023, 0.023, 0.023, 0.061, 0.018, 0.066, 0.056, 0.075,
                                  0.066, 0.075, 0.103, 0.085, 0.051, 0.056, 0.071,0.038), 
                         replace = TRUE)
occurorencedayofweek <- sample(c("1","2","3","4","5","6","7"),size = 10000, 
                               prob = c(0.165, 0.146, 0.142, 0.188, 0.16, 0.123, 0.076), 
                               replace = TRUE)
time <- sample(c("Morning", "Afternoon", "Night"),
                    size = 10000,
                    prob = c(0.118, 0.42, 0.462),
                    replace = TRUE)
occurrenceday <- sample(c("Begin", "Middle", "End"),
                        size = 10000,
                        prob = c(0.36, 0.39, 0.25),
                        replace = TRUE)
premises_type <- sample(c("Apartment", "Commercial", "Educational", "House", "Other", "Outside", "Transit"),
                        size = 10000,
                        prob = c(0.132, 0.325, 0.005, 0.06, 0.08, 0.36, 0.038 ),
                        replace = TRUE)
days <- sample(c("Weekday", "Weekend"),
               size = 10000,
               prob = c(0.8, 0.2),
               replace = TRUE)

# Since time and occurrencehour, days and occurorencedayofweek are basically same thing,
# so I am just gonna use occurrencehour and occurorencedayofweek since they are more specific

robbery_case <- tibble(case,
                 location_type,
                 offence,
                 occurrencehour,
                 occurorencedayofweek,
                 occurrenceday,
                 premises_type,
                 )

robbery_case

