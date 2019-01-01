##  addPolygons() function


## Source of shape file
# http://thematicmapping.org/downloads/world_borders.php


setwd("C:/Users/Lenovo/Desktop/data science/Leaflet")

## Download the shape files to working directory ##
download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip" , destfile="TM_WORLD_BORDERS_SIMPL-0.3.zip")
## Unzip them ##
unzip("TM_WORLD_BORDERS_SIMPL-0.3.zip")


install.packages("rgdal")

library(leaflet)
library(rgdal) # R 'Geospatial' Data Abstraction Library. 


## Load the shape file to a Spatial Polygon Data Frame (SPDF) using the readOGR() function
myspdf = readOGR(dsn=getwd(), layer="TM_WORLD_BORDERS_SIMPL-0.3")
head(myspdf)
summary(myspdf)


head(myspdf@data)

## Create map object and add tiles and polygon layers to it
leaflet(data=myspdf) %>% 
  addTiles() %>% 
  setView(lat=10, lng=0 , zoom=2) %>% 
  addPolygons(fillColor = "green",
              highlight = highlightOptions(weight = 1,
                                           color = "red",
                                           fillOpacity = 0.7,
                                           bringToFront = TRUE),
              label=~NAME)