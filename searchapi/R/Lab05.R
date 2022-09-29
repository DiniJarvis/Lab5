#' This is an API package 
#'  
#'  
#'  This package interacts with OpenStreetmaps 
#'  
#'  @param  place (string)
#'  
#'  @return latitude and longitude
#'  
#'  @examples     
#'  latlong(Lund)
#'  
#'  @export



library(shiny)
library(magrittr)
library(leaflet)
library(rvest)
library(knitr)
library(tidyverse)
library(dplyr)
library(httr)
library(jsonlite)


# place<-"Lund"  #place input!



latlong<-function(place)
{
  z<-list(address=place) #create the list of parameters I will send to google.
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

