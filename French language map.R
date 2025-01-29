
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

leaflet()  %>% 
  addTiles(urlTemplate = url, group = "French place names") |> 
  addProviderTiles(providers$MapTilesAPI.OSMEnglish
                   , group = "English place names") |> 
  addProviderTiles(providers$CartoDB.Positron
                   , group = "CartoDB Positron") |> 
  addProviderTiles(providers$Esri.WorldImagery
                   , group = "Esri Satellite") |>
  setView(lng = 90, lat = 50, zoom = 2) |> 
  addLayersControl(
    baseGroups = c("French place names"
                   , "English place names"
                   , "CartoDB Positron"
                   , "Esri Satellite")
    , position = "topright"
    , options = layersControlOptions(collapsed = FALSE)
  ) |> 
  


  #addTiles(group = "OpenStreetMap (France)") |> 
  addTiles(group = "OSM (default)")  %>% 
  setView(lng = 90, lat = 50, zoom = 2) %>% 
  addProviderTiles(providers$CartoDB.Positron
                   , group = "CartoDB Positron")  %>% 
  addProviderTiles(providers$Esri.WorldImagery
                   , group = "Esri Satellite") %>% 
  addProviderTiles(providers$Stamen.Terrain
                   , group = "Stamen Terrain") %>%
  addLayersControl(
    baseGroups = c("OSM (default)"
                   , "CartoDB Positron"
                   , "Esri Satellite"
                   , "Stamen Terrain"),
    position = "topright",
    options = layersControlOptions(collapsed = FALSE)
    )
  
  addControl(
    html = "<b>Carte interactive de l'Asie</b>",  # HTML title in French
    position = "topleft"
  ) |> 

    
    
library(leaflet)
library(htmlwidgets)
  
  # Create the map focusing on Asia
  my_map <- leaflet() %>%
    # Add different basemap options
    addProviderTiles(providers$OpenStreetMap.France, group = "OpenStreetMap (France)") %>%
    addProviderTiles(providers$CartoDB.Positron, group = "CartoDB Positron") %>%
    addProviderTiles(providers$Esri.WorldImagery, group = "Esri Satellite") %>%
    addProviderTiles(providers$Stamen.Terrain, group = "Stamen Terrain") %>%
    
    # Set default view on Asia
    setView(lng = 100, lat = 30, zoom = 3) %>%
    
    # Add a title to the map
    addControl(
      html = "<b>Carte interactive de l'Asie</b>",
      position = "topleft"
    ) %>%
    
    # Add a layers control for switching basemaps
    addLayersControl(
      baseGroups = c("OpenStreetMap (France)"
                     , "CartoDB Positron"
                     , "Esri Satellite"
                     , "Stamen Terrain"),
      position = "topright",
      options = layersControlOptions(collapsed = FALSE)
    )
  
  my_map
  # Save the map as an HTML file
  saveWidget(my_map, file = "asia_map.html", selfcontained = TRUE)

  
  outline <- quakes[chull(quakes$long, quakes$lat),]
  
map <- leaflet() |> 
  addTiles(urlTemplate = url
           , group = "OSM (default)") |>  # Default OSM layer
  setView(lng = 100, lat = 30, zoom = 3) |>  # Ensure initial view is set
  addProviderTiles(providers$CartoDB.Positron
                   , group = "CartoDB Positron") |> 
  addProviderTiles(providers$Esri.WorldImagery
                   , group = "Esri Satellite") |> 
  addProviderTiles(providers$Stamen.Terrain
                   , group = "Stamen Terrain") |> 
  addLayersControl(
    baseGroups = c("OSM (default)"
                   , "CartoDB Positron"
                   , "Esri Satellite"
                   , "Stamen Terrain"),
    position = "topright",
    options = layersControlOptions(collapsed = FALSE)
  )
 
map
group = "OSM (default)") %>%
    addProviderTiles(providers$CartoDB.Positron, group = "Positron (minimal)") %>%
    addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery (satellite)") %>%
    # Overlay groups
    
    # Layers control
    addLayersControl(
      baseGroups = c(
        "OSM (default)",
        "Positron (minimal)",
        "World Imagery (satellite)"
      ),
      #overlayGroups = c("Quakes", "Outline"),
      options = layersControlOptions(collapsed = FALSE)
    )
  map  

  