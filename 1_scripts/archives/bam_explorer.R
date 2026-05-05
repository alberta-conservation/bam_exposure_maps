
# install.packages("remotes")
# remotes::install_github("borealbirds/BAMexploreR", build_vignettes=TRUE)

library(BAMexploreR)
library(terra)

vignette(package="BAMexploreR")

vignette("BAMexploreR_1_intro")

vignette("BAMexploreR_2_access")

bam_map_bcr("v5")

subUnit <- bam_get_bcr("v5")

sppList <- bam_spp_list("v5")

btnw <- sppList[which(sppList == "BTNW")]

bam_get_layer(, "v5")

cosewic_v5_cn <- bam_spp_list("v5", "commonName", "COSEWIC")

aoi_sf <- vect(system.file("extdata", "vignette_poly_5072.shp", package = "BAMexploreR"))
bcraoi_v5 <- bam_get_bcr("v5", ext=aoi_sf) 

result <- bam_get_layer("BTNW", "v5", destfile = tempdir(), year = "2020", bcrNM="can61")

b <- rast("BTNW_can61_2020.tif")
