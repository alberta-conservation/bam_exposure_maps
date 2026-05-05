- [Overview](#overview)
- [Download BAM maps](#download-bam-maps)
- [References](#references)

# Overview

This document shows the process of downloading BAM v5 maps for BCR 6
South and processing the rasters to create exposure metrics.

<style type="text/css">
pre {
  max-height: 300px;
  overflow-y: auto;
}
pre[class] {
  max-height: 100px;
}
</style>

# Download BAM maps

Use `1_code/r_notebooks/path.Rmd`.

This section shows the process of downloading the BAM maps for BCR 6S
and saving them to a folder.

First, install (if necessary) and load the BAMexploreR library.

``` r
# install.packages("remotes")
remotes::install_github("borealbirds/BAMexploreR")

library(BAMexploreR)
```

Next, load the BAM species table and the v5 and ABMI bird species lists.
Then filter for speices that are present in both lists.

``` r
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
```

Finally, download the maps for BCR 6.1 and send to the ‘bam_v5_maps’
folder.

``` r
# Download the maps and store in teh bam_v5_maps folder
bam_get_layer(spList = abmi_bam$speciesCode, version = "v5", destfile = "0_data/bam_v5_maps", year = 2020, bcrNM = "can61")
```

# References

<div id="refs">

</div>

<!--chapter:end:index.Rmd-->
