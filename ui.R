# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
shinyUI(navbarPage("Predicting Plant Efficiency with Stackloss",
                   inverse = TRUE, collapsable = FALSE, fluid = TRUE, responsive = TRUE,
            tabPanel("About App",
                     fluidRow(includeHTML("AboutApp.html"))),
            tabPanel("Predict", # Sidebar with a slider input for number of bins
                     sidebarLayout(
                         sidebarPanel("Slide to choose variables for Stack Loss prediction",
                            sliderInput("Water.Temp","Water Temperature (Celsius)", 17, 27, 20, 0.5),
                            sliderInput("Air.Flow","Air Flow", 50, 80, 50, 0.5)),
                         mainPanel(            
                             verbatimTextOutput("predict"),
                             textOutput("text1")))),
            navbarMenu("Linear Model",
                    tabPanel("Summary",   
                        verbatimTextOutput("summary")),
                    tabPanel("Pairs Plot",   
                             plotOutput("plot1")),
                    tabPanel("Residual Plot 1",   
                             plotOutput("plot2")),
                    tabPanel("Residual Plot 2",   
                             plotOutput("plot3")),
                    tabPanel("Residual Plot 3",   
                             plotOutput("plot4")),
                    tabPanel("Residual Plot 4",   
                            plotOutput("plot5")),
                    tabPanel("Residual Plot 5",   
                            plotOutput("plot6")),
                    tabPanel("Residual Plot 6",   
                            plotOutput("plot7"))),
            tabPanel("About Stackloss", 
                     fluidRow(includeHTML("AboutStackloss.html")))        
            
))
