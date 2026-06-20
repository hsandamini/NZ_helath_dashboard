# Install and load packages
library(plotly)
library(dplyr)

# Read CSV

hospital_beds <- read.csv("datasets/hospital_beds.csv")

colnames(hospital_beds) <- c("Year", "Beds")

# Convert to numeric
hospital_beds$Year <- as.numeric(hospital_beds$Year)
hospital_beds$Beds <- as.numeric(hospital_beds$Beds)

# Mark missing and reported data
hospital_beds <- hospital_beds %>%
  mutate(Type = ifelse(is.na(Beds), "Missing", "Reported"))

# Separate datasets
reported <- hospital_beds %>% filter(Type == "Reported")
missing <- hospital_beds %>% filter(Type == "Missing")

# Create interactive plot
bedschart <- plot_ly() %>%
  # Blue line connecting reported data
  add_lines(data = reported, x = ~Year, y = ~Beds, name = "Trend Line", line = list(color = 'steelblue')) %>%
  # Red points for reported data
  add_markers(data = reported, x = ~Year, y = ~Beds, name = "Reported Data",
              marker = list(color = 'red', size = 5)) %>%
  # Gray X markers for missing years
  add_markers(data = missing, x = ~Year, y = 0, name = "Missing Year",
              marker = list(color = 'gray', size = 8, symbol = 'x')) %>%
  layout(
         xaxis = list(title = "Year"),
         yaxis = list(title = "Hospital Beds per 1,000 people"),
         legend = list(title = list(text = "<b>Legend</b>")))

# Show plot
bedschart

