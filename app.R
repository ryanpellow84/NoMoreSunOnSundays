library(shiny)
ui <- shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("nrows",
                  "Number of rows:",
                  min = 1,
                  max = 50,
                  value = 10)
    ),
    mainPanel(
      plotOutput("carsPlot"),
      tableOutput("carsTable")
    )
  )
))
server <- shinyServer(function(input, output) {
  df <- reactive({head(cars, input$nrows)})
  output$carsPlot <- renderPlot({plot(df())})
  output$carsTable <- renderTable({df()})
})
shinyApp(ui = ui, server = server)
