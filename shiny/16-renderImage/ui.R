library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("renderImage example"),
  sidebarPanel(
    sliderInput("obs", "Number of observations:",
                min = 0, max = 1000,  value = 500),
    selectInput("n", "select image", c(
      "image1"=1,
      "iamge2"=2,
      "image3"=3
    ))
  ),
  mainPanel(
    # Use imageOutput to place the image on the page
    imageOutput("myImage"),
    imageOutput("preImage"),
    imageOutput("dyImage")
  )
))