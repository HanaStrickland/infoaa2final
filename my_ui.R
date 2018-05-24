ui <- fluidPage(
  
  titlePanel("TITLE"),
  
  sidebarLayout(
    sidebarPanel(
      # Sidebar panel
    ),
    
    mainPanel(
      # Main panel
      navbarPage(
                 tabPanel("Tab 1"),
                 tabPanel("Tab 2"),
                 tabPanel("Tab 3")
      )
    )
  )
  
)