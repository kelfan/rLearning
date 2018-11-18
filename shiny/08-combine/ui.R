library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("combine exercise"),
  
  sidebarPanel(
    textInput("tx", "Caption:", "place holder"),
    selectInput('sl', "Please select a item: ",
                list("item1"="i1",
                     "item2"="i2")),
    numericInput("nr", "Number of observations to view:", 100),
    sliderInput("sd", "number of slide: ", min=0, max=100, value=50),
    checkboxInput("cb", "checkbox", FALSE),
    radioButtons("rb", "radio buttons", 
                 list("list1"="l1",
                      "list2"="l2"))
  ),
  
  mainPanel(
    textOutput("hello"),
    h3(textOutput("hello3")),
    h4(textOutput("hello2")),
    verbatimTextOutput("hello4"),
    tableOutput("hello5"),
    
    h1(textOutput("text")),
    tableOutput("number"),
    plotOutput("dist"),
    
    textOutput("check"),
    textOutput("drop"),
    textOutput("radio")
  )
  
))