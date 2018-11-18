library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("combine exercise"),
  
  sidebarPanel(

  ),
  
  mainPanel(
    textOutput("text"),
    textOutput("hello"),
    tableOutput("data")
  )
  
))