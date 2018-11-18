library(shiny)

shinyServer(function(input, output){
  output$hello <- renderPrint("hello 问问")
  output$hello2 <- renderPrint("hello 问问")
  output$hello3 <- renderPrint("hello 问问")
  output$hello4 <- renderPrint("hello 问问")
  output$hello5 <- renderPrint("hello 问问")
  output$hello6 <- renderPrint("hello 问问")
  output$hello7 <- renderPrint("hello 问问")
  
  output$text <- renderText(input$tx)
  output$number <- renderPrint(input$nr)
  
  output$dist <- renderPlot({
    d <- rnorm(input$sd)
    hist(d)
  })
  
  output$check <- renderText(
    if(input$cb){
      return ("check")
    }else{
      return ("uncheck")
    }
  )
  
  formulaText <- reactive({
    paste("select item is :", input$sl)
  })
  
  output$drop <- renderText(
    formulaText()
  )

  dataInput <- reactive({
    switch(input$rb,
           "l1" = "first list",
           "l2" = "second list")
  })
  output$radio <- renderText(dataInput())
  
})