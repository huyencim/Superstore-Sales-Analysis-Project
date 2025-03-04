
# Load necessary libraries
library(dplyr)

# Load the dataset
data <- read.csv("superstore.csv")

# Filter the dataset to include only rows where the Country is 'United States'
us_data <- data %>% filter(Country == "United States")

# View the first few rows to confirm the filter
head(us_data)

# Select relevant columns for the model
us_data <- us_data %>%
  select(Sales, Discount, Profit, Quantity, Category, City, Order.Priority, Region, Segment, Ship.Mode, Shipping.Cost, State, Sub.Category, Year, weeknum)

# Convert categorical variables to factors
us_data$Category <- as.factor(us_data$Category)
us_data$City <- as.factor(us_data$City)
us_data$Order.Priority <- as.factor(us_data$Order.Priority)
us_data$Region <- as.factor(us_data$Region)
us_data$Segment <- as.factor(us_data$Segment)
us_data$Ship.Mode <- as.factor(us_data$Ship.Mode)
us_data$State <- as.factor(us_data$State)
us_data$Sub.Category <- as.factor(us_data$Sub.Category)

# Build a linear regression model
lm_model <- lm(Sales ~ Discount + Profit + Quantity + Category + City+ Order.Priority + 
              Region + Segment + Ship.Mode + Shipping.Cost + State + Sub.Category + Year + weeknum, 
            data = us_data)

# Summarize the model to view coefficients and statistics
summary(lm_model)

