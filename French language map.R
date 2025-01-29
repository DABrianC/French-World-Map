
library(tidyverse)
library(htmltools)
library(htmlwidgets)
library(leaflet)
library(leaflet.extras)



map <- leaflet() |> 
  addTiles(group = "OpenStreepMap") |> 
  addProviderTiles("OpenStreetMap.France"
                   , group = "Open Street Map French") |> 
  addProviderTiles(providers$Esri.WorldImagery
                   , group = "Satellite") |>
  setView(lng = 120, lat = 50, zoom = 2) |> 
  addLayersControl(
    baseGroups = c("OpenStreepMap", "OpenStreetMap French", "Satellite")
    , position = "topright"
    , options = layersControlOptions(collapsed = FALSE)
  ) |> 
addControl(
  html = "<b>Carte Interactive de l'Asie</b>",  # HTML title in French
  position = "topleft")

saveWidget(map, file = "./Carte_Asie.html", selfcontained =  TRUE)
