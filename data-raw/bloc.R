## code to prepare `bloc` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)

date1 <- "2025-01-01";
date2 <- "2025-12-31"
df_ehs_oph_2025 <- read_excel("data-raw/ehs_oph_bloc_2025.xlsx")

df_oph_2025 <- df_ehs_oph_2025  %>%
  mutate(DATE_INTERVENTION=dmy(DATE_INTERVENTION)) %>% #2025
  mutate(DATENAIS_PATIENT=dmy(DATENAIS_PATIENT)) %>%   #2025
  dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(AGE=trunc((DATENAIS_PATIENT %--% DATE_INTERVENTION) / years(1))) %>%
  mutate(STRUCTURE ="EH_OPHTALMOLOGIE",SEXE = SEXE_PATIENT,DIAGNOSTIC = ACTE) %>%
  mutate(TYPE = recode(TYPE,
                       "Ordinario"        = "Programme",
                       "Ambulatorio"      = "Programme",
                       "Urgencia"         ="Urgence")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)

usethis::use_data(df_oph_2025, overwrite = TRUE)
rm(df_ehs_oph_2025,df_oph_2025,date1,date2)
