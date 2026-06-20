# 🏥 R Shiny Dashboard

An interactive R Shiny web application designed to visualize and analyze healthcare data trends. This project provides dynamic visual tools to help researchers and healthcare professionals track medical metrics efficiently.

## 🚀 Key Features
* **Interactive Data Visualization:** Filter statistics dynamically based on regional, urban/rural, or demographic variables.
* **Urban & Rural Insights:** Compare specific health trends using custom analytical charts (`urbanruralchart.R`).
* **Automated Data Cleaning:** Built-in R scripts to automatically parse, clean, and format raw medical input logs.

## 🛠️ Tech Stack & Packages
This dashboard is entirely built using **R** and the following frameworks:
* `shiny` - For the interactive web application interface
* `shinydashboard` - For the structured administrative layout
* `tidyverse` - For modern data manipulation and cleaning
* `ggplot2` - For generating custom statistical plots and graphics

## 💻 How to Run This Dashboard Locally

To launch this Shiny application on your local computer, make sure you have **R** and **RStudio** installed, and then follow these simple steps:

1. Open your **RStudio** console.
2. Install the necessary library packages by running the following command:
   ```R
   install.packages(c("shiny", "shinydashboard", "tidyverse", "ggplot2"))
   ```
3. Run the application directly from this GitHub repository using this command:
   ```R
   shiny::runGitHub("NZ_helath_dashboard", "hsandamini")
   ```

---
*Created and maintained by [@hsandamini](https://github.com).*
