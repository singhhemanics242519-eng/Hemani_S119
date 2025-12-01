install.packages(c("readxl", "psych"))

library(readxl)
library(psych)

my_data <- read_excel("shopping behaviour.xlsx")

head(my_data)

tail(my_data)

dim(my_data)

cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

str(my_data)

summary(my_data)

names(my_data)
cat("Column Names: ", names(my_data), "\n")

describe(my_data)

