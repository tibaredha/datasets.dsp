## code to prepare `sscolaire` dataset goes here
## code to prepare `budget` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)

# Example usage
mdo <- read.csv("data-raw/mdo/epsp_djelfa/mdo_2025.csv")
mdo %>% select(NOM,PRENOM,SEXE1,AGE,COMM1,DATDMAL,PTHOLOGI1) %>% count(PTHOLOGI1) %>%  view()




usethis::use_data(mdo, overwrite = TRUE)
rm(mdo)

## mise a jour documentation ----
devtools::document()
#devtools::build_readme()
#remove.packages("datasets.dsp")
#reinstall package
#datasets.dsp::budget %>% dplyr::filter(annee=="2025")

