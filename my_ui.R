source("data_wrangling.R")
source("insurance_wrangling.R")
source("le_by_state.R")



ui <- fluidPage(theme = shinytheme("superhero"),
 headerPanel(HTML('<center>Life Expectancy in the U.S.A</center>'), 
             windowTitle = "Life Expectancy in the U.S.A"),
             
                
  sidebarLayout(position = "left",
                fluid = TRUE,
  sidebarPanel(
    width = 2,
    
    
    conditionalPanel(condition = "input.tabselected == 1",
                     selectInput("year", label = "Select Year for Table", choices = years)
    ),
    conditionalPanel(
      condition = "input.tabselected == 2",
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
      ),
       
    conditionalPanel(
      condition = "input.tabselect == 4"#,
      # sliderInput("avg_le", 
      #             label = "Slide to filter for average life expectancy",
      #             min = le_range[1],
      #             max = le_range[2],
      #             value = le_range)
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
               conditionalPanel(condition="input.choice==1", plotlyOutput("plot2white", height = "600px"), 
                                HTML(
                                  '<br><p align = "left">Average Age Range for Whites: 77.5-80</p><h3>Facts About Life Expectancy For Each Race in 2008</h3><br>
                                  <table style="width:80%" align="left">
                                  <tr>
                                  <td><p style="font-size:160%;">Average Age in General</p></td>
                                  
                                  <td><p style="font-size:160%;">79.4</p></td> 
                                  </tr>
                                  
                                  <th><p style="font-size:160%;">Average Ages of Each Race</p></th>
                                  <th><p style="font-size:160%;"> Native American: 74.6; African American: 74.7; White: 78.6;
                                  Latino: 83.9; Asian American: 87.4</p></th> 
                                  </tr>
                                  <tr>
                                  <td><p style="font-size:160%;"><b>Minimum Age of Each Race</p></td>
                                  <td><p style="font-size:160%;">Native American: 68.2; African American: 71.6; Caucasian: 71.4; Latino: 75.4;
                                  Asian American: 82</p><b/></td> 
                                  </tr>
                                  <tr>
                                  <td><p style="font-size:160%;"><b>Maximum Age of Each Race</p></td>
                                  <td><p style="font-size:160%;">African American: 79.7; Native American: 80.2; Caucasian: 84.3; Latino: 88.3;
                                  Asian American: 89.4</p><b/></td> 
                                  </tr>
                                  </table>')
                                ),
               conditionalPanel(condition="input.choice==2", plotlyOutput("plot2afa", height = "600px"),HTML(
                 '<br><p align = "left">Average Age Range for African Americans: 72.5-75</p><h3>Facts About Life Expectancy For Each Race in 2008</h3><br>
                 <table style="width:80%" align="left">
                 <tr>
                 <td><p style="font-size:160%;">Average Age in General</p></td>
                 
                 <td><p style="font-size:160%;">79.4</p></td> 
                 </tr>
                 
                 <th><p style="font-size:160%;">Average Ages of Each Race</p></th>
                 <th><p style="font-size:160%;"> Native American: 74.6; African American: 74.7; White: 78.6;
                 Latino: 83.9; Asian American: 87.4</p></th> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Minimum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">Native American: 68.2; African American: 71.6; Caucasian: 71.4; Latino: 75.4;
                 Asian American: 82</p><b/></td> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Maximum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">African American: 79.7; Native American: 80.2; Caucasian: 84.3; Latino: 88.3;
                 Asian American: 89.4</p><b/></td> 
                 </tr>
                 </table>')),
               conditionalPanel(condition="input.choice==3", plotlyOutput("plot2asa",height = "600px"),HTML(
                 '<br><p align = "left">Average Age Range for Asian Americans: 87.5-90</p><h3>Facts About Life Expectancy For Each Race in 2008</h3><br>
                 <table style="width:80%" align="left">
                 <tr>
                 <td><p style="font-size:160%;">Average Age in General</p></td>
                 
                 <td><p style="font-size:160%;">79.4</p></td> 
                 </tr>
                 
                 <th><p style="font-size:160%;">Average Ages of Each Race</p></th>
                 <th><p style="font-size:160%;"> Native American: 74.6; African American: 74.7; White: 78.6;
                 Latino: 83.9; Asian American: 87.4</p></th> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Minimum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">Native American: 68.2; African American: 71.6; Caucasian: 71.4; Latino: 75.4;
                 Asian American: 82</p><b/></td> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Maximum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">African American: 79.7; Native American: 80.2; Caucasian: 84.3; Latino: 88.3;
                 Asian American: 89.4</p><b/></td> 
                 </tr>
                 </table>')),
               conditionalPanel(condition="input.choice==4", plotlyOutput("plot2na",height = "600px"),HTML(
                 '<br><p align = "left">Average Age Range for Native Americans: 72.5-75</p><h3>Facts About Life Expectancy For Each Race in 2008</h3><br>
                 <table style="width:80%" align="left">
                 <tr>
                 <td><p style="font-size:160%;">Average Age in General</p></td>
                 
                 <td><p style="font-size:160%;">79.4</p></td> 
                 </tr>
                 
                 <th><p style="font-size:160%;">Average Ages of Each Race</p></th>
                 <th><p style="font-size:160%;"> Native American: 74.6; African American: 74.7; White: 78.6;
                 Latino: 83.9; Asian American: 87.4</p></th> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Minimum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">Native American: 68.2; African American: 71.6; Caucasian: 71.4; Latino: 75.4;
                 Asian American: 82</p><b/></td> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Maximum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">African American: 79.7; Native American: 80.2; Caucasian: 84.3; Latino: 88.3;
                 Asian American: 89.4</p><b/></td> 
                 </tr>
                 </table>')),
               conditionalPanel(condition="input.choice==5", plotlyOutput("plot2lat", height = "600px"), HTML(
                 '<br><p align = "left">Average Age Range for Latinos: 85-87.5</p><h3>Facts About Life Expectancy For Each Race in 2008</h3><br>
                 <table style="width:80%" align="left">
                 <tr>
                 <td><p style="font-size:160%;">Average Age in General</p></td>
                 
                 <td><p style="font-size:160%;">79.4</p></td> 
                 </tr>
                 
                 <th><p style="font-size:160%;">Average Ages of Each Race</p></th>
                 <th><p style="font-size:160%;"> Native American: 74.6; African American: 74.7; White: 78.6;
                 Latino: 83.9; Asian American: 87.4</p></th> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Minimum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">Native American: 68.2; African American: 71.6; Caucasian: 71.4; Latino: 75.4;
                 Asian American: 82</p><b/></td> 
                 </tr>
                 <tr>
                 <td><p style="font-size:160%;"><b>Maximum Age of Each Race</p></td>
                 <td><p style="font-size:160%;">African American: 79.7; Native American: 80.2; Caucasian: 84.3; Latino: 88.3;
                 Asian American: 89.4</p><b/></td> 
                 </tr>
                 </table>')
               )),
      

      
      
      ################## 
      ### Question 3 ###
      ##################
      tabPanel("Question 3",
               value = 3,
               p("This visual shows the percent of uninsured by race. Each data point represents a state.
                 The visual shows that Hispanics are the highest uninsured demographic and whites are the
                 lowest uninsured demographic. In 2016, uninsurance nationally among whites was ", white_uninsured,
                 " and", his_uninsured, " among Hispanics. Asians had the next lowest uninsurance rate ", asian_uninsured,
                 ". This was followed by African Americans with a rate of", afam_uninsured, "and Others or Multiple Races
                 with a rate of", other_uninsured, "."),
               p("Data for this visual comes from the ",
                 a("State Health Access Data Assistance Center", href="http://statehealthcompare.shadac.org/table/29/health-insurance-coverage-type-by-race-ethnicity#2/39,40,41,42,43,1,10/5/57,58"), "."),
               plotOutput("plot3")
      ),
      
      ##################
      ### Question 4 ###
      ##################
      tabPanel("Question 4", value=4,
               p("Click on a state in the legend to see more."),
               sliderInput("avg_le", 
                           label = "Slide to filter for average life expectancy",
                           min = le_range[1],
                           max = le_range[2],
                           value = le_range),
               plotlyOutput("plot4")
               
    ),
    highchartOutput("map1q4", width = "100%", height = "500px"),
    id = "tabselected"
  )
)
)
)
