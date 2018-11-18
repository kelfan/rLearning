library(shiny)
library(datasets)

# Objects in this file are shared across all sessions
source('all_sessions.R', local=TRUE)

# A read-only data set that will load once, when Shiny starts, and will be
# available to each user session
bigDataSet <- read.csv('bigdata.csv')

varA <- 1
varB <- 1
listA <- list(X=1, Y=2)
listB <- list(X=1, Y=2)

# A non-reactive function that will be available to each user session
utilityFunction <- function(x) {
  # Function code here
  # ...
  return(nrow(bigDataSet))
}

shinyServer(function(input, output){
  startTime <- Sys.time()
  
  output$hello <- renderPrint(utilityFunction())

  output$data <- renderTable(bigDataSet)  
  
  # Create a local variable varA, which will be a copy of the shared variable
  # varA plus 1. This local copy of varA is not be visible in other sessions.
  varA <- varA + 1
  
  # Modify the shared variable varB. It will be visible in other sessions.
  varB <<- varB + 1
  
  # Makes a local copy of listA
  listA$X <- 5
  
  # Modify the shared copy of listB
  listB$X <<- 5
  
  # Objects in this file are defined in each session
  source('each_session.R', local=TRUE)
  
  output$text <- renderText({
    # Objects in this file are defined each time this function is called
    source('each_call.R', local=TRUE)
    return("test")
    # ...
  })
  
})

# You could put bigDataSet and utilityFunction inside of the function passed to shinyServer(), but doing so will be less efficient, because they will be created each time a user connects.


