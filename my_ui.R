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
               mainPanel(plotOutput("plot1a"),
                         plotOutput("plot1b"), 
                         plotOutput("plot1c"),
                         dataTableOutput("table1"))
             ) 
    ),
    tabPanel("Question 2",
             sidebarLayout(
               sidebarPanel(
                 selectInput("choice","Choose a Race", 
                            choices = c("White", "African American",
                                        "Asian American", "Native American", "Latino"))),
                 selectInput("location", label = "Select Location (for Plot 2)", choices = locations)
                 
               ),
               
               mainPanel(
                 
                 tabsetPanel(type = "tabs",
                   tabPanel("Question 2", value = 2, 
                            plotlyOutput("plot2a")
                            plotOutput("plot2d"),
                            dataTableOutput("table2")
                   ),
                   
                   id = "tabselected"
                 )
               )
             )
             
    )
    
  ) 
  



