# ---------------------------
# Load Libraries
# ---------------------------
library(tidyverse)
library(plotly)

# ---------------------------


# ---------------------------
# Load Dataset
# ---------------------------
age_specific_fr <- read.csv("datasets/age_specific_fr.csv")
asfr <- age_specific_fr

# ---------------------------
# Convert to Long Format
# ---------------------------
asfr_long <- asfr %>%
  pivot_longer(
    cols = -Year,
    names_to = "AgeGroup",
    values_to = "FertilityRate"
  )

# ---------------------------
# Order Age Groups
# ---------------------------
age_levels <- c("15-19","20-24","25-29","30-34","35-39","40-44","45-49")
asfr_long$AgeGroup <- factor(asfr_long$AgeGroup, levels = age_levels)

# ---------------------------
# Filter Selected Years
# ---------------------------
years_to_plot <- c(1985, 1995, 2005, 2015, 2025)
asfr_filtered <- filter(asfr_long, Year %in% years_to_plot)

# ---------------------------
# Convert AgeGroup to Numeric Midpoints
# ---------------------------
age_mid <- c(17, 22, 27, 32, 37, 42, 47)  # midpoints for plotting
asfr_filtered$AgeMid <- rep(age_mid, times = length(years_to_plot))

# ---------------------------
# Define Custom Colors
# ---------------------------
custom_colors <- c(
  "1985" = "#1b9e77",  # green
  "1995" = "#d95f02",  # orange
  "2005" = "darkblue", # dark blue
  "2015" = "#e7298a",  # pink
  "2025" = "green"     # lime
)

# ---------------------------
# 1️⃣ Static Line Chart with Clear Trends
# ---------------------------
agespecificfrchart <- ggplot(asfr_filtered,
                             aes(x = AgeMid, y = FertilityRate,
                                 group = Year, color = as.factor(Year))) +
  geom_line(size = 1.2) +        # thicker line
  geom_point(size = 3) +         # show points
  scale_x_continuous(breaks = age_mid, labels = age_levels) +  # show age labels
  scale_color_manual(values = custom_colors) +
  labs(
       x = "Age Group",
       y = "Fertility Rate (per 1,000 women)",
       color = "Year") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

# Display static chart
agespecificfrchart

