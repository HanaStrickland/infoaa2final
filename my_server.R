server <- function(input, output) {
  # Server stuff
  output$plot1 <- renderPlot({

    plot1 <- ggplot(data = income_by_le) +
      geom_point(mapping = aes(x = Avg.Life.Expectancy.Years, y = median_income,  color = Race)) +
      labs(title = "Relationship Between Average Life Expectancy and Median Income",
            x = "Average Life Expectancy",
            y = "Median Income")
    plot1
  })
 }