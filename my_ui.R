
ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  tabsetPanel(
    type = "tabs",
    tabPanel("Question 1"),
    tabPanel("Question 2"),
    tabPanel("Question 4", plotOutput("plot4a"), plotOutput("plot4b")
             )
    )
  )
  
  
    

