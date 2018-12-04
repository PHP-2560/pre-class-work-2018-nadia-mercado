#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
ui <- fluidPage(
  titlePanel("Simple Statistic"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numInput", "Z-value input:", value = 1, min = -3, max = 3)
    ),
    mainPanel(
      textOutput("txtOutput")
    )
  )
)

server <- function(input, output) {
  output$txtOutput = renderText({
    paste0("The p-value of the z-value is: ", pnorm(input$numInput, lower.tail = T))
  })
}
shinyApp(ui = ui, server = server)
