library(shiny)
library(ggplot2)
library(dplyr)

# Load the Airbnb data 
airbnb_data <-load("C:/Users/Nopchanok/OneDrive/Desktop/DSTI/R/Project R/AirBnB (1).Rdata")

# Define the UI
ui <- fluidPage(
  titlePanel("Airbnb Data Exploration"),
  tabPanel("Price Feature Relations",
           sidebarLayout(
             
             sidebarPanel(
               titlePanel(
                 h2("Relationship between price and apartment features listed", align = "center")
               ),
               column(12, align="center",
                      selectInput(inputId="pricefeatures",label="Choose Arrondissement to Analyse",choices = c("Analysis by Property Type"="property_type",
                                                                                                               "Analysis by Room Type"="room_type", "Analysis by Bedrooms quantity"="bedrooms" ),
                                  ,selected = "1", multiple = F))),
             
             mainPanel(
               
               plotOutput(outputId = "pricefeatures"),
             )
             
           ),
           
  
             
  tabPanel("Price Per Arrondissement time series",
           
           sidebarLayout(
             
             sidebarPanel(
               fluidRow(
                 titlePanel(
                   h2("Price Per Arrondissement time series", align = "center")
                 ),
                 column(12, align="center",
                        numericInput("rangedata", "Observations total data: 657051", 10000, min = 1000, max = 657051),
                        verbatimTextOutput("value")
                 ),
                 column(12, align="center",
                        selectInput(inputId="arrondissement",label="Choose Arrondissement to Analyse",choices = c("Arrondissement 1"="01",
                                                                                                                  "Arrondissement 2"="02",
                                                                                                                  "Arrondissement 3"="03",
                                                                                                                  "Arrondissement 4"="04",
                                                                                                                  "Arrondissement 5"="05",
                                                                                                                  "Arrondissement 6"="06",
                                                                                                                  "Arrondissement 7"="07",
                                                                                                                  "Arrondissement 8"="08",
                                                                                                                  "Arrondissement 9"="09",
                                                                                                                  "Arrondissement 10"="10",
                                                                                                                  "Arrondissement 11"="11",
                                                                                                                  "Arrondissement 12"="12",
                                                                                                                  "Arrondissement 13"="13",
                                                                                                                  "Arrondissement 14"="14",
                                                                                                                  "Arrondissement 15"="15",
                                                                                                                  "Arrondissement 16"="16",
                                                                                                                  "Arrondissement 17"="17",
                                                                                                                  "Arrondissement 18"="18",
                                                                                                                  "Arrondissement 19"="19",
                                                                                                                  "Arrondissement 20"="20",
                                                                                                                  "All Arrondissement"="All Arrondissement"), selected = "Arrondissement 1",multiple = F))),
               
               
               column(12, align="center", checkboxGroupInput(inputId = "year", label = "Select Years to analyse", choices= c("2009"="2009",
                                                                                                                             "2010"="2010",
                                                                                                                             "2011"="2011",
                                                                                                                             "2012"="2012",
                                                                                                                             "2013"="2013",
                                                                                                                             "2014"="2014",
                                                                                                                             "2015"="2015",
                                                                                                                             "2016"="2016"
               ),selected = "2016")),
               
             ),
             mainPanel(
               
               plotOutput(outputId = "arrondissementplot"),
             )
             
           )
           
  ),
  tabPanel("Number of apartments by host",
           sidebarLayout(
             
             sidebarPanel(
               
               titlePanel(
                 h1("Number of apartments by host", align = "center"),
                 
               ),
               column(12, align="center",
                      numericInput("hostrangedata", "Group by quantity of apartments and quantity of host, total sample data: 53", 53, min = 1, max = 53),
                      verbatimTextOutput("hostrangedatavalue")
               ),
             ),
             mainPanel(
               
               plotOutput(outputId = "hostplot"),
             )
             
           )
           
  ),
  tabPanel("Renting Price mean per Arrondissement",
           sidebarLayout(
             
             sidebarPanel(
               titlePanel(
                 h2("Renting mean price per Arrondissement", align = "center")
               ),
               column(12, align="center",
                      checkboxGroupInput(inputId="arrondissementprice",label="Choose Arrondissement to Analyse",choices = c("Arrondissement 1"="01",
                                                                                                                            "Arrondissement 2"="02",
                                                                                                                            "Arrondissement 3"="03",
                                                                                                                            "Arrondissement 4"="04",
                                                                                                                            "Arrondissement 5"="05",
                                                                                                                            "Arrondissement 6"="06",
                                                                                                                            "Arrondissement 7"="07",
                                                                                                                            "Arrondissement 8"="08",
                                                                                                                            "Arrondissement 9"="09",
                                                                                                                            "Arrondissement 10"="10",
                                                                                                                            "Arrondissement 11"="11",
                                                                                                                            "Arrondissement 12"="12",
                                                                                                                            "Arrondissement 13"="13",
                                                                                                                            "Arrondissement 14"="14",
                                                                                                                            "Arrondissement 15"="15",
                                                                                                                            "Arrondissement 16"="16",
                                                                                                                            "Arrondissement 17"="17",
                                                                                                                            "Arrondissement 18"="18",
                                                                                                                            "Arrondissement 19"="19",
                                                                                                                            "Arrondissement 20"="20",
                                                                                                                            "All Arrondissement"="All"), selected = "All"))),
             
             
             
             
             mainPanel(
               
               plotOutput(outputId = "rentingprice"),
             )
             
           )
           
  ),
) 
)