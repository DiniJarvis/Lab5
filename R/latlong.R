#' This is an API package that interacts with OpenStreetmaps
#'  
#'  
#' @param place (string)
#' @return latitude and longitude
#' @export
#' @import tidyverse
#' @import magrittr
#' @import leaflet
#' @import rvest
#' @import knitr
#' @import dplyr
#' @import httr
#' @import jsonlite
#' @import shiny





# place<-"Lund"  #place input!



latlong<-function(place)
{
  
  
  
  z<-list(address=place) 
  url <- "https://nominatim.openstreetmap.org/search?q="
  get_coord = paste0(url, place, "&format=geojson")

  response <- read_html(get_coord) %>%
    html_node("p") %>%
    html_text() %>%
    fromJSON()
  
  lon <- response$features$geometry$coordinates[[1]][1]
  lat <- response$features$geometry$coordinates[[1]][2]
  
  
  #parsed_place<-parsing(get_coord) #I just parse what I receive.
  #x<-parsed_place$results #now all my results are in x!
  #x$formatted_address
  list("latitude"=lat, "longitude" = lon)
}

