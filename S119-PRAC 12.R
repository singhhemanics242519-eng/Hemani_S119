amazon_df <- read.csv("D:/S119/DATA ANAN/Amazon.csv", na.strings = c("", "NA"))
flipkart_df <- read.csv("D:/S119/DATA ANAN/flipkart.csv")

print(names(amazon_df))
print(names(flipkart_df))

amazon_clean <- amazon_df[, c("Category", "UnitPrice")]
names(amazon_clean) <- c("Species", "Height")

flipkart_clean <- flipkart_df[, c("maincateg", "actprice1")]
names(flipkart_clean) <- c("Species", "Height")

amazon_clean$Height <- as.numeric(amazon_clean$Height)
flipkart_clean$Height <- as.numeric(flipkart_clean$Height)

combined_data <- rbind(amazon_clean, flipkart_clean)

print("--- Combined Data Summary ---")
print(paste("Amazon rows:", nrow(amazon_clean)))
print(paste("Flipkart rows:", nrow(flipkart_clean)))
print(paste("Total rows (Expected):", nrow(amazon_clean) + nrow(flipkart_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print(head(combined_data))
print(tail(combined_data))
