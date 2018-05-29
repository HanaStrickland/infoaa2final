source("data_wrangling.R")

server <- function(input, output) {
  
  
  # Server stuff
  
  ################## 
  ### Question 1 ###
  ##################
  
  
  results_data1 <- reactive({
    
    results <- income_by_le[income_by_le$Year == input$year, ]
    results
    
    
  })
  
  results_data2 <- reactive({
    results <- le_at_birth_race_long[le_at_birth_race_long$Location == input$location, ]
    results
  })
  
  output$q1_analysis <- renderUI({
    p("Black people in the US have a significantly lower median income and 
                              life expectancy than white people and all races. White people in the US 
                              have a slightly higher median income and life expectancy than all races. 
                              If we compare trends over time, there does not seem to be a correlation 
                              between median income and average life expectancy. Average life expectancy 
                              seemed to to be increasing over time at a decelerating rate while median 
                              income dipped after 2008 and slowly increased. However, we should note that 
                              average life expectancy overall seems to be correlated with median income. 
                              The races from lowest to highest average life expectancy are Black, All 
                              races, and White. This is the same order for median income.")
  })
  
  output$plot1b <- renderPlot({
    
    plot1b <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Year, y = median_income,  color = Race)) +
      labs(title = "Median Income Over Tiime",
           x = "Year",
           y = "Median Income")
    plot1b
  })
  
  output$plot1c <- renderPlot({
    
    plot1c <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Year, y = Avg.Life.Expectancy.Years,  color = Race)) +
      labs(title = "Average Life Expectancy Over Tiime",
           x = "Year",
           y = "Average Life Expectancy")
    plot1c
  })
  
  output$table1 <- renderDataTable({
    get_result <- results_data1()
    get_result
  })
  
  ################## 
  ### Question 2 ###
  ##################
  
  output$plot2b <- renderPlot({
    
    ggplot(data = results_data2(), aes(x = Race, y = Life_Expectancy, color = Race, size = 5)) +
      geom_point(na.rm = TRUE) +
      labs(title = "Relationship Between Race and Life Expectancy",
           x = "Race",
           y = "Life Expectancy")
    
    
  })
  
  output$table2 <- renderDataTable({
    results_data2()
  })
  
  
  
  
}
