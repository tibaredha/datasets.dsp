## code to prepare `bloc` dataset goes here ----
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)
## date ----
date1 <- "2024-01-01";
date2 <- "2025-12-31"
## load 2024 ----
df_oph_2024 <- read_excel("data-raw/bloc/ehs_oph_bloc_2024.xlsx" )

df_oph_2024 <- df_oph_2024  %>%
              dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
              mutate(AGE=trunc((DATENAIS_PATIENT %--% DATE_INTERVENTION) / years(1))) %>%
              mutate(STRUCTURE ="EH_OPHTALMOLOGIE",SEXE = SEXE_PATIENT,DIAGNOSTIC = ACTE) %>%
              mutate(TYPE = recode(TYPE,
                                 "Hospitalisation"  = "Programme",
                                 "Ambulatoire"      = "Programme")) %>%
              select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)


## load 2025 ----
df_oph_2025 <- read_excel("data-raw/ehs_oph_bloc_2025.xlsx")

df_oph_2025 <- df_oph_2025 %>%
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

## combine datasets ----
bloc <- rbind(df_oph_2024,df_oph_2025)
rm(df_oph_2024,df_oph_2025)

## save datasets ----
usethis::use_data(bloc, overwrite = TRUE)

## remove data ----
rm(bloc,date1,date2)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
remove.packages("datasets.dsp")
