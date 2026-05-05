
library(BAMexploreR)


# Get the spp. table from the BAMexploreR package 
spp_tbl <- read.csv("0_data/spp_List.csv")

# Get the spp. list from the v5 BAM models
spp_v5 <- bam_spp_list("v5")

# Get the list of bird species for which ABMI has models
abmi_birds <- readRDS("0_data/abmiBirdList.rds")

# Only use birds from the BAM v5 list that are in the ABMI bird models. 

which(abmi_birds$ScientificName %in% spp_tbl$scientificName)

which(spp_tbl$scientificName %in% abmi_birds$ScientificName)

spp_table_v5 <- spp_tbl |> filter(speciesCode %in% spp_v5)

abmi_bam <- spp_table_v5 |> filter(scientificName %in% abmi_birds$ScientificName)

# Download the maps and store in teh bam_v5_maps folder
bam_get_layer(spList = abmi_bam$speciesCode, version = "v5", destfile = "0_data/bam_v5_maps", year = 2020, bcrNM = "can61")


