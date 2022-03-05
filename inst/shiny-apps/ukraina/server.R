server <- function(input, output) {
  data <- read.csv("https://raw.githubusercontent.com/Inkimar/plants-and-animals/master/test/ua.csv")
  points <- st_as_sf(data, coords = c("lng", "lat"), crs = 4326)
  polygons <- points %>% 
    point_to_h3(., 4) %>% 
    h3_to_polygon(., simple = FALSE)
  
  #cities <- read.csv("shelters.csv") 
  cities <- read.csv("https://raw.githubusercontent.com/Inkimar/plants-and-animals/master/test/shelters.csv")
  cities_help <- st_as_sf(cities, coords = c("longitude", "latitude"), crs = 4326)
  
  # output$map <- renderLeaflet({
  #   # rendering the map 
  #   mapview(cities_help, cex=10, popup = popupTable(cities_help,zcol = c("city","info","capacity")),col.regions="red")@map
  #       #leaflet(cities_help, cex=10, popup = popupTable(cities_help,zcol = c("city","info")),col.regions="red")
  #   })
  
  output$map <- renderLeaflet({
    mapview(list(points, polygons))@map
    # mapview(cities_help, cex=10, popup = popupTable(cities_help,zcol = c("city","info","capacity")),col.regions="red")@map
  })
  
}