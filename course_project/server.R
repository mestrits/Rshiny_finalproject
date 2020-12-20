#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(tidyverse)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output){
        output$bar_plot <- renderPlot({
            
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
        
    })

# Author Jason Mestrits

    