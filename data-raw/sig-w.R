## code to prepare `sig.w` dataset goes here

if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)


sig.w  <- read_sf("data-raw/shp/gadm41_DZA_1.shp",stringsAsFactors = TRUE)

sig.w <- sig.w %>% select(CC_1,NAME_1,geometry)

usethis::use_data(sig.w, overwrite = TRUE)

rm(sig.w)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
remove.packages("datasets.dsp")
