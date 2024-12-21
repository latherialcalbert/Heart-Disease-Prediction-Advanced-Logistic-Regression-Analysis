# Heart Disease Prediction Analysis
# Author: Latherial Calbert and Natalie Huey
# Date: December 2024

# Load required libraries
library(readr)
library(car)

# Read and prepare data
HeartDisease <- read_csv("Desktop/HeartDisease.csv")
View(HeartDisease)
attach(HeartDisease)

# Initial logistic regression model
original <- glm(HeartDisease ~ x1 + x2 + x3 + x4 + x5, 
                data = HeartDisease, 
                family = binomial)
summary(original)

# Model diagnostics
out <- summary(original)
obs <- out$deviance
df <- out$df.residual
pvalue <- 1 - pchisq(obs, df)
mmps(original, layout=c(2,3))

# Density plots for original variables
variables <- c("x1", "x2", "x3", "x4", "x5")

for (var in variables) {
  # Extract current variable
  current_var <- HeartDisease[[var]]
  
  # Basic density plot
  plot(density(current_var),
       main = paste("Density Plot of", var),
       xlab = var,
       col = "black",
       lwd = 2)
  
  # Compare groups
  plot(density(current_var[HeartDisease$HeartDisease == 0]),
       col = "blue",
       main = paste("Density Plot of", var, "by Groups"),
       xlab = var,
       lwd = 2)
  lines(density(current_var[HeartDisease$HeartDisease == 1]),
        col = "red",
        lwd = 2)
  
  # Add legend
  legend("topright",
         legend = c("No Heart Disease", "Heart Disease"),
         col = c("blue", "red"),
         lwd = 2)
}

# Density plots for log-transformed variables
for (var in variables) {
  # Log transform
  log_var <- log(HeartDisease[[var]])
  
  # Basic density plot
  plot(density(log_var),
       main = paste("Density Plot of log(", var, ")", sep=""),
       xlab = paste("log(", var, ")", sep=""),
       col = "black",
       lwd = 2)
  
  # Compare groups
  plot(density(log_var[HeartDisease$HeartDisease == 0]),
       col = "blue",
       main = paste("Density Plot of log(", var, ") by Groups", sep=""),
       xlab = paste("log(", var, ")", sep=""),
       lwd = 2)
  lines(density(log_var[HeartDisease$HeartDisease == 1]),
        col = "red",
        lwd = 2)
  
  # Add legend
  legend("topright",
         legend = c("No Heart Disease", "Heart Disease"),
         col = c("blue", "red"),
         lwd = 2)
}

# Model with log transformations
logmodel <- glm(HeartDisease ~ x1 + x2 + x3 + x4 + x5 + 
                  log(x1) + log(x2) + log(x4) + log(x5),
                data = HeartDisease, 
                family = binomial)
mmps(logmodel, layout=c(2,3))
summary(logmodel)

# Model selection
null <- glm(HeartDisease ~ 0, 
            data = HeartDisease, 
            family = "binomial")
reg1b <- step(logmodel, 
              scope = list(lower = null, upper = logmodel),
              direction = "backward")

# Final model
final <- glm(HeartDisease ~ x1 + x3 + x4 + 
               log(x1) + log(x2) + log(x4) + log(x5),
             data = HeartDisease, 
             family = binomial)
summary(final)
mmps(final, layout=c(3,3))