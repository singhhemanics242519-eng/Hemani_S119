library(dplyr)
library(tidyr)

df <- read.csv("D:/S119/DATA ANAN/Amazon.csv", na.strings = c("", "NA")) %>%
  mutate(ProductID = row_number()) %>%
  select(ProductID, Category, UnitPrice, Discount)

print("--- 1. Original Wide Data ---")
print(head(df))

long_df <- df %>%
  pivot_longer(
    cols = c(UnitPrice, Discount),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

df_clean <- df %>%
  mutate(Category = ifelse(is.na(Category), "Unknown", Category))

category_pivot <- df_clean %>%
  select(ProductID, Category, UnitPrice) %>%
  pivot_wider(
    names_from = Category,
    values_from = UnitPrice
  )

print("--- 4. Category Pivot (Spreading Categories) ---")
print(head(category_pivot))
