#### Add Cluster to map ####

library(leaflet)


#### create earthquake magnitude range ####
quakes$magrange = cut(quakes$mag,
                       breaks = c(4, 5, 6, 7), right=FALSE,
                       labels=c("Light[4-5)","Moderate[5-6)", "Strong[6-7)"))

#### Define a color palette ####
pal=colorFactor(palette = c("yellow","red","green"),domain = quakes$magrange)

#### Create the map object ,add circle marker, add legend & markerClusterS####
leaflet(data = quakes) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(lng = ~ long,
                   lat = ~ lat,
                   color = ~ pal(magrange),
                   label = paste("Magnitude=", quakes$mag, "Type=", quakes$magrange),
                   clusterOptions = markerClusterOptions(freezeAtZoom=4)
  ) %>%
  addLegend(position = "bottomright",
            pal = pal,
            values = ~magrange,
            title =  "Earthquake Type",
            opacity = 0.6)







