# Breast-_Cancer_Linear_Regression_Modelling
Source File: simulated_breast_cancer_data.csv
Features:
ID_number: Unique identifier for each record (excluded from the analysis).
Diagnosis: Encoded as 1 for malignant (M) and 0 for benign (B).
Worst_Area: The target variable, representing the largest measured area of cell nuclei.
Additional features describing mean, standard error, and worst values for radius, texture, perimeter, area, smoothness, compactness, symmetry, etc.
Workflow
Data Loading:

The dataset is loaded into R from the file path: "C:/Users/kasutaja/Documents/simulated_breast_cancer_data.csv".
Data Preprocessing:

Encodes the Diagnosis column (1 for malignant, 0 for benign).
Excludes irrelevant columns (ID_number) and the target column (Worst_Area) from predictors.
Splits the dataset into 80% training data and 20% testing data.

Model Training:

A Linear Regression model is trained using lm() with the target variable Worst_Area.
Model Evaluation:

Mean Squared Error (MSE): Quantifies the average squared error between predicted and actual values.
R-squared (R²): Indicates the proportion of variability in Worst_Area explained by the predictors.
Model Output:

Displays a detailed summary of the model, including coefficients and p-values for each feature.
Predictions:

The trained model generates predictions for Worst_Area on the test data.
Saves the actual vs. predicted values in a CSV file: predicted_worst_area.csv.
Visualization (Optional):

Additional visualizations of residuals or feature effects can be included using ggplot2.
Key Files
Dataset:
simulated_breast_cancer_data.csv (input)
Predictions:
predicted_worst_area.csv (output)
How to Run the Project
Ensure you have R and RStudio installed on your system.
Install the required libraries using the following commands:
R
Copy code
install.packages("tidyverse")
install.packages("caret")
Update the file path in the code if your dataset is stored in a different location.
Run the script step by step in RStudio.
View the generated CSV file (predicted_worst_area.csv) for the results.
Dependencies
R version: 4.2.1 or higher
Libraries:
tidyverse for data manipulation and visualization
caret for data partitioning and preprocessing
Results
The model outputs:
Model Summary lists feature coefficients and their significance.
Performance Metrics:
MSE represents the prediction error.
R² indicates how well the model explains the variability in Worst_Area.
