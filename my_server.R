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
    
    plot2 <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$White, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot2 + geom_point()
    ggplotly(plot2, tooltip="region")
  })
  
  output$plot3 <- renderPlotly({
    
    plot3 <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$African.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot3 + geom_point()
    ggplotly(plot3, tooltip="region")
  })
  
  output$plot4 <- renderPlotly({
    
    plot4 <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Asian.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot4 + geom_point()
    ggplotly(plot4, tooltip="region")
  })
  
  output$plot5 <- renderPlotly({
    
    plot5 <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Native.American, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot5 + geom_point()
    ggplotly(plot5, tooltip="region")
  })
  
  output$plot6 <- renderPlotly({
    
    plot6 <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Latino, breaks = 4))) +
      scale_fill_manual(values = c("#dd3497", "#ae017e", "#7a0177", "#49006a"), na.value = "#f0f0f0") 
    plot6 + geom_point()
    ggplotly(plot6, tooltip="region")
  })
}



