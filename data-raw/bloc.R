## code to prepare `bloc` dataset goes here ----
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)



# 2025
date1 <- "2025-01-01";date2 <- "2025-12-31"
# 1-EPH BIRINE ----

# 2-EPH AO ----
col_types_x <-  c("date","text","numeric","text","text", "text","text")
col_names_x <- c("DATE_INTERVENTION","NOM_PRENOM","AGE","SEXE","DIAGNOSTIC", "MEDECIN","TYPE")
df_ao1_2025_t1 <- read_xlsx("data-raw/bloc/bloc_2025/2-eph_ao/eph_ao_bloc.xlsx",
                         col_types = col_types_x,sheet = "t1",col_names = col_names_x,skip = 1)
df_ao1_2025_t2 <- read_xlsx("data-raw/bloc/bloc_2025/2-eph_ao/eph_ao_bloc.xlsx",
                         col_types = col_types_x,sheet = "t2",col_names = col_names_x,skip = 1)
df_ao1_2025_t3 <- read_xlsx("data-raw/bloc/bloc_2025/2-eph_ao/eph_ao_bloc.xlsx",
                         col_types = col_types_x,sheet = "t3",col_names = col_names_x,skip = 1)
df_ao1_2025_t4 <- read_xlsx("data-raw/bloc/bloc_2025/2-eph_ao/eph_ao_bloc.xlsx",
                         col_types = col_types_x,sheet = "t4",col_names = col_names_x,skip = 1)
df_ao1_2025 <- dplyr::bind_rows(df_ao1_2025_t1,df_ao1_2025_t2,df_ao1_2025_t3,df_ao1_2025_t4)
rm(df_ao1_2025_t1,df_ao1_2025_t2,df_ao1_2025_t3,df_ao1_2025_t4)
eph_ao_25 <- df_ao1_2025 %>%  mutate(STRUCTURE="EPH_AO") %>%
  select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE)
rm(df_ao1_2025)

# 3-EPH HBB ----
col_types_x <-  c("text","text","text","text","date","text","text","text","text")
col_names_x <- c("NOM","PRENOM","AGE","SEXE","DATE_INTERVENTION","MEDECIN","SPEC","DIAGNOSTIC", "TYPE")
eph_hb <- read_xlsx("data-raw/bloc/bloc_2025/3-eph_hbb/eph_hb_bloc.xlsx",
                    col_types = col_types_x,col_names = col_names_x,skip = 1,n_max = 3800)
eph_hb_25 <- eph_hb %>% mutate(AGE = str_sub(AGE, start = 1, end = 2),
                            AGE=as.numeric(AGE),
                            SEXE=ifelse(SEXE=="FEMME","F","M"),
                            TYPE=ifelse(TYPE=="URGENCE","URG","PR"),
                            STRUCTURE="EPH_HB") %>%
  select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE) #%>%  view()
rm(eph_hb)

#  4-EPH MIXTE ----
col_names_x <- c("DATE_INTERVENTION","NOM_PRENOM","AGE","SEXE","ggg","DIAGNOSTIC", "MEDECIN","TYPE")
df_mx1_2025 <- read.csv2("data-raw/bloc/bloc_2025/4-eph_mx/eph_mx_bloc.csv",sep = ";",
                col.names =  col_names_x )
eph_mixte_25 <-  df_mx1_2025  %>%
  mutate(STRUCTURE="EPH_MX",
         DATE_INTERVENTION=dmy(DATE_INTERVENTION),
         AGE=as.numeric(AGE),
         SEXE=ifelse(SEXE=="H","M","F")) %>%
    select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE)
rm(df_mx1_2025)
# 5-EPH Djelfa ----

# 6-EHS ME ----
col_names_x <- c("N","NOM_PRENOM","AGE","MAT","DIAGNOSTIC","TYPE","PARITE","MEDECIN","DATE_INTERVENTION")
url_path <- "data-raw/bloc/bloc_2025/6-eh_me/ehs_me_bloc.xlsx"
ehs_me_1 <- read_xlsx(url_path,col_names = col_names_x,sheet = "01",skip = 1)
ehs_me_2 <- read_xlsx(url_path,col_names = col_names_x,sheet = "02",skip = 1)
ehs_me_3 <- read_xlsx(url_path,col_names = col_names_x,sheet = "03",skip = 1)
ehs_me_4 <- read_xlsx(url_path,col_names = col_names_x,sheet = "04",skip = 1)
ehs_me_5 <- read_xlsx(url_path,col_names = col_names_x,sheet = "05",skip = 1)
ehs_me_6 <- read_xlsx(url_path,col_names = col_names_x,sheet = "06",skip = 1)
ehs_me_7 <- read_xlsx(url_path,col_names = col_names_x,sheet = "07",skip = 1)
ehs_me_8 <- read_xlsx(url_path,col_names = col_names_x,sheet = "08",skip = 1)
ehs_me_9 <- read_xlsx(url_path,col_names = col_names_x,sheet = "09",skip = 1)
ehs_me_10 <- read_xlsx(url_path,col_names = col_names_x,sheet = "10",skip = 1)
ehs_me_11 <- read_xlsx(url_path,col_names = col_names_x,sheet = "11",skip = 1)
ehs_me_12 <- read_xlsx(url_path,col_names = col_names_x,sheet = "12",skip = 1)
ehs_me <- dplyr::bind_rows(ehs_me_1,ehs_me_2,ehs_me_3,ehs_me_4,ehs_me_5,ehs_me_6,
                           ehs_me_7,ehs_me_8,ehs_me_9,ehs_me_10,ehs_me_11,ehs_me_12)
rm(ehs_me_1,ehs_me_2,ehs_me_3,ehs_me_4,ehs_me_5,ehs_me_6,
  ehs_me_7,ehs_me_8,ehs_me_9,ehs_me_10,ehs_me_11,ehs_me_12)
ehs_me_25 <- ehs_me %>% mutate(STRUCTURE="EHS_ME",SEXE="F",
                            TYPE=ifelse(TYPE=="P","PR","URG")) %>%
  select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE) #%>% view()
rm(ehs_me)

# 7 EHS_CAC ----
col_types_x <-  c("text","text","text","text","date","text","text","text","text")
col_names_x <- c("NOM","PRENOM","AGE","SEXE","DATE_INTERVENTION","MEDECIN","SPEC","DIAGNOSTIC", "TYPE")
ehs_cac <- read_xlsx("data-raw/bloc/bloc_2025/7-cac/ehs_cac_bloc.xlsx",
                         col_types = col_types_x,col_names = col_names_x,skip = 1,n_max = 140)
ehs_cac_25 <- ehs_cac %>% mutate(STRUCTURE="EHS_AC",AGE=as.numeric(AGE),
                              SEXE=ifelse(SEXE=="F","F","M"),
                              TYPE=ifelse(TYPE=="P","PR","URG")) %>%
  select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE) #%>% view()
rm(ehs_cac)

# 8-EHS OPHTALMOLOGIE ----

ehs_oph <- read_excel("data-raw/bloc/bloc_2025/8-eho/ehs_oph_bloc_2025.xlsx")
ehs_oph_25 <- ehs_oph  %>%
  mutate(DATE_INTERVENTION=dmy(DATE_INTERVENTION)) %>% #2025
  mutate(DATENAIS_PATIENT=dmy(DATENAIS_PATIENT)) %>%   #2025
  #dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(AGE=trunc((DATENAIS_PATIENT %--% DATE_INTERVENTION) / years(1))) %>%
  mutate(STRUCTURE ="EHS_OP",SEXE = SEXE_PATIENT,DIAGNOSTIC = ACTE) %>%
  mutate(TYPE = recode(TYPE,
                       "Ordinario"        = "PR",
                       "Ambulatorio"      = "PR",
                       "Urgencia"         = "URG")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE) #%>% view()
rm(ehs_oph)

# 9- EPH MESSAAD ----
eph_ma_1 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_1.csv")
eph_ma_2 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_2.csv")#
eph_ma_3 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_3.csv")#
eph_ma_4 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_4.csv")#
eph_ma_5 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_5.csv")#
eph_ma_6 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_6.csv")#
eph_ma_7 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_7.csv")#
eph_ma_8 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_8.csv")#
eph_ma_9 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_9.csv")#
eph_ma_10 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_10.csv")#
eph_ma_11 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_11.csv")#
eph_ma_12 <- read.csv2("data-raw/bloc/bloc_2025/9-eph_ma/eph_ma_bloc_12.csv")#
eph_ma_t <- dplyr::bind_rows(eph_ma_1,eph_ma_2,eph_ma_3,eph_ma_4,eph_ma_5,
                             eph_ma_6,eph_ma_7,eph_ma_8,eph_ma_9,eph_ma_10,
                             eph_ma_11,eph_ma_12)
rm(eph_ma_1,eph_ma_2,eph_ma_3,eph_ma_4,eph_ma_5,
   eph_ma_6,eph_ma_7,eph_ma_8,eph_ma_9,eph_ma_10,
   eph_ma_11,eph_ma_12)
eph_ma_25 <- eph_ma_t %>% mutate(STRUCTURE="EPH_MA",
                              DATE_INTERVENTION=ymd(DATE_INTERVENTION),
                              TYPE=ifelse(TYPE=="P","PR","URG")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(eph_ma_t)

# 10- EPH IDRISSIA ----
col_types_x <-  c("text","text","text","text","date","text","text","text","text")
col_names_x <-  c("NOM","PRENOM","AGE","SEXE","DATE_INTERVENTION","MEDECIN","SPEC","DIAGNOSTIC", "TYPE")
eph_id_1 <- read_xlsx("data-raw/bloc/bloc_2025/10-idrissia/eph_id_bloc_1.xlsx",
                         col_types = col_types_x,col_names = col_names_x,skip = 1,n_max = 2055)
eph_id_1 <-eph_id_1 %>% dplyr::filter(DATE_INTERVENTION >= "2025-01-01")

col_types_x <-  c("text","text","text","text","date","text","text","text","text")
col_names_x <-  c("NOM","PRENOM","AGE","SEXE","DATE_INTERVENTION","MEDECIN","SPEC","DIAGNOSTIC", "TYPE")
eph_id_2 <- read_xlsx("data-raw/bloc/bloc_2025/10-idrissia/eph_id_bloc_2.xlsx",
                         col_types = col_types_x,col_names = col_names_x,skip = 1,n_max = 250)
eph_id_2 <-eph_id_2 %>%
      mutate(AGE = str_sub(AGE, start = 1, end = 2))
eph_id <- dplyr::bind_rows(eph_id_1,eph_id_2)
rm(eph_id_1,eph_id_2)
eph_id_25 <- eph_id %>% mutate(STRUCTURE="EPH_id") %>%
  mutate(STRUCTURE="EPH_ID",AGE=as.numeric(AGE),
         TYPE=ifelse(TYPE=="U","URG","PR")) %>%
  select(STRUCTURE,DATE_INTERVENTION,AGE,SEXE,DIAGNOSTIC,MEDECIN,TYPE) #%>% view()
rm(eph_id)

# wilaya de djelfa 2025 ----
eph_2025 <- dplyr::bind_rows(ehs_oph_25,eph_ao_25,eph_mixte_25,eph_hb_25,ehs_me_25,ehs_cac_25,eph_id_25,eph_ma_25)
rm (ehs_oph_25,eph_ao_25,eph_mixte_25,eph_hb_25,ehs_me_25,ehs_cac_25,eph_id_25,eph_ma_25)


# 2024  ----
date1 <- "2024-01-01"; date2 <- "2024-12-31"
#  1-eph_birine
col_names <- c("NOM_PRENOM","AGE","SEXE","DATE_INTERVENTION","MEDECIN","DIAGNOSTIC","TYPE")
col_types <- c("text","numeric","text","date","text","text","text")
df_bi1 <- read_excel("data-raw/bloc/bloc_2024/eph_birine_bloc_c2.xlsx",
         col_names = col_names,col_types = col_types,skip = 1)
eph_bi_24 <- df_bi1 %>%
  dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_BI",TYPE=ifelse(TYPE=="Urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(df_bi1)

# 2- eph ao
df_ao1 <- read_xlsx("data-raw/bloc/bloc_2024/eph_ao_bloc.xlsx",
                    col_types = c("date",     # DATE_INTERVENTION  8  existe de // dans la date
                                  "text",     # NOM ET PRENOM      02
                                  "text",     # DIAGNOSTIC
                                  "text",     # MEDECIN                                1
                                  "numeric",  # AGE                9   91  suite 2024 98
                                  "text",     # SEXE               2    2              6
                                  "text" )) %>%   # TYPE                                   1
  mutate(DATE_INTERVENTION=as.Date(DATE_INTERVENTION))
df_ao1 <- df_ao1 %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_AO",TYPE=ifelse(TYPE=="urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)

df_ao2 <- read_xlsx("data-raw/bloc/bloc_2024/eph_ao_bloc_s.xlsx",
                    col_types = c("date",     # DATE_INTERVENTION  8  existe de // dans la date
                                  "text",     # NOM ET PRENOM      02
                                  "text",     # DIAGNOSTIC
                                  "text",     # MEDECIN                                1
                                  "numeric",  # AGE                9   91  suite 2024 98
                                  "text",     # SEXE               2    2              6
                                  "text" )) %>%  # TYPE                                   1
  mutate(DATE_INTERVENTION=as.Date(DATE_INTERVENTION))
df_ao2 <- df_ao2 %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_AO",TYPE=ifelse(TYPE=="Urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)

eph_ao_24 <- rbind(df_ao1,df_ao2)
rm(df_ao1,df_ao2)

# 3- eph hbb
df_hbb <- read_xlsx("data-raw/bloc/bloc_2024/eph_hbb_bloc.xlsx",
                    col_types = c("numeric",  # N
                                  "text",     # NOM
                                  "text",     # PRENOM
                                  "numeric",  # AGE
                                  "text",     # AGE1
                                  "text",     # SEXE
                                  "date",     # DATE_INTERVENTION  6
                                  "text",     # MEDECIN   xxx 260 jumellage sans medecin
                                  "text",     # MEDECIN1
                                  "text",     # specialite
                                  "text",     # DIAGNOSTIC
                                  "text"      # TYPE
                    ))
eph_hbb_24 <- df_hbb %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE ="EPH_HB",TYPE=ifelse(TYPE=="URGENCE","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(df_hbb)

# eph djelfa
df_dj1 <- read_xlsx("data-raw/bloc/bloc_2024/eph_djelfa_bloc1.xlsx",
                    col_types = c("numeric",  # N
                                  "text",     # NOM
                                  "text",     # PRENOM
                                  "numeric",  # AGE
                                  "text",     # AGE 1
                                  "text",     # SEXE
                                  "date" ,    # DATE_INTERVENTION
                                  "text",     # MEDECIN
                                  "text",     # MEDECIN1
                                  "text",     # Spécialité
                                  "text",     # DIAGNOSTIC
                                  "text"  ))    # TYPE

df_dj1 <- df_dj1 %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_DJ",TYPE=ifelse(TYPE=="urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
df_dj2 <- read_xlsx("data-raw/bloc/bloc_2024/eph_djelfa_bloc2.xlsx",
                    col_types = c("numeric",  # N
                                  "text",     # NOM
                                  "text",     # PRENOM
                                  "numeric",  # AGE
                                  "text",     # AGE 1
                                  "text",     # SEXE
                                  "date" ,    # DATE_INTERVENTION
                                  "text",     # MEDECIN
                                  "text",     # MEDECIN1
                                  "text",     # Spécialité
                                  "text",     # DIAGNOSTIC
                                  "text" ))       # TYPE
df_dj2 <- df_dj2 %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_DJ",TYPE=ifelse(TYPE=="URGENCE","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)

eph_dj_24 <- rbind(df_dj1,df_dj2)
rm(df_dj1,df_dj2)

# eph mixte

# ehs me

# eh oph
df_ehs_oph_2024 <- read_excel("data-raw/bloc/bloc_2024/ehs_oph_bloc_2024.xlsx" )
ehs_oph_24 <- df_ehs_oph_2024  %>%
  dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(AGE=trunc((DATENAIS_PATIENT %--% DATE_INTERVENTION) / years(1))) %>%
  mutate(STRUCTURE ="EHS_OP",SEXE = SEXE_PATIENT,DIAGNOSTIC = ACTE) %>%
  mutate(TYPE = recode(TYPE,
                       "Hospitalisation"  = "Programme",
                       "Ambulatoire"      = "Programme"),
         TYPE=ifelse(TYPE=="Urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(df_ehs_oph_2024)

# ehs cac  00 malades


# eph massaad
df_ma1 <- read_xlsx("data-raw/bloc/bloc_2024/eph_ma_bloc.xlsx",
                    col_types = c("date",     # DATE_INTERVENTION
                                  "text",     # NOM PRENOM
                                  "text",     # SEXE
                                  "numeric",  # AGE  50
                                  "text",     # DIAGNOSTIC 12
                                  "text",     # TYPE
                                  "text",     # MEDECIN
                                  "text" ))     # MEDECIN1
df_ma2 <- read_xlsx("data-raw/bloc/bloc_2024/eph_ma_bloc_suite.xlsx",
                    col_types = c("date",     # DATE_INTERVENTION
                                  "text",     # NOM PRENOM
                                  "text",     # SEXE
                                  "numeric",  # AGE  94
                                  "text",     # DIAGNOSTIC 12
                                  "text",     # TYPE
                                  "text",     # MEDECIN
                                  "text"  ))  # MEDECIN1
df_ma12 <- rbind(df_ma1,df_ma2)
rm(df_ma1,df_ma2)
eph_ma_24 <- df_ma12 %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_MA",TYPE=ifelse(TYPE=="Urgence","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(df_ma12)

# eph idrissia

df_id <- read_xlsx("data-raw/bloc/bloc_2024/eph_idrissia_bloc.xlsx",
                   col_types = c("numeric",  # N
                                 "text",     # NOM
                                 "text",     # PRENOM
                                 "numeric",  # AGE
                                 "text",     # AGE1  73
                                 "text",     # SEXE  03
                                 "date",     # DATE_INTERVENTION  3
                                 "text",     # MEDECIN 24
                                 #"text",     # MEDECIN1
                                 "text",     # specialite
                                 "text",     # DIAGNOSTIC 27
                                 "text"      # TYPE       366
                   ))
eph_id_24 <- df_id %>% dplyr::filter(DATE_INTERVENTION >= date1 & DATE_INTERVENTION  <= date2) %>%
  mutate(STRUCTURE="EPH_ID",TYPE=ifelse(TYPE=="URGENCE","URG","PR")) %>%
  select(STRUCTURE,AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE)
rm(df_id)

eph_2024 <- rbind(eph_bi_24,eph_ao_24,eph_hbb_24,ehs_oph_24,eph_dj_24,eph_id_24,eph_ma_24)
rm(eph_bi_24,eph_ao_24,eph_hbb_24,ehs_oph_24,eph_dj_24,eph_id_24,eph_ma_24)


bloc <- rbind(eph_2024,eph_2025)
rm(eph_2024,eph_2025)


# table(eph$STRUCTURE,eph$SEXE)
# table(eph$STRUCTURE,eph$TYPE)

## save datasets ----
usethis::use_data(bloc, overwrite = TRUE)

## remove data ----
rm(bloc,date1,date2)

## mise a jour documentation ----
devtools::document()
# devtools::build_readme()
# remove.packages("datasets.dsp")

# datasets.dsp::bloc %>% view()
# table(datasets.dsp::bloc$STRUCTURE,datasets.dsp::bloc$SEXE)

# type :wq! dans console apres git  dans vim




























