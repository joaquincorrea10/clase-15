library(shiny)
library(tidyverse)

# User interface
ui = fluidPage(
      numericInput(inputId = "size", "Sample size", value = 25),  
      plotOutput(outputId = "figura")
)

# Server
server = function(input, output) {
output$figura = renderPlot({
                            datos = data.frame(x = rnorm(n = input$size , mean = 0, sd = 10),
                                               y = rnorm(n = input$size , mean = 0, sd = 10))
                            p = ggplot() + geom_point(data = datos , aes(x=x,y=y)) + theme_bw()
                            p
                })
}

# Run the application 
shinyApp(ui = ui, server = server)
