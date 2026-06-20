# Load libraries
library(readr)
library(ggplot2)
library(plotly)



under5 <- read.csv("datasets/under_5_MR.csv")

u5mr <- under5
# Create ggplot first
u5mrchart <- ggplot(u5mr, aes(x = year, y = `under.5.MR`)) +
  geom_line(color = "forestgreen", size = 0.5) +   # Line for trend
  geom_point(color = "darkgreen", size = 1.1) +     # Points for each year
  labs(
    x = "Year",
    y = "Under5 MortalityRate(per 1,000 livebirths)"
  ) +
  theme_minimal(base_size = 14)

u5mrchart

