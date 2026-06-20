# -----------------------------
# 1️⃣ Install and load library
# -----------------------------

library(plotly)

# -----------------------------
# 2️⃣ Read your CSV
# -----------------------------
pop_growth_rate <- read.csv("datasets/pop_growth_rate.csv")

# -----------------------------
# 3️⃣ Create interactive line chart
# -----------------------------
growthratechart <- plot_ly(
  data = pop_growth_rate,
  x = ~Year,
  y = ~Population.growth.rate,
  type = 'scatter',
  mode = 'lines+markers',       # Lines connecting points + markers
  line = list(color = 'steelblue', width = 2),
  marker = list(color = 'red', size = 6),
  text = ~paste("Year:", Year, "<br>Growth Rate:", Population.growth.rate),
  hoverinfo = 'text'
) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Population Growth Rate (%)"),
    hovermode = 'closest'
  )

growthratechart
