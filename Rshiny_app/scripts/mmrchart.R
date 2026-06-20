# Install packages if not already installed


# Load library
library(plotly)

# Read CSV
maternal_mortality_ratio <- read.csv("datasets/maternal_mortality_ratio.csv", stringsAsFactors = FALSE)
# Create interactive line chart

mmr <- maternal_mortality_ratio 
mmrchart<- plot_ly(
  mmr, 
  x = ~Year, 
  y = ~Maternal.mortality.ratio, 
  type = 'scatter', 
  mode = 'lines+markers',           # lines + points
  line = list(color = 'blue', width = 2),
  marker = list(color = 'red', size = 6),
  text = ~paste("Year:", Year, "<br>MMR:", Maternal.mortality.ratio), # hover info
  hoverinfo = 'text'
) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Maternal Mortality Ratio (per 100,000 live births)"),
    hovermode = "closest"
  )

# Show the chart
mmrchart
