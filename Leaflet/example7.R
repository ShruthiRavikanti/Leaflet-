#installing leaflet package
#install.packages("leaflet")
library(leaflet)


#help 
?leaflet

###addTiles function ####

mymap <- leaflet() 
mymap <- addTiles(mymap)
mymap

####addTiles function using pipe operator ####
mymap <- leaflet() %>%
  addTiles()
mymap  

####3rd party Tile  ####

mymap <- leaflet() %>%
  addProviderTiles(providers$Stamen.Toner)
mymap  

mymap <- leaflet() %>%
  addProviderTiles(providers$CartoDB.Positron)
mymap  

mymap <- leaflet() %>%
  addProviderTiles(providers$Esri.NatGeoWorldMap)
mymap 

####SetView() & addMarkers() functions

mymap <- leaflet() %>%
  addTiles() %>%
  setView(lng = 78.0419, lat = 27.1750, zoom=15)%>%
  addMarkers(lng = 78.0419, lat = 27.1750, popup = "Taj Mahal, Agra, India") 
mymap

#### saving the map ####
library(htmlwidgets)
saveWidget(widget=mymap, file = "mymap.html")


