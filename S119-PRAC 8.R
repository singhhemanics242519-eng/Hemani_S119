install.packages("tidyr")
library(dplyr)
library(tidyr)

heart_df <- read.csv("D:/S119/DATA ANAN/heart.csv", na.strings = c("", "NA"))

print(head(heart_df))

print(colSums(is.na(heart_df)))

clean_omit <- na.omit(heart_df)

print(nrow(heart_df))
print(nrow(clean_omit))
print(head(clean_omit))

avg_chol <- mean(heart_df$Cholesterol, na.rm = TRUE)

clean_replace <- heart_df %>%
  replace_na(list(
    Sex = "Unknown",
    ChestPainType = "Unknown",
    RestingBP = 0,
    Cholesterol = avg_chol,
    FastingBS = 0,
    RestingECG = "Unknown",
    MaxHR = 0,
    ExerciseAngina = "Unknown",
    Oldpeak = 0,
    ST_Slope = "Unknown",
    HeartDisease = 0
  ))

print(clean_replace[3, ])
print(head(clean_replace))

print(colSums(is.na(clean_replace)))
