# Load necessary libraries
library(tidyverse)  # For data manipulation and visualization
library(caret)      # For machine learning tasks

# Load the data
file_path <- "C:/Users/kasutaja/Documents/simulated_breast_cancer_data.csv"
data <- read.csv(file_path)
data

# Encode the 'Diagnosis' column (M = 1, B = 0)
data$Diagnosis <- ifelse(data$Diagnosis == "M", 1, 0)

# Define features (X) and target (y)
# Remove ID_number and 'Worst_Area' from predictors
X <- data %>% select(-c(ID_number, Worst_Area))
X
y <- data$Worst_Area
y
# Split the data into training and testing sets (80% train, 20% test)
set.seed(42)  # For reproducibility
train_index <- createDataPartition(y, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train a Linear Regression model
model <- lm(Worst_Area ~ ., data = train_data)
# Summary of the model
summary(model)

# Make predictions on the test data
y_pred <- predict(model, newdata = test_data)
y_pred

# Evaluate the model
mse <- mean((test_data$Worst_Area - y_pred)^2)  # Mean Squared Error
r2 <- 1 - sum((test_data$Worst_Area - y_pred)^2) / sum((test_data$Worst_Area - mean(test_data$Worst_Area))^2)  # R-squared

cat("Mean Squared Error (MSE):", mse, "\n")
cat("R² Score:", r2, "\n")

# Extract and print model coefficients
coefficients <- as.data.frame(summary(model)$coefficients)
colnames(coefficients) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
print(coefficients)

# Save predictions to a CSV file
predictions <- data.frame(Actual = test_data$Worst_Area, Predicted = y_pred)
write.csv(predictions, "C:/Users/kasutaja/Documents/predicted_worst_area.csv", row.names = FALSE)
cat("Predictions saved to C:/Users/kasutaja/Documents/predicted_worst_area.csv\n")
