library(shinythemes)
library(shiny)
library(dplyr)
library(ggplot2)
library(ggrepel)

ui <- fluidPage(
  # Choose a theme
  theme = shinytheme("readable"),
  
  # Application title
  titlePanel("A quick view of volcano plot"),
  
  # Sidebar for number of class outputs : 
  # Input file; Threshold of foldchange and p.adj
  sidebarPanel(
    #    textInput("txt", "Text input:", "text here"),
    fileInput("filename", 
              "Choose File to Upload:", 
              accept = c(".csv")),
    hr(),
    numericInput("foldchange",
                 label = "Threshold of foldchage is:",
                 value = 1,
                 min = 0,
                 max = 5),
    numericInput("padj",
                 label = "Threshold of p.adj is:",
                 value = 2,
                 min = 0,
                 max = 100),
    hr(),
    submitButton("Update View")
  ),
  
  #Tab1 for sample plot, Tab2 for lable plot
  mainPanel(
    tabsetPanel(
      tabPanel("Tab 1",
               fluidRow(
                 column(width = 9,
                        plotOutput("sampleplot", height = 500)
                 ),
                 column(width = 2,
                        downloadButton("download_plot",label = "Download Volcano Plot")
                 )
               )),
      tabPanel("Tab 2",
               fluidRow(
                 column(width = 11,
                        plotOutput("signplot", height = 500)
                 )
               ))
    )
  )
)

server <- function(input, output) {
  # file upload
  filedata <- reactive({
    infile <- input$filename
    if (is.null(infile)){
      return(NULL)
    }
    read.csv(infile$datapath,sep = ",", header = T, stringsAsFactors = F)
  })
  
  #function
  sample_plot <- function(){
    df <- filedata() %>% as.data.frame()
    names(df) <- c("geneid", "log2foldchage", "padj")
    df$padj <- -log10(df$padj)
    df$change <- as.factor(ifelse(df$padj > input$padj & abs(df$log2foldchage) > input$foldchange,
                                  ifelse(df$log2foldchage > input$foldchange,'UP','DOWN'),'NOT'))
    
    p <- ggplot(data = df, aes(x = log2foldchage, y = padj, color = change)) +
      geom_point(alpha=0.8, size = 1) +
      theme_bw(base_size = 15) +
      theme(
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank()) +
      scale_color_manual(name = "", values = c("red", "green", "black"), limits = c("UP", "DOWN", "NOT")) +
      geom_hline(yintercept = input$padj, linetype = "dashed", color = "grey", size = 1) +
      geom_vline(xintercept = -input$foldchange, linetype = "dashed", color = "grey", size = 1) +
      geom_vline(xintercept = input$foldchange, linetype = "dashed", color = "grey", size = 1)
    p
  }
  
  signed_plot <- function(){
    df <- filedata() %>% as.data.frame()
    names(df) <- c("geneid", "log2foldchage", "padj")
    df$padj <- -log10(df$padj)
    df$change <- as.factor(ifelse(df$padj > input$padj & abs(df$log2foldchage) > input$foldchange,
                                  ifelse(df$log2foldchage > input$foldchange,'UP','DOWN'),'NOT'))
    df$sign <- ifelse(df$padj > input$padj & abs(df$log2foldchage) > input$foldchange, df$geneid,NA)
    
    p <- ggplot(data = df, aes(x = log2foldchage, y = padj, color = change)) +
      geom_point(alpha=0.8, size = 1) +
      theme_bw(base_size = 15) +
      theme(
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank()) +
      scale_color_manual(name = "", values = c("red", "green", "black"), limits = c("UP", "DOWN", "NOT")) +
      geom_text_repel(aes(label = sign), box.padding = unit(0.2, "lines"), point.padding = unit(0.2, "lines"), show.legend = F, size = 3) +
      geom_hline(yintercept = input$padj, linetype = "dashed", color = "grey", size = 1) +
      geom_vline(xintercept = -input$foldchange, linetype = "dashed", color = "grey", size = 1) +
      geom_vline(xintercept = input$foldchange, linetype = "dashed", color = "grey", size = 1)
    p
  }
  
  #simple volcano plot
  output$sampleplot <- renderPlot({
    if (!is.null(filedata())){
      sample_plot()
    }
  })
  
  #signed volcano plot
  output$signplot <- renderPlot({
    if (!is.null(filedata())){
      signed_plot()
    }
  })
  
  #Download
  output$downloadplot <- downloadHandler(
    filename = function(){
      paste0("volcano", ".png")
    },
    contentType = "image/png",
    content = function(file){
      png(file)
      print(sample_plot())
      dev.off()
    }
  )
}

shinyApp(ui = ui, server = server)
