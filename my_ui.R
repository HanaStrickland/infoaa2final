
ui <- fluidPage(
  sidebarPanel(

    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition = "input.tabselected==1",
                     selectInput("year", label = "Select Year for Table", choices = years)
    ),
    conditionalPanel(
      condition = "input.tabselected==2",
      selectInput("location", label = "Select Location (for Plot 2)", choices = locations),
      radioButtons("choice", "Choose a Race", choices = c(
        "White" = 1,
        "African American" = 2,
        "Asian American" = 3,
        "Native American" = 4,
        "Latino" = 5
      ))
    ),

    conditionalPanel(
      condition = "input.tabselected==3",
      radioButtons("choice2", "Choose a Race", choices = c("White" = 1, "Black" = 2, "Hispanic" = 3))

    )
  ),
  mainPanel(
 
    tabsetPanel(
      tabPanel("Question 1", value = 1, 
               htmlOutput("q1_analysis"),
               dataTableOutput("table1"),
               plotlyOutput("plotly1b"),
               plotlyOutput("plotly1c")),


      # Question 2 Plots
      
      tabPanel("Question 2", value=2, align = "center",
               
               conditionalPanel(condition="input.choice==1", plotlyOutput("plot2white", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2afa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2asa", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot2na", width = "887px", height = "591px")),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot2lat", width = "887px", height = "591px")),
               dataTableOutput("table2")),





      ################## 
      ### Question 3 ###
      ##################
      # Question 3 Plots
      tabPanel("Question 3",
        value = 3,
        conditionalPanel(condition = "input.choice2==1", plotlyOutput("plot3cw")),
        conditionalPanel(condition = "input.choice2==2", plotlyOutput("plot3cb")),
        conditionalPanel(condition = "input.choice2==3", plotlyOutput("plot3ch")),
        plotOutput("plot3a"), plotOutput("plot3b")
      ),
      id = "tabselected"
    )
  )
)

