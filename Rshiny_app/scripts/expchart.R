# Load packages
library(ggplot2)
library(readr)

# Read CSV
health_exp <- read.csv("datasets/health_exp.csv")

names(health_exp)



library(plotly)

expchart <- plot_ly(
  health_exp,
  x = ~Year,
  y = ~Current.health.expenditure.per.capita..current.US..,
  type = 'scatter',
  mode = 'lines+markers',
  line = list(color = 'steelblue'),
  marker = list(color = 'darkred', size = 6),
  hoverinfo = 'text',
  text = ~paste(
    "Year:", Year,
    "<br>Expenditure: $",
    round(Current.health.expenditure.per.capita..current.US.., 2)
  )
) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Expenditure per Capita (US$)")
  )
expchart
