library(plotly)
library(readr)

age_dep <- read.csv("datasets/age_dependancy_ratio.csv")


names(age_dep)
agedependancychart <- plot_ly(
  age_dep,
  x = ~year,
  y = ~`Age.dependancy.ratio`,
  type = 'scatter',
  mode = 'lines+markers',
  line = list(color = "blue", width = 1.5),      # line color
  marker = list(color = "darkblue", size = 4),      # point color
  hovertemplate = "Year: %{x}<br>Ratio: %{y:.2f}%<extra></extra>"
) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Dependency Ratio (%)")
  )

agedependancychart

