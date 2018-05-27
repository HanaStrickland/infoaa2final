
server <- function(input, output) {
  source("data_wrangling.R")
  
  
  # Server stuff
  ################## 
  ### Question 1 ###
  ##################
  
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
  
  
  ################## 
  ### Question 2 ###
  ##################
  output$plot2white <- renderPlotly({

    plot2white <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group,
                       fill = cut(new_data$White, seq(60, 90, by = 2), include.lowest = FALSE))) +
      scale_fill_manual(values = c("#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot2white + geom_point()
    ggplotly(plot2white, tooltip="region")
  })
  
  output$plot2afa <- renderPlotly({
    
    plot2afa <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, 
                       fill = cut(new_data$African.American, seq(60, 90, by = 2), include.lowest = FALSE))) +
      scale_fill_manual(values = c("#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot2afa + geom_point()
    ggplotly(plot2afa, tooltip="region")
  })
  
  output$plot2asa <- renderPlotly({
    
    plot2asa <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, 
                       fill = cut(new_data$Asian.American, seq(60, 90, by = 2), include.lowest = FALSE))) +
      scale_fill_manual(values = c("#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot2asa + geom_point()
    ggplotly(plot2asa, tooltip="region")
  })
  
  output$plot2na <- renderPlotly({
    
    plot2na <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Native.American, seq(60, 90, by = 2), include.lowest = FALSE))) +
      scale_fill_manual(values = c("#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot2na + geom_point()
    ggplotly(plot2na, tooltip="region")
  })
  
  output$plot2lat <- renderPlotly({
    
    plot2lat <- ggplot(data = new_data) +
      geom_polygon(aes(x = long, y = lat, group = group, fill =
                         cut(new_data$Latino, seq(60, 90, by = 2), include.lowest = FALSE))) +
      scale_fill_manual(values = c("#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#0c2c84"), na.value = "#636363") 
    plot2lat + geom_point()
    ggplotly(plot2lat, tooltip="region")
  })
}
