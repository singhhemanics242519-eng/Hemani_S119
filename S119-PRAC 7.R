library(dplyr)

heart <- read.csv("D:/S119/DATA ANAN/heart.csv")

print(head(heart, 3))

selected_cols <- heart %>%
  select(Age, Sex, MaxHR)

print(head(selected_cols, 3))

range_cols <- heart %>%
  select(Age:Cholesterol)

print(head(range_cols, 3))

starts_with_h <- heart %>%
  select(starts_with("H"))

print(head(starts_with_h, 3))

dropped_one <- heart %>%
  select(-Sex)

print(names(dropped_one))

dropped_multiple <- heart %>%
  select(-Age, -Cholesterol)

print(names(dropped_multiple))

dropped_range <- heart %>%
  select(-(MaxHR:ST_Slope))

print(names(dropped_range))
