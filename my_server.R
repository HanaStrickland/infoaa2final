server <- function(input, output) {
  source("data_wrangling.R")
  
  
  # Server stuff
  output$plot1a <- renderPlot({

    plot1a <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Avg.Life.Expectancy.Years, y = median_income,  color = Race)) +
      labs(title = "Relationship Between Average Life Expectancy and Median Income",
            x = "Average Life Expectancy",
            y = "Median Income")
    plot1a
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
  
  output$plot2a <- renderPlotly({
    
    plot2a <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$White, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot2a + geom_point()
    ggplotly(plot2a, tooltip="region")
  })
  
  output$plot2b <- renderPlotly({
    
    plot2b <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$African.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot2b + geom_point()
    ggplotly(plot2b, tooltip="region")
  })
  
  output$plot2c <- renderPlotly({
    
    plot2c <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Asian.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot2c + geom_point()
    ggplotly(plot2c, tooltip="region")
  })
}



