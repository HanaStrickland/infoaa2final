
server <- function(input, output) {
  source("data_wrangling.R")
  source("data_processing.R")
  
  # Server stuff
  ################## 
  ### Question 1 ###
  ##################
  
  results_data1 <- reactive({
    
    results <- income_by_le[income_by_le$Year == input$year, ]
    results
    
    
  })
  
  results_data2 <- reactive({
    results <- le_at_birth_race_long[le_at_birth_race_long$region == input$location, ]
    results
  })
  

  output$table1 <- renderDataTable({
    get_result <- results_data1()
    get_result
  })
  
  output$plotly1b <- renderPlotly({
    
    plot1b <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Year, y = median_income,  color = Race)) +
      labs(title = "Median Income Over Tiime",
           x = "Year",
           y = "Median Income") 
    ggplotly(plot1b, tooltip = c("Year", "Race", "median_income"))
  })
  

  
  output$plotly1c <- renderPlotly({
    plot1c <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Year, y = Avg.Life.Expectancy.Years,  color = Race)) +
      labs(title = "Average Life Expectancy Over Tiime",
           x = "Year",
           y = "Average Life Expectancy")
    
    ggplotly(plot1c, tooltip = 
               c("Year", "Race", "Avg.Life.Expectancy.Years")
             )
    
  })
  
  ################## 
  ### Question 2 ###
  ##################
  
  
  output$table2 <- renderDataTable({
    get_result <- results_data2()
    get_result
    
  })
  
  
  output$plot2white <- renderPlotly({
    
    plot2white <- ggplot(data = new_data) +

      geom_polygon(aes(x = long, y = lat, group = group, 
                       fill = cut(new_data$White, seq(65, 90, by = 2.5), include.lowest = TRUE), label = region)) +
      scale_fill_manual(name = "Age Range", values = c("#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8"), na.value = "#636363") +
      labs(title = "Life Expectancies for Caucasians in 2008") +
      theme_light() + theme(
        plot.title = element_text(color = '#02818a', size = 14,  face = 'bold'),
        axis.title.x = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic'),
        axis.title.y = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic') 
      )
    plot2white + geom_point()
    ggplotly(plot2white, tooltip="region")
  })
  
  output$plot2afa <- renderPlotly({
    
    plot2afa <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, 

                       fill = cut(new_data$African.American, seq(65, 90, by = 2.5), include.lowest = TRUE), label = region)) +
      scale_fill_manual(name = "Age Range", values = c("#edf8b1", "#c7e9b4", "#7fcdbb", "#41b6c4"), na.value = "#636363") +
      labs(title = "Life Expectancies for Afican Americans in 2008") +
      theme_light() + theme(
        plot.title = element_text(color = '#02818a', size = 14, face = 'bold'),
        axis.title.x = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic'),
        axis.title.y = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic') 
      )
    plot2afa + geom_point()
    ggplotly(plot2afa, tooltip="region")
  })
  
  output$plot2asa <- renderPlotly({
    
    plot2asa <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, 
                       fill = cut(new_data$Asian.American, seq(65, 90, by = 2.5), include.lowest = TRUE))) +
      scale_fill_manual(name = "Age Range", values = c("#225ea8", "#253494", "#081d58"), na.value = "#636363") +
      labs(title = "Life Expectancies for Asian Americans in 2008") +

      theme_light() + theme(
        plot.title = element_text(color = '#02818a', size = 14, face = 'bold'),
        axis.title.x = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic'),
        axis.title.y = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic') 
      )
    plot2asa + geom_point()
    ggplotly(plot2asa, tooltip="region")
  })
  
  output$plot2na <- renderPlotly({
    
    plot2na <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Native.American, seq(65, 90, by = 2.5), include.lowest = TRUE))) +
      scale_fill_manual(name = "Age Range", values = c("#ffffd9", "#edf8b1", "#c7e9b4", "#7fcdbb", "#1d91c0"), na.value = "#636363")  + 
      labs(title = "Life Expectancies for Native Americans in 2008") +

      theme_light() + theme(
        plot.title = element_text(color = '#02818a', size = 14, face = 'bold'),
        axis.title.x = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic'),
        axis.title.y = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic') 
      )
    plot2na + geom_point() 
    ggplotly(plot2na, tooltip="region") 
  })
  
  output$plot2lat <- renderPlotly({
    
    plot2lat <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Latino, seq(65, 90, by = 2.5), include.lowest = TRUE))) + 
      scale_fill_manual(name = "Age Range", values = c("#41b6c4", "#1d91c0", "#225ea8", "#253494", "#081d58"), na.value = "#636363") +
      labs(title = "Life Expectancies for Latinos in 2008") +
      theme_light() + theme(
        plot.title = element_text(color = '#02818a', size = 14, face = 'bold'),
        axis.title.x = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic'),
        axis.title.y = element_text(color = '#bfd3e6', size = 10, face = 'bold.italic') 
      )
    plot2lat + geom_point()
    ggplotly(plot2lat, tooltip="region")
  })
  
  ################## 
  ### Question 3 ###
  ##################
  # Question 3 Plots - Sebastian
  output$plot3a <- renderPlot({
    
    plot3a <- ggplot(data = pct_women_poor_health) +
      geom_point(mapping = aes(x = Location, y = All.Women,
                               size = All.Women, color = Location)) +
      labs(title = "Percent of Adult Women Reporting Fair or Poor Health Status by Race/Ethnicity",
           x = "Location (State/Territory)",
           y = "Percentage of Women Reporting Fair/Poor Health Status") +
      theme(axis.text.x = element_blank())
    plot3a
  })
  
  output$plot3b <- renderPlot({
    
    plot3b <- ggplot(data = pct_men_poor_health) +
      geom_point(mapping = aes(x = Location, y = All.Men,
                               size = All.Men, color = Location)) +
      labs(title = "Percent of Adult Men Reporting Fair or Poor Health Status by Race/Ethnicity",
           x = "Location (State/Territory)",
           y = "Percentage of Men Reporting Fair/Poor Health Status") +
      theme(axis.text.x = element_blank())
    plot3b
  })
  
  output$plot3cw <- renderPlotly({
    
    plot3cw <- ggplot(data = state_dist_uninsured_by_race) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(state_dist_uninsured_by_race$White, seq(0.1, 0.9, by = 0.2), include.lowest = TRUE))) +
      scale_fill_manual(values = c("#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot3cw + geom_point()
    ggplotly(plot3cw, tooltip="region")
    plot3cw
  })
  
  output$plot3cb <- renderPlotly({
    
    plot3cb <- ggplot(data = state_dist_uninsured_by_race) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(state_dist_uninsured_by_race$Black, seq(0.1, 0.9, by = 0.2), include.lowest = TRUE))) +
      scale_fill_manual(values = c("#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot3cb + geom_point()
    ggplotly(plot3cb, tooltip="region")
    plot3cb
  })
  
  output$plot3ch <- renderPlotly({
    
    plot3ch <- ggplot(data = state_dist_uninsured_by_race) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(state_dist_uninsured_by_race$Hispanic, seq(0.1, 0.9, by = 0.2), include.lowest = TRUE))) +
      scale_fill_manual(values = c("#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot3ch + geom_point()
    ggplotly(plot3ch, tooltip="region")
    plot3ch
  })
}
