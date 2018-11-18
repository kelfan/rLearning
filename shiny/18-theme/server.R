library(shiny)

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    # prevent plot before first click on button
    if (input$goButton == 0)
      return()
    
    # Take a dependency on input$goButton
    input$goButton
    
    # Use isolate() to avoid dependency on input$obs
    dist <- isolate(rnorm(input$obs))
    hist(dist)
  })
  
  output$nthValue <- renderText({
    if (input$goButton == 0)
      return()
    
    isolate({ fib(as.numeric(input$n)) })
  })
}) 