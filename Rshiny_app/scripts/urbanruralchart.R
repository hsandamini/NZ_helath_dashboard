# -----------------------------
# 1️⃣ Load necessary libraries
# -----------------------------
library(tidyverse)
library(plotly)

# -----------------------------
# 2️⃣ Read the CSV file
# -----------------------------
urban_rural <- read.csv("datasets/urban_rural.csv", stringsAsFactors = FALSE)

# -----------------------------
# 3️⃣ Filter data from 1990
# -----------------------------
urban_rural <- urban_rural %>%
  filter(Year >= 1995)

# -----------------------------
# 4️⃣ Convert to long format
# -----------------------------
urban_rural_long <- urban_rural %>%
  pivot_longer(cols = c(Urban.population, Rural.population),
               names_to = "Type",
               values_to = "Population")

# -----------------------------
# 5️⃣ Create stacked bar chart with spacing
# -----------------------------
urbanruralchart <- ggplot(urban_rural_long, 
            aes(x = factor(Year), y = Population, fill = Type,
                text = paste("Year:", Year,
                             "<br>Type:", Type,
                             "<br>Population:", Population))) +
  geom_bar(stat = "identity", width = 0.6) +   # 👈 controls spacing
  scale_fill_manual(values = c("Urban.population" = "steelblue", 
                               "Rural.population" = "orange")) +
  labs(
       x = "Year",
       y = "Population",
       fill = "Population Type") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


urbanruralchart
