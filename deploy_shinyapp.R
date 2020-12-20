## Deploy my shiny app to Shinyapps.io

# instructions at <https://shiny.rstudio.com/articles/shinyapps.html>

install.packages('rsconnect')
library(rsconnect)

library(tidyverse)
library(shiny)
library(shinydashboard)

library(rsconnect)
library(ggplot2)

deployApp()

#or actually it is easier to just hit the publish button after launching the app


# https://maestroman.shinyapps.io/Shiny_course_project/



rsconnect::showLogs(appName="Shiny_course_project",streaming=TRUE) 
