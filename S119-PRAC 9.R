install.packages("stringr")
install.packages("tidyr")
library(stringr)
library(tidyr)
library(dplyr)

heart <- read.csv("D:/S119/DATA ANAN/heart.csv", na.strings = c("", "NA"))

heart$CP_short <- str_sub(heart$ChestPainType, 1, 3)
heart$CP_last2 <- str_sub(heart$ChestPainType, -2, -1)
heart$Info <- paste(heart$Sex, heart$ChestPainType, heart$ST_Slope, sep = "|")
split_matrix <- str_split(heart$Info, "\\|", simplify = TRUE)
heart$Info_Sex <- split_matrix[,1]
heart$Info_CP <- split_matrix[,2]
heart$Info_Slope <- split_matrix[,3]
heart <- heart %>%
  mutate(ID = paste0("PT-", row_number(), "-", Age)) %>%
  separate(ID, into = c("Pref", "Num", "Age_from_ID"), sep = "-", convert = TRUE)

print(head(heart))
