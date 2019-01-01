library(shiny)
library(leaflet)
## leafletOutput is used at the ui side to display the rendered map.

shinyUI(bootstrapPage(
  leafletOutput("mymap", height = "600")
  
))