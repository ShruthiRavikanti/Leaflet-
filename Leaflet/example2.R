######### Add Circle to R Leaflet map ##########
library("leaflet") 

setwd("C:/Users/Lenovo/Desktop/data science/Leaflet")

# Read the data from .csv file
cities=read.csv("pop.csv")


leaflet(data=cities) %>% 
  addTiles() %>%
  addCircles(lng = ~Long, 
             lat = ~Lat, 
             weight = 5,
             radius = ~sqrt(Pop) * 30, 
             popup = ~City,
             fillColor = "transparent",
             highlightOptions = highlightOptions(
              weight = 10, 
               color = "brown", 
               fillColor = "green"),
             label = ~City
             
  )
