
library(dplyr)
library(ggplot2)
library(tidyr)
library(readxl)


pop_pyramid <- read_excel("datasets/pop_pyramid.xlsx")

df <- pop_pyramid 
str(df)

age_labels <- paste(seq(0, 95, 5), seq(4, 99, 5), sep = "-")

df <- df %>%
  mutate(
    AgeGroup = cut(Age,
                   breaks = seq(0, 100, 5),
                   right = FALSE,
                   labels = age_labels)
  )



pyramid_data <- df %>%
  group_by(Sex, AgeGroup) %>%
  summarise(Population = sum(Value), .groups = "drop")



pyramid_data <- pyramid_data %>%
  complete(Sex, AgeGroup, fill = list(Population = 0))


total_pop <- sum(pyramid_data$Population)

pyramid_data <- pyramid_data %>%
  mutate(Percentage = (Population / total_pop) * 100)




pyramid_data <- pyramid_data %>%
  mutate(Percentage = ifelse(Sex == "Male",
                             -Percentage,
                             Percentage))



pyramid_data$AgeGroup <- factor(
  pyramid_data$AgeGroup,
  levels = age_labels
)



pyramidchart <- ggplot(pyramid_data, aes(x = AgeGroup, y = Percentage, fill = Sex)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.2) +
  
  
  coord_flip() +
  scale_y_continuous(labels = function(x) paste0(abs(round(x,1)), "%")) +
  scale_fill_manual(values = c("Male" = "#4B8BBE", "Female" = "#E07A8A")) +
  labs(
    x = "Age Group",
    y = "Percentage of Population"
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    panel.grid.major.y = element_blank()
  )

pyramidchart

