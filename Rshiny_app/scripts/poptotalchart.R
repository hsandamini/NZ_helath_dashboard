# ---------------- Load Libraries ----------------
library(ggplot2)
library(readr)
library(plotly)
library(scales)

# ---------------- Read CSV ----------------
# Read the population CSV from datasets folder
pop_total <- read.csv("datasets/pop_total.csv", stringsAsFactors = FALSE)

# Check column names
colnames(pop_total)
# Example output: "Year" "Totalpopulation"

# ---------------- Clean Data ----------------
# Convert population column to numeric after removing commas
pop_total$Totalpopulation <- as.numeric(gsub(",", "", pop_total$Totalpopulation))

# Optional: check for NAs
if (sum(is.na(pop_total$Totalpopulation)) > 0) {
  warning("There are NA values in Totalpopulation after conversion.")
}

# Copy for plotting
pop_data <- pop_total

# ---------------- Create ggplot ----------------
poptotalchart <- ggplot(pop_data, aes(x = Year, y = Totalpopulation)) +
  geom_line(color = "steelblue", size = 0.5) +           # line
  geom_point(color = "blue", size = 1) +           # points
  labs(,
       x = "Year",
       y = "Total Population") +
  theme_minimal()

poptotalchart
