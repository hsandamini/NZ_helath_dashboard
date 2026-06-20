library(ggplot2)
library(reshape2)
library(scales)

# Data: define segments
data <- data.frame(
  Category = c("Total Doses"),
  Remaining_Primary = 14113389 - (2789527 + 1131078),
  First_Booster = 2789527 - 1131078,
  Second_Booster = 1131078
)

# Convert to long format for stacked bar
data_long <- melt(data, id.vars = "Category")

# Plot
covidchart <- ggplot(data_long, aes(x = Category, y = value, fill = variable)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = scales::comma(value)), 
            position = position_stack(vjust = 0.5), color = "white", size = 5) +
  scale_fill_manual(values = c("Remaining_Primary" = "pink", 
                               "First_Booster" = "steelblue", 
                               "Second_Booster" = "forestgreen"),
                    labels = c("Primary Doses (no booster)", "First Booster", "Second Booster")) +
  scale_y_continuous(labels = scales::comma) +  # <- full numbers on y-axis
  labs(
       y = "Number of Doses", x = "",
       fill = "Dose Type") +
  theme_minimal()

covidchart



