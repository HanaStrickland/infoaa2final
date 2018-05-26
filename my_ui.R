
ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  # sidebarLayout(
  #   sidebarPanel(
  #     # Sidebar panel
  #   ),
  #   
  #   mainPanel(
  #     
  #     # Main panel
  #   
  #     
  #     tabsetPanel(
  #       type = "tabs",
  #       tabPanel("Question 1", plotOutput("plot1a"),plotOutput("plot1b"), plotOutput("plot1c") ),
  #       tabPanel("Question 2", plotlyOutput("plot2"))
  #     )
  #     )
  #   )
    
  tabsetPanel(
    type = "tabs",
    tabPanel("Question 1", 
             sidebarLayout(
               sidebarPanel("Sidebar Panel"),
               mainPanel(plotOutput("plot1a"),plotOutput("plot1b"), plotOutput("plot1c") )
                           ) 
             ),
    tabPanel("Question 2", plotlyOutput("plot2"))
    
    
    
  )
)

