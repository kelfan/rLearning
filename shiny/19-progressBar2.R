server <- function(input, output){
  data <- reactive({
    data.frame(x=rnorm(10), y=rnorm(10))
  })
  
  output$table <- renderTable({
    input$goTable
    
    # Create a Progress object
    progress <- shiny::Progress$new()
    # Make sure it closes when we exit this reactive, even if there's an error
    on.exit(progress$close())
    
    progress$set(message="Try it", value = 0)
    n <- nrow(data())
    for (i in 1:n) {
      progress$inc(1/n, detail="Please wait...")
      Sys.sleep(0.2)
    }
    
    data()
  })
}

ui <- shinyUI(basicPage(
  tableOutput("table")
))

shinyApp(ui = ui, server = server)