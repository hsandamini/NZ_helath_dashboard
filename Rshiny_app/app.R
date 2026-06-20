library(shiny)
library(shinydashboard)
library(ggplot2)   
library(plotly)   
library(readxl)  
library(readr)
library(scales)
library(tidyverse)
library(dplyr)
library(reshape2)


# Data
median_age <- read_excel("datasets/median_age.xlsx")
age_dep <- read.csv("datasets/age_dependancy_ratio.csv")
pop_pyramid <- read_excel("datasets/pop_pyramid.xlsx")
age_dist <- read.csv("datasets/age_dist.csv")
age_specific_fr <- read.csv("datasets/age_specific_fr.csv")
CBR <- read.csv("datasets/CBR.csv")
CDR <- read.csv("datasets/CDR.csv")
fertility_rates <- read.csv("datasets/fertility_rates.csv")
health_exp <- read.csv("datasets/health_exp.csv")
hospital_beds <- read.csv("datasets/hospital_beds.csv")
infant_mr <- read.csv("datasets/infant_mr.csv")
maternal_mortality_ratio <- read.csv("datasets/maternal_mortality_ratio.csv")
pop_density <- read.csv("datasets/pop_density.csv")
pop_growth_rate <- read.csv("datasets/pop_growth_rate.csv")
pop_total <- read.csv("datasets/pop_total.csv")
prevalence <- read.csv("datasets/prevalence.csv")
under5 <- read.csv("datasets/under_5_MR.csv")
urban_rural <- read.csv("datasets/urban_rural.csv")
life_data <- read.csv("datasets/life_expectancy.csv")

# Scripts
source("scripts/popdensitychart.R")
source("scripts/medianagechart.R")
source("scripts/CDRchart.R")
source("scripts/poptotalchart.R")
source("scripts/lifechart.R")
source("scripts/CBRchart.R")
source("scripts/urbanruralchart.R")
source("scripts/growthratechart.R")
source("scripts/infantmrchart.R")
source("scripts/mmrchart.R")
source("scripts/pyramidchart.R")
source("scripts/agedependancychart.R")
source("scripts/u5mrchart.R")
source("scripts/agespecificfrchart.R")
source("scripts/bedschart.R")
source("scripts/expchart.R")
source("scripts/TFRchart.R")
source("scripts/covidchart.R")
source("scripts/covidchart2.R")
source("scripts/agedistchart.R")
source("scripts/prevalancechart.R")

# Colors
tab_colors <- list(
  demo = "#1abc9c",
  fertility = "#3498db",
  mortality = "#e74c3c",
  health = "#9b59b6",
  covid = "#f39c12"
)

tab_bg_light <- list(
  demo = "#d0f0e0",
  fertility = "#cce5f6",
  mortality = "#f9d0d0",
  health = "#e6d0f0",
  covid = "#fef0d0"
)

# UI
ui <- dashboardPage(
  dashboardHeader(title = "NZ Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Demographics", tabName = "demo", icon = icon("users")),
      menuItem("Fertility", tabName = "fertility", icon = icon("baby")),
      menuItem("Mortality Indicators & Life Expectancy", tabName = "mortality", icon = icon("heartbeat")),
      menuItem("Health System", tabName = "health", icon = icon("hospital")),
      menuItem("Epidemiological Trends & Vaccination Coverage", tabName = "covid", icon = icon("syringe"))
    )
  ),
  
  dashboardBody(
    # CSS
    tags$head(tags$style(HTML(
      "
      .box {border-radius:12px;}
      /* Permanent sidebar tab colors */
      .sidebar-menu li a[data-value='demo'] {background-color:#1abc9c; color:white; font-weight:bold;}
      .sidebar-menu li a[data-value='fertility'] {background-color:#3498db; color:white; font-weight:bold;}
      .sidebar-menu li a[data-value='mortality'] {background-color:#e74c3c; color:white; font-weight:bold;}
      .sidebar-menu li a[data-value='health'] {background-color:#9b59b6; color:white; font-weight:bold;}
      .sidebar-menu li a[data-value='covid'] {background-color:#f39c12; color:white; font-weight:bold;}
      "
    ))),
    
    tabItems(
      tabItem(tabName = "overview",
              
              # Intro box
              fluidRow(
                box(
                  width = 12,
                  solidHeader = TRUE,
                  background = "light-blue",
                  style = "border-radius:10px;",
                  div(
                    style="padding:15px; font-size:16px; line-height:1.5;",
                    "Welcome to the New Zealand Health and Demographics Dashboard. 
               This dashboard provides an overview of key demographic and health indicators in New Zealand,
               helping users explore population trends, fertility, mortality, and health outcomes across regions and groups."
                  )
                )
              ),
              
              # KPI box
              fluidRow(
                valueBoxOutput("total_pop_box", width = 3),
                valueBoxOutput("growth_rate_box", width = 3),
                valueBoxOutput("CBR_box", width = 3),
                valueBoxOutput("TFR_box", width = 3),
                valueBoxOutput("CDR_box", width = 3)
              ),
              
              # Note box
              fluidRow(
                box(
                  width = 12,
                  solidHeader = TRUE,
                  background = "light-blue",
                  style = "border-radius:10px;",
                  div(
                    style="padding:15px; font-size:14px; line-height:1.5;",
                    "All plots and figures in this dashboard are generated from the most recent official datasets for New Zealand. 
               Users can interact with the plots to explore the data, and to obtain plots for a specific year range, click the zoom icon on each chart."
                  )
                )
              )
      ),
      # Demographics
      tabItem(tabName = "demo",
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Total Population"),
                  plotlyOutput("poptotal")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Population Density by Region (2023)"),
                  plotlyOutput("popdensity")
                )
              ),
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Median Age"),
                  plotlyOutput("medianage")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Population Growth Rate"),
                  plotlyOutput("growthrate")
                )
              ),
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Urban vs Rural Population"),
                  plotlyOutput("urbanrural")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Age Distribution (2023)"),
                  plotlyOutput("agedist")
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  div(style=paste0("background-color:", tab_colors$demo, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Population Pyramid 2025"),
                  plotlyOutput("pyramid")
                )
              )
      ),
      
      # Fertility
      tabItem(tabName = "fertility",
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$fertility, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Crude Birth Rate"),
                  plotlyOutput("CBR")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$fertility, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Total Fertility Rate"),
                  plotlyOutput("TFR")
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  div(style=paste0("background-color:", tab_colors$fertility, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Age-specific Fertility Rate"),
                  plotlyOutput("agespecificfr")
                )
              )
      ),
      
      # Mortality
      tabItem(tabName = "mortality",
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$mortality, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Crude Death Rate"),
                  plotlyOutput("CDR")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$mortality, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Infant Mortality Rate"),
                  plotlyOutput("infantmr")
                )
              ),
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$mortality, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Under-5 Mortality Rate"),
                  plotlyOutput("u5mr")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$mortality, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Maternal Mortality Ratio"),
                  plotlyOutput("mmr")
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  div(style=paste0("background-color:", tab_colors$mortality, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Life Expectancy at Birth"),
                  plotlyOutput("life")
                )
              )
      ),
      
      # Health system
      tabItem(tabName = "health",
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$health, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Hospital Beds per 1000 people"),
                  plotlyOutput("beds")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$health, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Current Health Expenditure per Capita (US$)"),
                  plotlyOutput("exp")
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  div(style=paste0("background-color:", tab_colors$health, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Age Dependency Ratio"),
                  plotlyOutput("agedep")
                )
              )
      ),
      
      # Covid
      tabItem(tabName = "covid",
              fluidRow(
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$covid, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "COVID-19 Vaccinations"),
                  plotlyOutput("covid1")
                ),
                box(
                  width = 6,
                  div(style=paste0("background-color:", tab_colors$covid, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Second Booster Uptake by Age Group"),
                  plotlyOutput("covid2")
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  div(style=paste0("background-color:", tab_colors$covid, "; color:white; font-weight:bold; text-align:center; padding:6px;"),
                      "Disease Prevalence Trends"),
                  plotlyOutput("prevalance")
                )
              )
      )
    )
  )
)

# Server
server <- function(input, output) {
  
  renderPlotlyLight <- function(plot, tab_name){
    ggplotly(plot) %>%
      layout(
        paper_bgcolor = tab_bg_light[[tab_name]],
        plot_bgcolor = tab_bg_light[[tab_name]]
      )
  }
  
  
  # Overview KPI boxes
  output$total_pop_box <- renderValueBox({
    valueBox(
      format(5287500, big.mark = ","), 
      "Total Population (2024)", 
      icon = icon("users"), 
      color = "green"
    )
  })
  
  output$growth_rate_box <- renderValueBox({
    valueBox(
      paste0(1.6687, "%"), 
      "Population Growth Rate (2024)", 
      icon = icon("chart-line"), 
      color = "blue"
    )
  })
  
  output$CBR_box <- renderValueBox({
    valueBox(
      10.86, 
      "Crude Birth Rate (2023)", 
      icon = icon("baby"), 
      color = "purple"
    )
  })
  
  output$TFR_box <- renderValueBox({
    valueBox(
      1.56, 
      "Total Fertility Rate (2023)", 
      icon = icon("baby-carriage"), 
      color = "orange"
    )
  })
  
  output$CDR_box <- renderValueBox({
    valueBox(
      7.39, 
      "Crude Death Rate (2025)", 
      icon = icon("heartbeat"), 
      color = "red"
    )
  })
  # DEMOGRAPHICS
  output$poptotal <- renderPlotly({ renderPlotlyLight(poptotalchart, "demo") })
  output$popdensity <- renderPlotly({ renderPlotlyLight(popdensitychart, "demo") })
  output$medianage <- renderPlotly({ renderPlotlyLight(medianagechart, "demo") })
  output$growthrate <- renderPlotly({ renderPlotlyLight(growthratechart, "demo") })
  output$urbanrural <- renderPlotly({ renderPlotlyLight(urbanruralchart, "demo") })
  output$agedist <- renderPlotly({ renderPlotlyLight(agedistchart, "demo") })
  output$pyramid <- renderPlotly({ renderPlotlyLight(pyramidchart, "demo") })
  
  # FERTILITY
  output$CBR <- renderPlotly({ renderPlotlyLight(CBRchart, "fertility") })
  output$TFR <- renderPlotly({ renderPlotlyLight(TFRchart, "fertility") })
  output$agespecificfr <- renderPlotly({ renderPlotlyLight(agespecificfrchart, "fertility") })
  
  # MORTALITY
  output$CDR <- renderPlotly({ renderPlotlyLight(CDRchart, "mortality") })
  output$infantmr <- renderPlotly({ renderPlotlyLight(infantmrchart, "mortality") })
  output$u5mr <- renderPlotly({ renderPlotlyLight(u5mrchart, "mortality") })
  output$mmr <- renderPlotly({ renderPlotlyLight(mmrchart, "mortality") })
  output$life <- renderPlotly({ renderPlotlyLight(lifechart, "mortality") })
  
  # HEALTH
  output$beds <- renderPlotly({ renderPlotlyLight(bedschart, "health") })
  output$exp <- renderPlotly({ renderPlotlyLight(expchart, "health") })
  output$agedep <- renderPlotly({ renderPlotlyLight(agedependancychart, "health") })
  
  # COVID
  output$covid1 <- renderPlotly({ renderPlotlyLight(covidchart, "covid") })
  output$covid2 <- renderPlotly({ renderPlotlyLight(covidchart2, "covid") })
  output$prevalance <- renderPlotly({ renderPlotlyLight(prevalancechart, "covid") })
  
}

shinyApp(ui, server)
