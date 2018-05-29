ui <- fluidPage(
  
  sidebarPanel(
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition = "input.tabselected==1"),
    conditionalPanel(condition = "input.tabselected==2",
                     radioButtons("choice","Choose a Race", choices = c("Caucasian" = 1,
                                                                        "African American" = 2,
                                                                        "Asian American" = 3,
                                                                        "Native American" = 4,
                                                                        "Latino" = 5 ))),
                 
    conditionalPanel(condition = "input.tabselected==3",
                    radioButtons("choice2", "Choose a Race", choices = c("White" = 1, "Black" = 2, "Hispanic" = 3)))

  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Question 1", value=1, 
               plotOutput("plot1a"),
               plotOutput("plot1b"), 
               plotOutput("plot1c")),
      
      # Question 2 Plots
      tabPanel("Question 2", value=2, align = "center",
               conditionalPanel(condition="input.choice==1", plotlyOutput("plot2white", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2afa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2asa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot2na", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot2lat", width = "887px", height = "591px"))),
               
      
      # Question 3 Plots
      tabPanel("Question 3", value=3,
               conditionalPanel(condition="input.choice2==1", plotlyOutput("plot3cw")),
               conditionalPanel(condition="input.choice2==2", plotlyOutput("plot3cb")),
               conditionalPanel(condition="input.choice2==3", plotlyOutput("plot3ch")),
               plotOutput("plot3a"), plotOutput("plot3b")),
      
      # Question 3 Visualizations
        tabPanel("Question 4", value=4,
                 #plotOutput(map_1987),
                 #plotOutput(map_2009),
                 plotlyOutput("plot4"))
        ),
      
      id = "tabselected"
    )
  )



  
