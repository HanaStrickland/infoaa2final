
ui <- fluidPage(
  
  sidebarPanel(
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition = "input.tabselected==1"),
    conditionalPanel(condition = "input.tabselected==2",
                     
                     radioButtons("choice","Choose a Race", choices = c("White" = 1, "African American" = 2,
                                                                        "Asian American" = 3, "Native American" = 4, "Latino" = 5, "Show All Races" = 6))
                     
    )
    
    
    
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Question 1", value=1, plotOutput("plot1b"), plotOutput("plot1c") ),
      
      tabPanel("Question 2", value=2, align = "center",
               conditionalPanel(condition="input.choice==1", plotlyOutput("plot2white", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2afa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2asa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot2na", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot2lat", width = "887px", height = "591px"))),
      
      id = "tabselected"
    )
  )
)
