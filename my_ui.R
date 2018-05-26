
ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  sidebarLayout(
    sidebarPanel(
      # Sidebar panel
    ),
    
    mainPanel(
      
      # Main panel
      navbarPage(tabPanel("Question 0"), # I don't know why it won't show the first tab pannel
                 tabPanel("Question 1", plotOutput("plot1")),
                 tabPanel("Question 2"), plotlyOutput("plot2")), #shows up on first tab too for some reason
                 tabPanel("Question 3"),
                 tabPanel("Question 4")
      )
    )
    
    
    
    
    
  )

