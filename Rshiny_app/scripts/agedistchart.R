# Install packages (run once)

# Load libraries
library(ggplot2)
library(readr)
library(scales)

# Read CSV
age_dist <- read.csv("datasets/age_dist.csv")

# Clean Age_group (remove hidden spaces)
age_dist$Age_group <- trimws(age_dist$Age_group)

# Convert Number_of_people to numeric (remove commas)
age_dist$Number_of_people <- as.numeric(gsub(",", "", age_dist$Number_of_people))

# Check unique values (optional for debugging)
print(unique(age_dist$Age_group))

# Convert Age_group to ordered factor
age_dist$Age_group <- factor(age_dist$Age_group, levels = c(
  "0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39",
  "40-44","45-49","50-54","55-59","60-64","65-69","70-74",
  "75-79","80-84","85-89","90+"
))

# Remove any rows with NA (just in case)
age_dist <- na.omit(age_dist)

# Create horizontal bar chart with formatted X-axis
agedistchart <- ggplot(age_dist, aes(y = Age_group, x = Number_of_people)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  scale_x_continuous(labels = comma, breaks = seq(0, 400000, by = 100000)) +
  labs(
    x = "Number of People",
    y = "Age Group"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

agedistchart
