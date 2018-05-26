
ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  sidebarLayout(
    sidebarPanel(
      # Sidebar panel
    ),
    
    mainPanel(
      
      # Main panel
    
      
      tabsetPanel(
        type = "tabs",
        tabPanel("Question 1", plotOutput("plot1")),
        tabPanel("Question 2", plotlyOutput("plot2"))
      )
      )
    )
    
    
    
    
    
  )

