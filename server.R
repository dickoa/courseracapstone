library(shiny)
library(tm)
library(devtools)
if (!require(swiftcap))
  devtools::install_github("nickwallen/swiftcap")
library(swiftcap)

ngram <- readRDS("ngram.rds")

### Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  ## Return the requested dataset
  datasetInput <- reactive({
    predict_word(tolower(input$current_sentence))
  })
  
  ## You can access the value of the widget with input$text, e.g.
  output$value <- renderText({
    paste(tolower(input$text), predict_word(tolower(input$text)))
  })
  
  predict_word <- function(current_sentence) {
    pred <- predict(ngram, current_sentence)
    pred <- removePunctuation(pred$word)
    pred[nchar(pred) > 0][1]
  }
})
