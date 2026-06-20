# -----------------------------
# 1️⃣ Load necessary libraries
# -----------------------------
library(tidyverse)
library(ggplot2)
library(plotly)

# -----------------------------
# 2️⃣ Load life expectancy data from CSV
# -----------------------------
life_data <- read.csv("datasets/life_expectancy.csv")

# -----------------------------
# 3️⃣ Clean and prepare dataset
# -----------------------------
# No need to rename columns — they are already Year, Male, Female, Total
# Convert to long format for plotting
life_long <- life_data %>%
  pivot_longer(
    cols = c(Male, Female, Total),
    names_to = "Category",
    values_to = "LifeExpectancy"
  )

# -----------------------------
# 4️⃣ Plot combined chart
# -----------------------------
lifechart <- ggplot(life_long, aes(
  x = Year,
  y = LifeExpectancy,
  group = Category,
  color = Category,
  text = paste0("Year: ", Year, "<br>", Category, ": ", LifeExpectancy)
)) +
  geom_line(linewidth = 0.5) +   # use 'linewidth' instead of deprecated 'size'
  geom_point(size = 1.3) +
  scale_color_manual(values = c(Male = "darkblue", Female = "red", Total = "darkgreen")) +
  labs(
    x = "Year",
    y = "Life Expectancy (years)",
    color = "Category"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),
    axis.title = element_text(size = 12)
  )
lifechart
