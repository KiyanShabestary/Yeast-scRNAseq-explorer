# 
# LOADING LIBRARIES
# ***********************************************
library(shiny)
library(ggplot2)

# LOADING EXTERNAL FUNCTIONS AND DATA
# ***********************************************

# for (Rfile in list.files("R", full.names = TRUE)) {
#   source(Rfile)
# }
# 
# # list of data files
# datalistfiles <- list.files("data", pattern = "\\.Rdata$", full.names = TRUE)
# # load all of them
# for (path in datalistfiles) load(path)

# For individual dataset to be able to rename
df <- readRDS("data/Nadal-Ribelles2019.rds")