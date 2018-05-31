source("data_wrangling.R")
source("data_processing.R")
source("le_by_state.R")



ui <- fluidPage(theme = shinytheme("superhero"),
 headerPanel(HTML('<center>Working Title: Life Expectancies in the U.S.A</center>'), 
             windowTitle = "Working Title: Life Expectancies in the U.S.A"),
             
                
  sidebarLayout(position = "left",
                fluid = TRUE,
  sidebarPanel(
  #  useShinyjs()
    width = 2,
    
    
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition = "input.tabselected == 1",
                     selectInput("year", label = "Select Year for Table", choices = years)
    ),
    conditionalPanel(
      condition = "input.tabselected == 2",
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
      condition = "input.tabselected == 3"
      #radioButtons("choice2", "Choose a Race", choices = c("White" = 1, "Black" = 2, "Hispanic" = 3))
      ),
       
    conditionalPanel(
      condition = "input.tabselect == 4"
    )
  ),
  mainPanel(
    
    tabsetPanel(
      tabPanel("Question 1", value = 1, 
               
               p("If we take the average of median income and life expectancy between 2002 and 2016, we see that the median 
income and life expectancy for black people is ", avg_median_income_black_string, " and ", avg_le_black, " years, respectively.
For white people, average median income and life expectancy is ", avg_median_income_white_string, " and ", avg_le_white," years respectively.
For all races, average median income and life expectancy is ", avg_median_income_all_string," and ",avg_le_all, "respectively."),
                              p("Black people in the US have a significantly lower median income and life expectancy than white people and all races. White people in the US 
                 have a slightly higher median income and life expectancy than all races. 
                 If we compare trends over time, there does not seem to be a correlation 
                 between median income and average life expectancy. Average life expectancy 
                 seemed to to be increasing over time at a decelerating rate while median 
                 income dipped after 2008 and slowly increased. However, we should note that 
                 average life expectancy overall seems to be correlated with median income. 
                 The races from lowest to highest average life expectancy are Black, All 
                 races, and White. This is the same order for median income."),
               p(a("The World Bank", href="http://databank.worldbank.org/data/reports.aspx?source=world-development-indicators&preview=on"), 
                 "has data on Gross National Income (GNI) per capita and life expectancy from 1968 to 2016.
                 When we compared those figures, there was a", correlation_GNI_le, 
                 "correlation between GNI per capita and life expectancy. This is consistent with
                 our finding that white people had higher median incomes and higher life expectancies."),
               p("The data use to create these visuals comes from the ",
                 a("National Center for Health Statistics", href="https://data.cdc.gov/NCHS/NCHS-Death-rates-and-life-expectancy-at-birth/w9j2-ggv5/data"),
                 "and the ",
                 a("United States Census", href="https://www.census.gov/data/tables/2017/demo/income-poverty/p60-259.html"),
                 p("Gross National income is defined as", em("the total domestic and foreign output claimed by
residents of a country, consisting of gross domestic product (GDP), plus factor incomes earned by 
foreign residents, minus income earned in the domestic economy by nonresidents."),
                   "You can find more about it",
                   a("here", href="https://en.wikipedia.org/wiki/Gross_national_income"), ".")
               ),
               
               dataTableOutput("table1"),
               plotlyOutput("plotly1b"),
               plotlyOutput("plotly1c")),
      
      
      ################## 
      ### Question 2 ###
      ##################      
      

      tabPanel("Question 2", value=2, align = "center",
               conditionalPanel(condition="input.choice==1", plotlyOutput("plot2white", height = "600px"), HTML(
                 '<br><table style="width:20%" align="left">
                 <tr>
                 <td><p style="font-size:160%;">Average Age in General</p></td>
                 
                 <td><p style="font-size:160%;">?</p></td> 
                 </tr>
                 
                 <th><p style="font-size:160%;">Race With Lowest Average Age Ranking</p></th>
                 <th>?</th> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;">Race With Lowest Age</p></td>
                 <td><p style="font-size:160%;">?</p></td> 
                 </tr>
                 </table>')
               ),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2afa", height = "600px")),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2asa",height = "600px")),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot2na",height = "600px")),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot2lat", height = "600px"))),

      
      
      ################## 
      ### Question 3 ###
      ##################
      tabPanel("Question 3",
               value = 3,
               # conditionalPanel(condition = "input.choice2==1", plotlyOutput("plot3cw")),
               # conditionalPanel(condition = "input.choice2==2", plotlyOutput("plot3cb")),
               # conditionalPanel(condition = "input.choice2==3", plotlyOutput("plot3ch")),
               # plotOutput("plot3a"), plotOutput("plot3b"),
               p("This visual shows the percent of uninsured by race. Each data point represents a state.
                 The visual shows that Hispanics are the highest uninsured demographic and whites are the
                 lowest uninsured demographic."),
               p("Data for this visual comes from the ",
                 a("State Health Access Data Assistance Center", href="http://statehealthcompare.shadac.org/table/29/health-insurance-coverage-type-by-race-ethnicity#2/39,40,41,42,43,1,10/5/57,58"), "."),
               plotOutput("plot3")
      ),
      
      ##################
      ### Question 4 ###
      ##################
      tabPanel("Question 4", value=4,
               #plotOutput(map_1987),
               #plotOutput(map_2009),
               plotlyOutput("plot4")
               #highchartOutput("map1q4", width = "100%", height = "500px"))
    ),
    id = "tabselected"
  )
)
)
)


