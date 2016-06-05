library(shiny)
shinyUI(fluidPage(
        textInput("text", label = h2("Enter a sentence"), value = "I like"),
        submitButton(text = "Predict next word..."),
        hr(),
        fluidRow((verbatimTextOutput("value")))

))

