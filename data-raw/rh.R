## code to prepare `rh` dataset goes here

if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,lubridate,ggthemes,gtsummary,labelled,questionr,readxl)

rh <- read_excel("data-raw/rh_2025.xlsx",col_names = FALSE, skip = 1)
colnames(rh) <- c("wilaya","structure",
                  "id","nom","prenom","nom_ar","prenom_ar","sexe","datenaissance",
                  "decret","echelon","grade_ar","grade","dateinstalation",
                  "specialité","promotion","affectation")
rh <- rh %>%
  dplyr::select(wilaya,structure,sexe,datenaissance,grade,specialité,nom,prenom) %>%
  dplyr::mutate(wilaya = as.factor(wilaya)) %>%
  dplyr::mutate(structure = as.factor(structure)) %>%
  dplyr::mutate(structure = recode(structure,
                                   "DSP Direction de la santé et de la population de la wilaya de Djelfa"="DSP Djelfa",
                                   "EPH Etablissement Public Hospitalier BIRINE"="EPH Birine",
                                   "EPH Etablissement Public Hospitalier AIN OUSSARA"="EPH AO",
                                   "EPSP Etablissement Public de Santé de Proximité Ain Ouassara"="EPSP AO",
                                   "EPSP Etablissement Public de Santé de Proximité HASSI BAHBAH"="EPSP HBB",
                                   "EPH Etablissement Public Hospitalier de HASSI BAHBAH"="EPH HBB",
                                   "EPSP Etablissement Public de Santé de Proximité DJELFA"="EPSP Djelfa",
                                   "EPH Etablissement Public Hospitalier DJELFA"="EPH Djelfa",
                                   "EHS Etablissement Hospitalier Spécialisé MERE ET ENFANT DR KAKI MOHAMED DJELFA"="EHS ME",
                                   "EHS Etablissement Hospitalier Spécialisé CAC DJELFA"="EHS CAC",
                                   "EPH HOPITAL MIXTE DE DJELFA MOUDJAHID HATHAT BOUBAKEUR"="EPH Mixte",
                                   "EPH Etablissement Public Hospitalier El Idrissia"="EPH Idrissia",
                                   "INFPM Institut de Formation Paramédicale Djelfa"="INFPM Dj1",
                                   "INFPM Institut de Formation Paramédicale Djelfa 2"="INFPM Dj2",
                                   "EPSP Etablissement Public de Santé de Proximité MESSAAD"="EPSP MES",
                                   "EPH Etablissement Public Hospitalier MESSAAD"="EPH MES",
                                   "EPSP Etablissement Public de Santé de Proximité GUETTARA"="EPSP GUE",
                                   "EH Etablissement hospitalier Ophtalm Djelfa"="EHO Djelfa")) %>%
  dplyr::mutate(sexe=as.factor(sexe))  %>% #view()
  dplyr::mutate(datenaissance=as.Date (datenaissance))  %>%
  #dplyr::mutate(datenaissance=dmy(datenaissance))%>%
  dplyr::mutate(age=trunc((datenaissance %--% Sys.Date()) / years(1))) %>%
  dplyr::mutate(grade = as.factor(grade)) %>%
  dplyr::mutate(grade = recode(grade,
                               "0 Praticien médical spécialiste assistant de santé publique"="Praticien médical spécialiste assistant de santé publique",
                               "0 Praticien médical spécialiste en chef de santé publique"  ="Praticien médical spécialiste en chef de santé publique",
                               "0 Praticien médical spécialiste hors classe de santé publique"="Praticien médical spécialiste hors classe de santé publique",
                               "0 Praticien médical spécialiste principal de santé publique"="Praticien médical spécialiste principal de santé publique",
                               "0 Praticien spécialiste assistant"="Praticien spécialiste assistant")) %>%
  dplyr::mutate(specialité = as.factor(specialité))




usethis::use_data(rh, overwrite = TRUE)
