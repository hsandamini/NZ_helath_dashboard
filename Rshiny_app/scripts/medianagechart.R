library(readxl)
library(ggplot2)
library(dplyr)



# Read Excel file
median_age <- read_excel("datasets/median_age.xlsx")

# Filter only up to 2020 (keep all years)
filtered_data <- median_age %>%
  filter(Year <= 2020)

# Plot
medianagechart <- ggplot(filtered_data, aes(x = Year, y = `Median age, total`)) +
  geom_line(color = "steelblue", size = 0.7) +
  geom_point(color = "blue", size = 1) +
  labs(
       x = "Year", y = "Median Age") +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )

medianagechart

