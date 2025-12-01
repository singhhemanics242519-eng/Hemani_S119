library(dplyr)

data_jan <- data.frame(
  ID = c(10, 20, 30),
  Name = c("Liam", "Mia", "Noah"),
  Jan_Sales = c(300, 450, 520)
)

data_feb <- data.frame(
  ID = c(10, 20, 30),
  Name = c("Liam", "Mia", "Noah"),
  Feb_Sales = c(310, 470, 540)
)

data_new_hires <- data.frame(
  ID = c(40, 50),
  Name = c("Olivia", "James"),
  Jan_Sales = c(280, 330)
)

print("--- Data January ---")
print(data_jan)
print("--- Data February ---")
print(data_feb)

merged_data <- merge(data_jan, data_feb, by = c("ID", "Name"))

print("--- Merged Data (Columns Added) ---")
print(merged_data)

final_list <- bind_rows(data_jan, data_new_hires)

print("--- Appended Data (Rows Added) ---")
print(final_list)
