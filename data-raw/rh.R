## code to prepare `rh` dataset goes here ----

if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,lubridate,ggthemes,gtsummary,labelled,questionr,readxl)

## import databases ----
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
  dplyr::mutate(sexe= recode(sexe, "homme"="M","femme"="F"))  %>%
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
  dplyr::mutate(specialité = as.factor(specialité)) %>%
  dplyr::mutate(nv_grade = fct_recode(grade,
    "AD"= "Administrateur",
    "AD"= "Administrateur Conseiller",
    "AD"=  "Administrateur analyste",
    "AD"=  "Administrateur en chef des services de santé",
    "AD"=  "Administrateur principal",
    "AD"=  "Administrateur principal des services de santé",

    "MS"= "Praticien médical spécialiste assistant de santé publique",
    "MS"= "Praticien médical spécialiste en chef de santé publique",
    "MS"= "Praticien médical spécialiste hors classe de santé publique",
    "MS"= "Praticien médical spécialiste principal de santé publique",
    "MS"= "Praticien spécialiste assistant",

    "MG"="Médecin généraliste de santé publique",
    "MG"="Médecin généraliste en chef de santé publique",
    "MG"="Médecin généraliste étrangers",
    "MG"="Médecin généraliste hors classe de santé publique",
    "MG"="Médecin généraliste principal de santé publique" ,

    "PH"="Pharmacien généraliste du 1er degré de santé publique",
    "PH"= "Pharmacien généraliste du 2ème degré de santé publique",
    "PH"= "Pharmacien généraliste principal de de santé publique",

    "MD"="Médecin dentiste généraliste de santé publique" ,
    "MD"= "Médecin dentiste généraliste en chef de de santé publique",
    "MD"= "Médecin dentiste généraliste principal de de santé publique" ,
    "MD"= "Médecin dentiste hors classe de santé publique",
    "MD"="Chirurgien-dentiste généraliste de santé publique",
    "MD"= "Chirurgien-dentiste généraliste étrangers",

    "SF"="Sage-femme",
    "SF"= "Sage-femme de santé publique",
    "SF"= "Sage-femme principale",
    "SF"= "Sage-femme spécialisée de santé publique",

    "RX"= "Manipulateur en imagerie médicale de santé publique",
    "RX"= "Manipulateur en imagerie médicale en chef de santé publique",
    "RX"= "Manipulateur en imagerie médicale major de santé publique",
    "RX"= "Manipulateur en imagerie médicale spécialisé de santé publique",

    "LAB"= "Laborantin de santé publique",
    "LAB"= "Laborantin major de santé publique",
    "LAB"= "Laborantin spécialisé de santé publique",

    "AM"="Personnel d’anesthésie de santé publique",
    "AM"="Personnel d’anesthésie spécialisé de santé publique",

    "ATS"= "Aide-soignant de santé publique",
    "ATS"="Aide-soignant de santé publique du 1er degré",
    "ATS"="Aide-soignant de santé publique du 2ème degré",

    "ISP"="Infirmier breveté",
    "ISP"="Infirmier de santé publique",
    "ISP"="Infirmier diplômé d’Etat",
    "ISP"="Infirmier en chef de santé publique",
    "ISP"="Infirmier major de santé publique",
    "ISP"="Infirmier spécialisé de santé publique",

    "BIO"="Biologiste de santé publique",
    "BIO"="Biologiste de santé publique classe 1",
    "BIO"="Biologiste de santé publique classe 2",
    "BIO"="Biologiste principal de santé publique")) %>%
  dplyr::mutate(nv_grade = fct_other(nv_grade,
                    keep = c("AD","MS","MG","PH","MD","SF","RX","LAB","AM","ATS","ISP","BIO")))%>%
 dplyr::select(wilaya,structure,nom,prenom,sexe,datenaissance,age,grade,nv_grade,specialité)



usethis::use_data(rh, overwrite = TRUE)
## remove databases ----

rm(rh)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
