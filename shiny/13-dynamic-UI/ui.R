library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("combine exercise"),
  
  sidebarPanel(
    # Partial example
    checkboxInput("smooth", "Smooth"),
    conditionalPanel(
      condition = "input.smooth == true",
      selectInput("smoothMethod", "Method",
                  list("lm", "glm", "gam", "loess", "rlm"))
    ),
    
    # Partial example
    selectInput("dataset", "Dataset", c("diamonds", "rock", "pressure", "cars")),
    conditionalPanel(
      condition = "output.nrows",
      checkboxInput("headonly", "Only use first 1000 rows")),
    
    # Partial example
    numericInput("lat", "Latitude", 50),
    numericInput("long", "Longitude", 50),
    uiOutput("cityControls")
  ),
  
  mainPanel(
    textOutput("hello"),
    textOutput("nrows")
  )
  
))