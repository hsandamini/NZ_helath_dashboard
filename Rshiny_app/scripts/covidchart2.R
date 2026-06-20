library(plotly)

age_groups <- c("30-34", "35-49", "50-64", "65+")
second_booster <- c(20.0, 21.9, 39.8, 71.9)  # same length as age_groups

covidchart2 <- plot_ly(
  x = ~age_groups, 
  y = ~second_booster, 
  type = 'bar',
  text = ~paste0(second_booster, "%"), 
  textposition = 'auto',
  marker = list(color = c('lightblue','skyblue','deepskyblue','navy'))
) %>%
  layout(
    xaxis = list(title = "Age Group"),
    yaxis = list(title = "Uptake (%)", range = c(0,100))
  )

covidchart2
