# Install packages if not already installed

# Load libraries
library(plotly)
library(ggplot2)

# Read your CSV file
infant_mr <- read.csv("datasets/infant_mr.csv")

# Make sure column names match
# Your CSV columns: Year, Infant MR
# Replace space with dot if needed
colnames(infant_mr) <- c("Year", "Infant_MR")

# Create ggplot object
infantmrchart <- ggplot(infant_mr, aes(x = Year, y = Infant_MR)) +
  geom_line(color = "blue", size = 0.5) +       # Line connecting points
  geom_point(color = "darkblue", size = 1) +       # Points for each year
  xlab("Year") +
  ylab("Deaths per 1,000 Live Births") +
  theme_minimal()


infantmrchart
