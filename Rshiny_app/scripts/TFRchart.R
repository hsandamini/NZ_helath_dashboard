
library(ggplot2)
library(plotly)
library(dplyr)

# 2. Read your CSV file
fertility_rates <- read.csv("datasets/fertility_rates.csv")

# 3. Convert observation_date to Date type
fertility_rates$observation_date <- as.Date(fertility_rates$observation_date, format="%m/%d/%Y")

# 4. Filter data from 1980 onwards
fertility_rates_1980 <- fertility_rates %>%
  filter(observation_date >= as.Date("1980-01-01"))

# 5. Create ggplot line chart
TFRchart <- ggplot(fertility_rates_1980, aes(x = observation_date, y = TFR)) +
  geom_line(color = "darkblue", size = 0.5) +
  geom_point(aes(text = paste("Year:", format(observation_date, "%Y"), "<br>TFR:", TFR)),
             color = "blue", size = 1.2) +
  labs(
       x = "Year",
       y = "TFR") +
  theme_minimal()



TFRchart
