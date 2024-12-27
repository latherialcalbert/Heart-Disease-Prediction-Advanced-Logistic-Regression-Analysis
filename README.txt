# Heart Disease Prediction - Advanced Logistic Regression Analysis

This repository contains an R-based implementation of a logistic regression analysis for predicting the risk of heart disease based on clinical indicators. The project uses advanced statistical methods, including Gaussian Kernel Density Estimation (KDE), logarithmic transformations, and AIC model selection for improved prediction accuracy. The analysis is enhanced with diagnostic plots, such as Marginal Model Plots (MMPs), and optimized for real-world medical applications.

### Authors: Latherial Calbert & Natalie Huey  
### Date: December 2024

## Project Overview

Heart disease remains one of the leading causes of death globally. In this project, we develop a predictive model using logistic regression to assess the risk of heart disease based on clinical data. The key components of this analysis include:

- **Logistic Regression**: Used for binary classification of heart disease risk (yes/no).
- **Gaussian KDE**: Employed for visualizing the distribution of predictor variables.
- **Logarithmic Transformations**: Applied to variables to improve model fit and diagnostics.
- **AIC Model Selection**: Helps select the most parsimonious model by balancing fit and complexity.
- **Marginal Model Plots (MMPs)**: Used for diagnostic checks on model performance.

## Features

- **Data Preprocessing**: The dataset is cleaned and prepared for analysis.
- **Logistic Regression Modeling**: A stepwise approach is used to improve model selection, with both original and log-transformed variables.
- **Model Diagnostics**: Includes model fitting, residual analysis, and the evaluation of the significance of predictor variables.
- **Visualizations**: Includes density plots for original and transformed variables, and Marginal Model Plots for model diagnostics.

## Files

- **Heart-Disease-Prediction-Advanced-Logistic-Regression-Analysis.pdf**: A detailed explanation of the project, methodology, and results.
- **r_code.R**: The R script containing the full implementation of the analysis, including data loading, model fitting, diagnostics, and visualization.

## Prerequisites

The following R libraries are required to run the analysis:

- `readr` for reading CSV files
- `car` for diagnostic tools

To install these libraries, you can use the following commands in R:

```r
install.packages("readr")
install.packages("car")
```

## Data

The dataset used in this analysis is assumed to be a CSV file containing clinical data for heart disease prediction. The variables (`x1`, `x2`, `x3`, `x4`, `x5`) represent clinical indicators such as age, cholesterol levels, blood pressure, etc. The `HeartDisease` column indicates whether the individual has heart disease (1) or not (0).

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/Heart-Disease-Prediction.git
   cd Heart-Disease-Prediction
   ```

2. **Prepare the data**: Ensure the dataset (`HeartDisease.csv`) is available and correctly formatted. You may need to adjust the path to the CSV file in the R script.

3. **Run the R script**: Open the `r_code.R` file in an R environment (such as RStudio) and run the script.

```r
source("r_code.R")
```

The script will output various plots and model summaries, including:

- Logistic regression model summaries
- Marginal Model Plots (MMPs)
- Density plots for each predictor variable
- Stepwise model selection results

## Key Steps in the Analysis

### 1. **Initial Logistic Regression Model**
   - A logistic regression model is built using the original clinical variables to predict heart disease.

### 2. **Model Diagnostics**
   - Deviance and residuals are analyzed, and MMPs are generated to assess model fit.

### 3. **Density Plots**
   - The distributions of clinical variables are visualized for both groups (with and without heart disease).
   - Log-transformed density plots are also included for a better understanding of the data distribution.

### 4. **Log-Transformed Model**
   - A second logistic regression model is built using log-transformed variables to see if the transformations improve model fit.

### 5. **Stepwise Model Selection**
   - Using AIC (Akaike Information Criterion), a stepwise backward selection process is applied to identify the most significant predictors.

### 6. **Final Model**
   - The final logistic regression model is fitted, incorporating both the original and log-transformed variables.

## Results

The final model provides a set of coefficients that can be used to predict the probability of heart disease based on clinical indicators. The model performance is evaluated using AIC, deviance, and diagnostic plots.

## License

This project is open-source and available under the MIT License. 