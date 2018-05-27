
ui <- fluidPage(

  sidebarPanel(
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition="input.tabselected==1"),
    conditionalPanel(condition="input.tabselected==2",
            
                     radioButtons("choice","Choose a Race", choices=c("White" = 1, "African American" = 2,
                                                                         "Asian American" = 3 ))
                     
    )
    
    
    
  ),
  mainPanel(

    tabsetPanel(
      tabPanel("Question 1", value=1, plotOutput("plot1a"),plotOutput("plot1b"), plotOutput("plot1c") ),
      tabPanel("Question 2", value=2, conditionalPanel(condition="input.choice==1", plotlyOutput("plot2a")),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2b")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2c"))),

      id = "tabselected"
      )
    )
  )


  
