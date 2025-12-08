flipkart_df <- read.csv("D:/S119/DATA ANAN/flipkart.csv", na.strings = c("", "NA"))

flipkart_df$Rating <- as.numeric(flipkart_df$Rating)
flipkart_df$actprice1 <- as.numeric(flipkart_df$actprice1)

print("--- Data Loaded ---")

print("--- OUTPUT OF str() ---")
str(flipkart_df)

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(flipkart_df)

flipkart_df$maincateg <- as.factor(flipkart_df$maincateg)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(flipkart_df)

avg_rating <- mean(flipkart_df$Rating, na.rm = TRUE)
max_price <- max(flipkart_df$actprice1, na.rm = TRUE)

print(paste("Average Rating:", avg_rating))
print(paste("Highest Price:", max_price))
