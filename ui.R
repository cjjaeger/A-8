#This is the ui
library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel("Iris petal sizes"),
  
  sidebarPanel(
    #creating dropdown menu to select the species
    selectInput("species", label = h3("Iris Species"), 
              choices = list("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica", "All" = "all" ), 
              selected = "setosa"),
    
    radioButtons("measured", label = h3("Measured"),
                 choices = list("Sepal" = "sepal", "Petal" = "petal"), 
                 selected = "sepal")
    ),
  mainPanel(
    plotlyOutput("scat")
  )
  
))