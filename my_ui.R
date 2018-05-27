
ui <- fluidPage(
  source("data_wrangling.R"),
  
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
               sidebarPanel(
                 selectInput("year", label = "Select Year for Table", choices = years)

                            ),
               mainPanel(plotOutput("plot1a"),
                         plotOutput("plot1b"), 
                         plotOutput("plot1c"),
                         dataTableOutput("table1"))
             ) 
    ),
    tabPanel("Question 2",
             sidebarLayout(
               sidebarPanel(
                 selectInput("location", label = "Select Location (for Plot 2)", choices = locations)
                 
               ),
               mainPanel(
                 plotlyOutput("plot2"),
                 plotOutput("plot2b"),
                 dataTableOutput("table2")
                 )
             )
    )
    
    
    
  )
  
  
  
  
  
  
)

