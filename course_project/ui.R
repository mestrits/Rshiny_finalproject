#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(tidyverse)

# Define UI for input collection and odds calculator
shinyUI(
    dashboardPage(
    dashboardHeader(title = "Dice Odds Calculator"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Rolling a Pair - Odds", tabName = "5dice", icon = icon("dice")),
            menuItem("Rolling a Pair -  Probabilities", tabName = "4dice", icon = icon("percent"))
        )
    ),
    dashboardBody(
        tabItems(
            tabItem("5dice",
                    box(plotOutput("bar_plot"), width = 8),
                    box(selectInput("dice", "How Many Dice will you Toss?",
                                    c(2,3,4,5)), width = 4),
                    box(
                        h3("When rolling") , 
                        textOutput("numdice"),
                        h3("die... the odds that you will roll a pair, in a single roll is"),
                        textOutput("text1"), 
                        h3("to "),
                        textOutput("text2")
                        
                    )
            ),
            tabItem("4dice", 
                    fluidPage(
                        h1("This tab is still under developement, and so for this project, please just use the first tab that 
                   shows the odds.  However, the concept i wanted to demonstrate, was that you can have multiple tabs
                   and use them for various views on a related topic")
                    )
            )
        )
    )  
)
)



