## code to prepare `sig.c` dataset goes here

if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)


sig.c <- read_sf("data-raw/shp/gadm41_DZA_2.shp")

sig.c <- sig.c %>% select(CC_2,NAME_1,NAME_2,geometry)

usethis::use_data(sig.c, overwrite = TRUE)

rm(sig.c)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
remove.packages("datasets.dsp")
