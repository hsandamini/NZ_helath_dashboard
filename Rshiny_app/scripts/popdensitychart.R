library(tidyverse)

# -----------------------------
# Step 1: Create dataset
# -----------------------------
nz <- tibble(
  Region = c("Northland", "Auckland", "Waikato", "Bay of Plenty", "Gisborne",
             "Hawke’s Bay", "Taranaki", "ManawatūWhanganui", "Wellington",
             "Tasman", "Nelson", "Marlborough", "West Coast", "Canterbury",
             "Otago", "Southland"),
  Land_area_km2 = c(12504, 4941, 23900, 12072, 8385,
                    14138, 7254, 22221, 8049,
                    9616, 422, 10458, 23245, 44504,
                    31186, 31196),
  Population_2023 = c(203900, 1739300, 522600, 354100, 52600,
                      184800, 128700, 260900, 550500,
                      59400, 55600, 52200, 32900, 666300,
                      254600, 103900)
)

# -----------------------------
# Step 2: Compute density
# -----------------------------
nz <- nz %>%
  mutate(Density = Population_2023 / Land_area_km2,
         Highlight = ifelse(Region == "Auckland", "Auckland", "Other"))

# -----------------------------
# Step 3: Plot horizontal bar chart
# -----------------------------
popdensitychart <- ggplot(nz %>% arrange(Density), 
                          aes(x = Density, y = reorder(Region, Density), fill = Highlight)) +
  geom_col(show.legend = FALSE) +  # remove legend
  scale_fill_manual(values = c("Auckland" = "orange", "Other" = "steelblue")) +
  labs(
       x = "People per km²",
       y = "Region") +
  theme_minimal() +
  theme(axis.text = element_text(size = 10),
        plot.title = element_text(size = 14, face = "bold")) +
  coord_cartesian(xlim = c(0, max(nz$Density)*1.1))

popdensitychart