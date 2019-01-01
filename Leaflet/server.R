library(shiny)
library(leaflet)

## renderLeaflet() is used at server side to render the leaflet map 

shinyServer(function(input, output) {
  output$mymap <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
      setView(lng = 78.0419, lat = 27.1750 , zoom = 15) %>%
      addMarkers(lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Agra, India") %>%
      addPopups(lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Agra, India") 
    
  })
  
})