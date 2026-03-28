## code to prepare `sscolaire` dataset goes here
## code to prepare `budget` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)

name_ss <- function(uds_x,range_x,sheet_x) {
  ss_hbb <- read_excel(uds_x, col_names = FALSE,skip = 7,range = range_x,sheet = sheet_x )
  colnames(ss_hbb) <- c("etatblissements","PRE","1F","2F","3F","4F","5F","1M","2M","3M","4M","1S","2S","3S","TOT")
  ss_hbb <-  ss_hbb %>% mutate(etatblissements=str_trunc(etatblissements,15)) %>% replace(., is.na(.), 0)
  return(ss_hbb)
}


KACIMI     <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N32","KACIMI") %>% mutate(UDS="KACIMI")
BELAHRECHE <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N34","BELAHRECHE") %>% mutate(UDS="BELAHRECHE")
BENKHAIRA  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N25","BENKHAIRA") %>% mutate(UDS="BENKHAIRA")
BENBADISS  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N19","BEN BADISS") %>% mutate(UDS="BEN BADISS")
AINMAABED  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N19","AIN MAABED") %>% mutate(UDS="AIN MAABED")
ZAAFRANE   <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N21","ZAAFRANE") %>% mutate(UDS="ZAAFRANE")
FATEH      <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N38","FATEH") %>% mutate(UDS="FATEH")
NOOR       <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:N38","NOOR") %>% mutate(UDS="NOOR")
sscolaire <- rbind(KACIMI,BELAHRECHE,BENKHAIRA,BENBADISS,AINMAABED,ZAAFRANE,FATEH,NOOR)
rm(KACIMI,BELAHRECHE,BENKHAIRA,BENBADISS,AINMAABED,ZAAFRANE,FATEH,NOOR)
usethis::use_data(sscolaire, overwrite = TRUE)
rm(sscolaire)

## mise a jour documentation ----
devtools::document()
#devtools::build_readme()
remove.packages("datasets.dsp")
#reinstall package
#datasets.dsp::budget %>% dplyr::filter(annee=="2025")

