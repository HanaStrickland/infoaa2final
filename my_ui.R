source("data_wrangling.R")


ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  tabsetPanel(
    type = "tabs",
    tabPanel("Question 1", 
             sidebarLayout(
               sidebarPanel(
                 selectInput("year", label = "Select Year for Table", choices = years)
                 
               ),
               mainPanel(
                 htmlOutput("q1_analysis"),
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
                 plotOutput("plot2b"),
                 dataTableOutput("table2")
               )
             )
    )
    
    
    
  ))
