#### Add  legend to map ####

library(leaflet)
set.seed(122)

# Sample the data for 50 observations
quakes1=quakes[sample(nrow(quakes),50),]

str(quakes1)
summary(quakes1)

#### create earthquake magnitude range ####
quakes1$magrange = cut(quakes1$mag,
                       breaks = c(4, 5, 6, 7), right=FALSE,
                       labels=c("Light[4-5)","Moderate[5-6)", "Strong[6-7)"))

#### Define a color palette ####
pal=colorFactor(palette = c("yellow","red","green"),domain = quakes1$magrange)

#### Create the map object ,add circle marker & add legend ####
leaflet(data = quakes1) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(lng = ~ long,
                   lat = ~ lat,
                   color = ~ pal(magrange),
                   label = paste("Magnitude=", quakes1$mag, "Type=", quakes1$magrange)
                   ) %>%
  addLegend(position = "bottomright",
            pal = pal,
            values = ~magrange,
            title =  "Magnitude",
            opacity = 1)







