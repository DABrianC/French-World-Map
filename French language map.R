
remotes::install_github("walkerke/mapgl")

library(tidyverse)
#library(mapgl)
library(htmltools)
library(htmlwidgets)
library(leaflet)
library(leaflet.extras)
#pak::pak("rstudio/leaflet.providers")

#mapgl::maplibre()

library(leaflet.providers)

str(providers_default(), max.level = 2)

url <- "https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"
url1 <- "https://{s}.tile.openstreetmap.en/osmen/{z}/{x}/{y}.png"

leaflet() |> 
  addTiles(group = "OpenStreepMap") |> 
  addProviderTiles("OpenStreetMap.France"
                   , group = "Open Street Map French") |> 
  addProviderTiles(providers$Esri.WorldImagery
                   , group = "Satellite") |>
  setView(lng = 90, lat = 50, zoom = 2) |> 
  addLayersControl(
    baseGroups = c("OpenStreepMap", "OpenStreetMap French", "Satellite")
    , position = "topright"
    , options = layersControlOptions(collapsed = FALSE)
  ) |> 
addControl(
  html = "<b>Carte interactive de l'Asie</b>",  # HTML title in French
  position = "topleft")

