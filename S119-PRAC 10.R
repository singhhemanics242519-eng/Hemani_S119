library(dplyr)
library(tidyr)

heart2 <- read.csv("D:/S119/DATA ANAN/heart.csv", na.strings = c("", "NA"))

heart2 <- heart2 %>%
  mutate(
    Age = replace_na(Age, median(Age, na.rm = TRUE)),
    RestingBP = replace_na(RestingBP, median(RestingBP, na.rm = TRUE)),
    Cholesterol = replace_na(Cholesterol, median(Cholesterol, na.rm = TRUE)),
    MaxHR = replace_na(MaxHR, median(MaxHR, na.rm = TRUE))
  ) %>%
  mutate(
    Age_Group = case_when(
      Age < 40 ~ "Young",
      Age >= 40 & Age < 60 ~ "Middle",
      TRUE ~ "Senior"
    ),
    BP_Category = ifelse(RestingBP >= 140, "High", ifelse(RestingBP >= 120, "Elevated", "Normal")),
    Cholesterol_Category = case_when(
      Cholesterol < 200 ~ "Desirable",
      Cholesterol >= 200 & Cholesterol < 240 ~ "Borderline",
      TRUE ~ "High"
    ),
    MaxHR_pct = round(MaxHR / 220, 3),
    Risk_Score = round((as.numeric(Age)/50) + (Cholesterol/240) + (ifelse(ExerciseAngina == "Y", 1, 0)) + (Oldpeak/5), 2),
    High_Risk = ifelse(Risk_Score > 3.0 | HeartDisease == 1, TRUE, FALSE),
    Summary = paste0("AgeGrp:", Age_Group, " | BP:", BP_Category, " | Chol:", Cholesterol_Category)
  )

print(head(heart2))
