## code to prepare `budget` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)

budget_djelfa <- function(budget) {

  df_oph <- read.csv(paste0(budget,"/budget_ehs_oph.csv"),sep = ";")     %>% mutate(str="oph",type="EH")
  df_me <- read.csv(paste0(budget,"/budget_ehs_me.csv"),sep = ";")       %>% mutate(str="me",type="EHS")
  df_cac <- read.csv(paste0(budget,"/budget_ehs_cac.csv"),sep = ";")     %>% mutate(str="cac",type="EHS")
  df_eph_br <- read.csv(paste0(budget,"/budget_eph_br.csv"),sep = ";")   %>% mutate(str="br",type="EPH")
  df_eph_dj <- read.csv(paste0(budget,"/budget_eph_dj.csv"),sep = ";")   %>% mutate(str="dj",type="EPH")
  df_eph_ao <- read.csv(paste0(budget,"/budget_eph_ao.csv"),sep = ";")   %>% mutate(str="ao",type="EPH")
  df_eph_hb <- read.csv(paste0(budget,"/budget_eph_hb.csv"),sep = ";")   %>% mutate(str="hb",type="EPH")
  df_eph_ma <- read.csv(paste0(budget,"/budget_eph_ma.csv"),sep = ";")   %>% mutate(str="ma",type="EPH")
  df_eph_id <- read.csv(paste0(budget,"/budget_eph_id.csv"),sep = ";")   %>% mutate(str="id",type="EPH")

  df_epsp_ao <- read.csv(paste0(budget,"/budget_epsp_ao.csv"),sep = ";") %>% mutate(str="eao",type="EPSP")
  df_epsp_hb <- read.csv(paste0(budget,"/budget_epsp_hb.csv"),sep = ";") %>% mutate(str="ehb",type="EPSP")
  df_epsp_dj <- read.csv(paste0(budget,"/budget_epsp_dj.csv"),sep = ";") %>% mutate(str="edj",type="EPSP")
  df_epsp_ma <- read.csv(paste0(budget,"/budget_epsp_ma.csv"),sep = ";") %>% mutate(str="ema",type="EPSP")
  df_epsp_gt <- read.csv(paste0(budget,"/budget_epsp_gt.csv"),sep = ";") %>% mutate(str="egt",type="EPSP")

  dft <- bind_rows(df_oph,df_me,df_cac,
                   df_eph_br,df_eph_dj,df_eph_ao,df_eph_hb,df_eph_ma,df_eph_id,
                   df_epsp_ao,df_epsp_hb,df_epsp_dj,df_epsp_ma,df_epsp_gt)
}
budget_25 <- budget_djelfa("data-raw/budget/budget_25") %>% mutate(annee="2025")
budget_26 <- budget_djelfa("data-raw/budget/budget_26") %>% mutate(annee="2026")
budget <- bind_rows(budget_25,budget_26)
rm(budget_25,budget_26)

usethis::use_data(budget, overwrite = TRUE)
rm(budget)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
remove.packages("datasets.dsp")
#reinstall package
#datasets.dsp::budget %>% dplyr::filter(annee=="2025")



