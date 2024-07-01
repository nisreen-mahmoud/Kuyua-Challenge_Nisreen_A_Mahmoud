library(ggplot2)
library(broom)
library(sf)  
library(leaflet)
library(leafgl)
library(colourvalues)
library(leaflet.extras)
library(rgdal)  # for vector work; sp package should always load with rgdal 
library (raster)   # for metadata/attributes- vectors or rasters
setwd("D://personal//Nasreen")
data("biodiversity.csv") # dataframe of occurrences
print(nrow(occs_unique))
df <- read.csv('biodiversity.csv',  sep = "\t")#header = FALSE,
head(df)
df1 <- df[c('institutionCode', 'decimalLatitude', 'decimalLongitude', 'occurrenceStatus')]
head(df1)
#df2 <- df1[rowSums(is.na(df1)) != ncol(df1),]
df1[rowSums(is.na(df1)) != ncol(df1), ]
df3 <- df[which(!is.na(df1$decimalLatitude) & !is.na(df1$decimalLongitude)),]
p.sf <- st_as_sf(df3, coords = c("decimalLongitude", "decimalLatitude"), crs = 4326)
st_write(p.sf,
         "D://personal//Nasreen/biodiversity_data1.shp", driver = "ESRI Shapefile")
