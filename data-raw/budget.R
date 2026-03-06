## code to prepare `budget` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)



df_oph <- read.csv("data-raw/budget/budget_ehs_oph.csv",sep = ";")     %>% mutate(str="oph")
df_me <- read.csv("data-raw/budget/budget_ehs_me.csv",sep = ";")       %>% mutate(str="me")
df_cac <- read.csv("data-raw/budget/budget_ehs_cac.csv",sep = ";")     %>% mutate(str="cac")
df_eph_br <- read.csv("data-raw/budget/budget_eph_br.csv",sep = ";")   %>% mutate(str="br")
df_eph_dj <- read.csv("data-raw/budget/budget_eph_dj.csv",sep = ";")   %>% mutate(str="dj")
df_eph_ao <- read.csv("data-raw/budget/budget_eph_ao.csv",sep = ";")   %>% mutate(str="ao")
df_eph_hb <- read.csv("data-raw/budget/budget_eph_hb.csv",sep = ";")   %>% mutate(str="hb")
df_eph_ma <- read.csv("data-raw/budget/budget_eph_ma.csv",sep = ";")   %>% mutate(str="ma")
df_eph_id <- read.csv("data-raw/budget/budget_eph_id.csv",sep = ";")   %>% mutate(str="id")

df_epsp_ao <- read.csv("data-raw/budget/budget_epsp_ao.csv",sep = ";")   %>% mutate(str="eao")
df_epsp_hb <- read.csv("data-raw/budget/budget_epsp_hb.csv",sep = ";")   %>% mutate(str="ehb")
df_epsp_dj <- read.csv("data-raw/budget/budget_epsp_dj.csv",sep = ";")   %>% mutate(str="edj")
df_epsp_ma <- read.csv("data-raw/budget/budget_epsp_ma.csv",sep = ";")   %>% mutate(str="ema")
df_epsp_gt <- read.csv("data-raw/budget/budget_epsp_gt.csv",sep = ";")   %>% mutate(str="egt")

budget <- bind_rows(df_oph,df_me,df_cac,
                 df_eph_br,df_eph_dj,df_eph_ao,df_eph_hb,df_eph_ma,df_eph_id,
                 df_epsp_ao,df_epsp_hb,df_epsp_dj,df_epsp_ma,df_epsp_gt)
rm(df_oph,df_me,df_cac,
   df_eph_br,df_eph_dj,df_eph_ao,df_eph_hb,df_eph_ma,df_eph_id,
   df_epsp_ao,df_epsp_hb,df_epsp_dj,df_epsp_ma,df_epsp_gt)

usethis::use_data(budget, overwrite = TRUE)
rm(budget)

## mise a jour documentation ----
devtools::document()
devtools::build_readme()
remove.packages("datasets.dsp")
#install package
