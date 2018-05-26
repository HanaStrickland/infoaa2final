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
  
  output$plot2 <- renderPlotly({
    
    plot2 <- ggplot(data = change) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$African.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot2 + geom_point()
    ggplotly(plot2, tooltip="region")
  })
}








