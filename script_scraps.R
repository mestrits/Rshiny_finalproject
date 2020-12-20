


install.packages("shinydashboard")


?dashboardPage

rm(list=ls())
#setwd
wd <- getwd()

list.files(wd)




sliderInput("bins",
            "Number of bins:",
            min = 1,
            max = 50,
            value = 30)



# the server.r file origintal used a "renderPlot" rather than renderText

library(shiny)

# Define server logic eg... required to draw a histogram
shinyServer(function(input, output) {
  
  output$text1 <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
})



# ifelse loop for selecting # of dice

x <- 4

x1 <- ifelse(x==2,"2", 
             ifelse(x==3, "3",
                    ifelse(x==4, "4", "5")
                    )
             )
x1


##ui.r

library(shiny)

# slider1
# text1


# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Probability of rolling a pair"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h2("Sidebar Text"),
      em("Emphasized text"),
      sliderInput("slider1","How many dice will your roll?", 2,5,2),
      checkboxInput("check2","2 dice", FALSE), 
      checkboxInput("check3","3 dice", FALSE), 
      checkboxInput("check4","4 dice", FALSE), 
      checkboxInput("check5","5 dice", FALSE), 
      verbatimTextOutput("dice")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      #   plotOutput("distPlot"),
      h2("# of Dice"),
      code("some code example"),
      textOutput("text1")
    )
  )
))

#server.r


# Define server logic eg... required to draw a histogram
shinyServer(function(input, output) {
  
  output$text1 <- renderText(input$slider1)
 # output$text1 <- renderText(input$check2)
  
  output$dice <- renderText({})
  
  
  
})


output$text2 <- renderText(
  
  x <- 0,
  x1 <- ifelse(input$check2==TURE,"2", 
               ifelse(input$check3==TRUE, "3",
                      ifelse(input$check4==TRUE, "4",
                             ifelse(input$check5==TRUE, "5", "Please select the # of dice")
                             
                      )
               )
  ),
  x1
)

library(tidyverse)


library(ggplot2)
 holder1 <- c(rep(1,7056))
 holder0 <- c(rep(0,720))
 holder <- c(holder1,holder0)
 numero <- 7776
 trials <- c(1:numero)
 holderA <- replace(holder, holder==1,"Pair")
 holderA <- replace(holderA, holderA == 0, "No_Pair")
 odds <- c(rep("odds",numero))
 outcome <- c("Pair","No_Pair")
 outcomes <-  c(7056,720)
 #data <- data.frame(outcomes, odds)
 
 data <- data.frame(holderA ,holder, odds)
 data2 <- data.frame(trials,holderA ,holder, odds)
 
 ggplot(data = data, aes(fill= holderA , x = holder ))+
      geom_bar(position = "stack", stat = "bin", bins = 2)
 options(scipen = 8000)
 
 

 
 
 
 #require(scales)
 #p+scale_x
 
 

barplot(c(4,5,6))

class(data)

rnorm(12,0,15)








?barplot
height <- 10


p <- ggplot(df, aes(x = dose, y = len))+
  geom_col(aes(fill = supp), width = 0.7)
p




######################################################################

#example for a single bar plot...
Ancestry <- data.frame(Race = c("European", "African American", "Asian", "Hispanic", "Other"), 
                       Proportion = c(40, 30, 10, 15, 5))
Ancestry <- Ancestry %>% 
  mutate(Year = "2006")
rm(Ancestry)
######################################################################

odds_pair = 7056
odds_nopair = 720

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

z <- endz  

 



## this was a working first pass at an interactive plot in the shiny app
# actuall look at the server function for the plot details
dashboardBody(
  tabItems(
    tabItem("5dice",
            box(plotOutput("bar_plot"), width = 8),
            box(selectInput("dice", "How Many Dice will you Toss?",
                            c(2,3,4,5)), width = 4
            )
    ),
    tabItem("4dice", 
            fluidPage(
              h1("lotso dice")
            )
    )
  )
)  

##


server <- function(input, output){
  output$bar_plot <- renderPlot({
    Yes_Pair <- as.numeric(input$dice)
    No_Pair <- as.numeric(input$dice)
    No_Pair <- No_Pair - 1
    barplot(Yes_Pair, 
            xlab = "Odds of tossing a pair", ylab = "Pineapples")
  })
  
  
  
}




#############################

dice_num <- 3
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











