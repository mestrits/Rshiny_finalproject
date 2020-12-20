## project script

library(shiny)
library(shinydashboard)

library(tidyverse)
#library(ggplot2)

ui <- dashboardPage(
  dashboardHeader(title = "Dice Odds Calculator"),
  dashboardSidebar(
          sidebarMenu(
              menuItem("Rolling a Pair - Odds", tabName = "5dice", icon = icon("dice")),
              menuItem("Rolling a Pair -  Probabilities", tabName = "4dice", icon = icon("percentage"))
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




server <- function(input, output){
  output$bar_plot <- renderPlot({
#    Yes_Pair <- as.numeric(input$dice)
#    No_Pair <- as.numeric(input$dice)
#    No_Pair <- No_Pair - 1
#    barplot(Yes_Pair, 
#            xlab = "Odds of tossing a pair", ylab = "Pineapples")

    dice_num <- as.numeric(input$dice)
    
    ifelse(dice_num == 2, odds_pair <- 6, 
           ifelse(dice_num == 3, odds_pair <- 96,
                  ifelse(dice_num == 4, odds_pair <- 936, odds_pair <- 7056
                  )
           )
    )
    
    ifelse(dice_num == 2, odds_nopair <- 30, 
           ifelse(dice_num == 3, odds_nopair <- 120,
                  ifelse(dice_num == 4, odds_nopair <- 360, odds_pair <- 720
                  )
           )
    )
    
    odds_total = odds_pair + odds_nopair
    
    data1 = data.frame(Outcome = c("Pair", "No_Pair"), Outcomes = c(odds_pair,odds_nopair))
    
    data1 <- data1 %>% mutate(Odds = " ")
    
    ggplot(data1, aes(x = Odds, y = Outcomes, fill = outcome) ) +
      geom_col() +
      geom_text(aes(label = paste0(Outcomes, " possible outcomes")),
                position = position_stack(vjust = 0.5)) +
      scale_fill_brewer(palette = "Blues") +
      theme_minimal(base_size = 16) +
      ylab("Outcomes")+
      xlab(" " )
    
  })
 
  output$numdice <- renderText({
    input$dice
  })
  
  output$text1 <- renderText({
    dice_num <- as.numeric(input$dice)
    ifelse(dice_num == 2, odds_pair <- 6, 
           ifelse(dice_num == 3, odds_pair <- 96,
                  ifelse(dice_num == 4, odds_pair <- 936, odds_pair <- 7056
    )      )     )
  odds_pair
  })
  
  output$text2 <- renderText({
    dice_num <- as.numeric(input$dice)
    ifelse(dice_num == 2, odds_nopair <- 30, 
           ifelse(dice_num == 3, odds_nopair <- 120,
                  ifelse(dice_num == 4, odds_nopair <- 360, odds_pair <- 720
    )      )     )
    odds_nopair
  })
  
}
  



shinyApp(ui,server)









