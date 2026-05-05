
library(sf)
library(tidyverse)
library(terra)
library(ggplot2)
library(tidyterra)

mine <- st_read("0_data/shapefiles/Surface Mineable Area_NAD83_10TM_AEPForest.shp")
osr <- st_read("0_data/shapefiles/oil_sands_areas.shp")

bcr <- st_read("0_data/shapefiles/BCR6S.shp")

btnw <- rast("0_data/bam_v5_maps/BTNW_can61_2020.tif")


btnw_crop <- crop(btnw, vect(bcr), mask = TRUE)

btnw_abund <- btnw_crop$mean*10^2

ggplot() + geom_spatraster(data = btnw_abund) + geom_sf(data = osr_grid, fill = NA) + 
  geom_sf(data = mine, fill = NA, colour = "red")

btnw_osr <- crop(btnw_abund, vect(osr_grid), mask = TRUE)
plot(btnw_osr)

btnw_pop_bcr <- round(sum(values(btnw_abund), na.rm = TRUE))
btnw_pop_osr <- round(sum(values(btnw_osr), na.rm = TRUE))

btnw_area_bcr <- length(which(!is.na(values(btnw_abund))))*prod(res(btnw))/1000^2
btnw_area_osr <- length(which(!is.na(values(btnw_osr))))*prod(res(btnw))/1000^2

osr_expected <- btnw_area_osr/btnw_area_bcr
osr_obs <- btnw_pop_osr/btnw_pop_bcr

osr_index <- (osr_obs - osr_expected)/osr_expected
osr_obs/osr_expected - 1

