## Add Circle Markers


# Load the required packages
library(leaflet)

# Sample the quakes data with 10 data points to avoid cluttering
quakes1 = quakes[sample(nrow(quakes), 10), ]

# Create the map object & add circle marker
leaflet(data=quakes1) %>% 
  addProviderTiles("Esri.WorldImagery") %>%  
  addCircleMarkers(lng = ~ long, 
                   lat= ~ lat) 