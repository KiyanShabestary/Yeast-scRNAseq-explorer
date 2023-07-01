#ShinyScRNASeq - UI

library(shiny)
library(ggplot2)

ui <- fluidPage(

  headerPanel("Yeast scRNAseq datasets explorer"),
  sidebarPanel(
    selectInput('dataset','Please Select Dataset',#Use renderUI in next versions
                choices=c('Nadal-Ribelles2019')),

    # Nadal-Ribelles2019 data
    conditionalPanel(condition = "input.Dataset == Nadal-Ribelles2019",#Use renderUI in next versions
                     selectInput('condition','Please Select Condition',
                                 choices=c('Rich Media (YPD)'))),

    radioButtons("type", "Select Gene Name by:",
                 choices=c("Systematic Name" = "sysName","Common Name" = "comName")),


    br(),
    uiOutput('nameType'),


    #helpText()

    sliderInput("bins", label = "Number of bins:",
                min = 1, value = 1, max = 10)
  ),
  mainPanel(plotOutput("plot"),verbatimTextOutput("stats"))
)

# ui <- fluidPage(
#   
#   headerPanel("Yeast scRNAseq datasets explorer"),
#   sidebarPanel(
#     selectInput('dataset','Select Dataset',#Use renderUI in next versions
#                 choices=c('Nadal-Ribelles2019')),
#     
#     # Nadal-Ribelles2019 data
#     conditionalPanel(condition = "input.Dataset == Nadal-Ribelles2019",#Use renderUI in next versions
#                      selectInput('condition','Select Condition',
#                                  choices=c('Rich Media (YPD)'))),
#     
#     br(),
#     uiOutput('norm'),
#     
#     radioButtons("type", "Select Gene Name by:",
#                  choices=c("Systematic Name" = "sysName","Common Name" = "comName")),
#     
#     
#     br(),
#     uiOutput('nameType'),
#     
#     
#     #helpText()
#     
#     sliderInput("bins", label = "Number of bins:",
#                 min = 1, value = 1, max = 10)
#   ),
#   mainPanel(plotOutput("plot"),verbatimTextOutput("stats"))
# )
