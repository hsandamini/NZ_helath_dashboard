library(ggplot2)
library(plotly)

# Read data
CBR <- read.csv("datasets/CBR.csv")


# Convert DATE
CBR$DATE <- as.Date(CBR$DATE, format = "%m/%d/%Y")
CBR$Year <- as.numeric(format(CBR$DATE, "%Y"))

# Filter data from 1996
CBR_1996 <- subset(CBR, Year >= 1996)

# Plot
CBRchart <- ggplot(CBR_1996, aes(x = Year, y = CBR, group = 1,
                                 text = paste0("Year: ", Year,
                                               "<br>CBR: ", CBR))) +
  geom_line(color = "darkblue", linewidth = 0.5) +
  geom_point(color = "blue", size = 1.5) +
  labs(
    x = "Year",
    y = "Births per 1,000 People"
  ) +
  theme_minimal()


CBRchart