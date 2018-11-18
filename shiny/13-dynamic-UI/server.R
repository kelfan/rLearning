library(shiny)
library(datasets)

getNearestCities <- function(lat, long){
  if(lat>=50){
    return(c('Melbourne' = "mel", 'Sydney'='syd', 'hobart'='hob'))
  }else{
    return()
  }
   
}


shinyServer(function(input, output){
  
  # Partial example
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  r <- reactive({
    nrow(datasetInput())
  })
  
  output$nrows <- r
  
  output$hello <- renderPrint(r())
  
  # Partial example
  output$cityControls <- renderUI({
    cities <- getNearestCities(input$lat, input$long)
    checkboxGroupInput("cities", "Choose Cities", cities)
  })
})