#ShinyScRNASeq - Server

library(shiny)
library(ggplot2)

server <- function(input, output) {

  # To select genes based on systematic name or common name
  getNameType <- reactive({
    switch (input$type,
            "sysName" = df$geneName,
            "comName" = df$comGeneName,
    )
  })

  dataset <- reactive({
    switch (input$type,
            "sysName" = as.numeric(df[df["geneName"] == input$geneType,3:ncol(df)]),
            "comName" = as.numeric(df[df["comGeneName"] == input$geneType,3:ncol(df)]),
    )
  })


  # renderUI on type of gene name selected
  output$nameType <- renderUI({
    selectInput('geneType','Please Select Gene Name',
                choices=getNameType())#df$geneName or df$comGeneName
  })



  output$plot <- renderPlot({
    #hist(rnorm(100))
    dataPerGene=dataset() #cleaner to get data transformation out of the plot function
    df_dataPerGene=data.frame(dataPerGene)

    ggplot(df_dataPerGene) +
      geom_histogram(aes(dataPerGene, ..density..), binwidth = input$bins, colour = "black", fill = "white")

  })
  # output$stats <- renderPrint({
  #   #Paste statistics here
  # })

}

# server <- function(input, output) {
#   
#   getDf <- reactive({
#     if (input$norm == "raw"){
#       df = df_raw
#     }
#     if (input$norm == "sizeFactor"){
#       df = df_sf
#     }
#   })
#   
#   # To select genes based on systematic name or common name
#   getNameType <- reactive({
#     df=getDf()
#     switch (input$type,
#             "sysName" = df$geneName,
#             "comName" = df$comGeneName,
#     )
#   })
#   
#   getDataType <- reactive({
#     df=getDf()
#     switch (input$type,
#             "sysName" = as.numeric(df[df["geneName"] == input$geneType,3:ncol(df)]),
#             "comName" = as.numeric(df[df["comGeneName"] == input$geneType,3:ncol(df)]),
#     )
#   })
#   
#   
#   # renderUI on type of gene name selected
#   output$nameType <- renderUI({
#     selectInput('geneType','Select Gene Name',
#                 choices=getNameType())#df$geneName or df$comGeneName
#   })
#   
#   output$norm <- renderUI({
#     radioButtons("norm", "Normalization Type:",
#                  choices=c("Raw" = "raw","Size factors (DESeq2)" = "sizeFactor"))
#   })
#   
#   
#   output$plot <- renderPlot({
#     dataPerGene=getDataType() #cleaner to get data transformation out of the plot function
#     df_dataPerGene=data.frame(dataPerGene)
#     
#     ggplot(df_dataPerGene) +
#       geom_histogram(aes(dataPerGene, ..density..), binwidth = input$bins, colour = "black", fill = "white")
#     
#   })
#   # output$stats <- renderPrint({
#   #   #Paste statistics here 
#   # })
#   
# }
