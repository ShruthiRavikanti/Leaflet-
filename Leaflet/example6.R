#### layers and groups ####


library(leaflet)
leaflet(data=quakes) %>% 
  addTiles(group="OSM") %>% 
  addProviderTiles("Stamen.Toner", group="Toner") %>%  
  addProviderTiles("Stamen.TonerLite", group="Toner Lite") %>%  
  addMarkers(lng=~long, lat=~lat, group ="Markers") %>% 
  addCircleMarkers(lng=~long, lat=~lat, group ="Circle Markers") %>% 
  # Now adding the control for layers
    addLayersControl(
    baseGroups = c("OSM", "Toner", "Toner Lite"),
    overlayGroups = c("Markers",  "Circle Markers"),
    options = layersControlOptions(collapsed = FALSE) # control options remains on the map
    )%>% 
  hideGroup("Circle Markers")