# Load libraries
library(ggplot2)
library(dplyr)

# Create data
data <- data.frame(
  Year = c(
    2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,  # Stroke
    2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,      # Heart_failure
    2011:2024, # High_bloodpressure
    2011:2024  # Diabetes
  ),
  Disease = c(
    rep("Stroke",14),
    rep("Heart_failure",13),
    rep("High_bloodpressure",14),
    rep("Diabetes",14)
  ),
  Prevalence = c(
    # Stroke
    1.7,2,1.7,1.6,1.5,1.5,1.5,1.6,1.6,1.6,1.6,2.1,1.9,2,
    # Heart_failure
    2.1,2,1.9,2,2.1,1.9,1.9,1.8,1.6,1.8,2.9,2.4,2.1,
    # High_bloodpressure
    16.1,15.9,15.8,16.2,16.4,16.5,16.4,15.9,15.4,16.7,17.5,16.6,17.7,16.9,
    # Diabetes
    5.6,5.8,5.4,6.1,5.7,5.6,5.9,5.7,5.6,5.4,5.4,5.9,6.5,6.1
  )
)

# Plot line chart
prevalancechart <- ggplot(data, aes(x=Year, y=Prevalence, color=Disease)) +
  geom_line(size=1.2) +
  geom_point(size=2) +
  labs(
       x="Year", y="Prevalence (%)") +
  theme_minimal() +
  scale_color_brewer(palette="Set2") +
  scale_x_continuous(breaks=2011:2024)

prevalancechart
