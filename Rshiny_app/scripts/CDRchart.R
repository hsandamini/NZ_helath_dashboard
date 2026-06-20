# -----------------------------
# 1️⃣ Load libraries
# -----------------------------
library(ggplot2)
library(plotly)

# -----------------------------
# 2️⃣ Read your CSV file
# -----------------------------
CDR <- read.csv("datasets/CDR.csv")
# -----------------------------
# 3️⃣ Filter data from 1995 to 2025
# -----------------------------
cdr_recent <- subset(CDR, Year >= 1990 & Year <= 2025)

# -----------------------------
# 4️⃣ Create a static ggplot line chart
# -----------------------------
CDRchart <- ggplot(cdr_recent, aes(x = Year, y = CDR)) +
  geom_line(color = "red", size = 0.5) +
  geom_point(color = "darkred", size = 1.3) +
  labs(
    x = "Year",
    y = "Deaths per 1,000 People"
  ) +
  theme_minimal()

# Show the static plot
CDRchart


