## code to prepare `deceshosp` dataset goes here

if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid,RMySQL,labelled)

con <- function(tbl){
  library("RMySQL")
  mysql <-  dbConnect(MySQL(),user="tibaredha",password="030570",dbname="framework",host="localhost")
  #options(max.print=1000000)
  query <- paste0("SELECT * FROM ", tbl)
  dbSendQuery(mysql,'set character set "utf8"') #  tres important
  resultat <-  dbSendQuery(mysql,query)
  df <- fetch(resultat,n=-1)                    #  df <- fetch(resultat,n=Inf)
  dbDisconnect(mysql)
  return(df)
}


deces_maj_mysql <- function() {

  wil <- con("wil")
  wil <- wil %>%
    select(IDWIL,WILAYAS) %>%
    rename(WILAYAR=IDWIL)

  com <- con("com")
  com <- com %>%
    select(IDCOM,COMMUNE) %>%
    rename(COMMUNER=IDCOM)

  chp <- con("chapitre")
  chp <- chp %>%
    select(IDCHAP,CHAP) %>%
    rename(CODECIM0=IDCHAP)
  #save(chp,file="data/djelfa/mortalite/chp.RData")

  cim <- con("cim")
  cim <- cim %>%
    select(row_id,diag_cod,diag_nom) %>%
    rename(CODECIM=row_id)
  #save(cim,file="data/djelfa/mortalite/cim.RData")

  prf <- con("profession")
  prf <- prf %>%
    select(id,Profession) %>%
    rename(n_profession=Profession,Profession=id)
  #save(prf,file="data/djelfa/mortalite/prf.RData")

  str <- con("structure")
  str <- str %>%
    select(id,structure) %>%
    rename(STRUCTURED=id)
  #save(str,file="data/djelfa/mortalite/str.RData")

  srv <- con("servicedeces")
  srv <- srv %>%
    select(id,service) %>%
    rename(SERVICEHOSPIT=id)
  #save(srv,file="data/djelfa/mortalite/srv.RData")

  deceshosp <- con("deceshosp")
  deceshosp <- deceshosp %>%
    select(DINS,DATENAISSANCE,WILAYAR,COMMUNER,LD,STRUCTURED,SERVICEHOSPIT,DUREEHOSPIT,SEX,Years,Days,Profession,CD,CODECIM0,CODECIM,MEDECINHOSPIT) %>%
    left_join(str,by="STRUCTURED") %>%
    left_join(srv,by="SERVICEHOSPIT") %>%
    left_join(prf,by="Profession") %>%
    left_join(chp,by="CODECIM0") %>%
    left_join(cim,by="CODECIM") %>%
    left_join(com,by="COMMUNER") %>%
    left_join(wil,by="WILAYAR") %>%
    mutate(DINS = as.Date(DINS),
           DATENAISSANCE=as.Date(DATENAISSANCE),
           LD = as.factor(LD),
           structure = as.factor(structure),
           service = as.factor(service),
           n_profession = as.factor(n_profession),
           SEX = as.factor(SEX),
           Profession = as.factor(Profession),
           CHAP = as.factor(CHAP),
           diag_cod = as.factor(diag_cod),
           CD = as.factor(CD),
           COMMUNE=as.factor(COMMUNE),
           WILAYAS=as.factor(WILAYAS)
    ) %>%
    set_variable_labels(DINS="Date du décès",
                        DATENAISSANCE="date de naissance",
                        WILAYAS="Wilaya de résidence",
                        COMMUNER="Commune de résidence",
                        LD="Lieux du décès",
                        structure="Structure sanitaire",
                        service="Service d'hospitalisation",
                        DUREEHOSPIT="Durée d'hospitalisation",
                        SEX="Sexe",
                        Years="Age (Année)",
                        Days="Age (Jours)",
                        n_profession="Profession",
                        CD="Cause du décès",
                        CHAP="Capitre CIM10",
                        diag_cod="Titre CIM10",
                        diag_nom="Titre CIM10",
                        COMMUNE="COMMUNE RES"
    ) %>%
    select(DINS,DATENAISSANCE,SEX,Years,Days,WILAYAR,WILAYAS,COMMUNER,COMMUNE,LD,structure,service,DUREEHOSPIT,n_profession,CD,CHAP,diag_cod,diag_nom,MEDECINHOSPIT) #%>%
  #dplyr::filter(DINS >= dt1 & DINS <= dt2 & Years >=0 & Years <=100)
  #save(deceshosp,file="data/djelfa/mortalite/deceshosp.RData")
  usethis::use_data(deceshosp, overwrite = TRUE)
  rm(chp,cim,prf,str,srv,deceshosp)

}


deces_maj_mysql()

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
