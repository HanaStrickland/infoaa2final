
ui <- fluidPage(

  sidebarPanel(
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition="input.tabselected==1"),
    conditionalPanel(condition="input.tabselected==2",
            
                     radioButtons("choice","Choose a Race", choices=c("White" = 1, "African American" = 2,
                                                                         "Asian American" = 3, "Native American" = 4, "Latino" = 5 ))
                     
    )
    
    
    
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Question 1", value=1, plotOutput("plot1a"),plotOutput("plot1b"), plotOutput("plot1c") ),
      tabPanel("Question 2", value=2, conditionalPanel(condition="input.choice==1", plotlyOutput("plot2")),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot3")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot4")),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot5")),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot6"))),

      id = "tabselected"
      )
    )
  )


  
