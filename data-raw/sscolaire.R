## code to prepare `sscolaire` dataset goes here
## code to prepare `budget` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,readxl,lubridate,ggthemes,sf,mapsf,foreign,stringr,knitr,kableExtra,apyramid)

name_ss <- function(uds_x,range_x,sheet_x) {
  ss_hbb <- read_excel(uds_x, col_names = FALSE,skip = 7,range = range_x,sheet = sheet_x )
  colnames(ss_hbb) <- c("etatblissements","TYPE","PS","1F","2F","3F","4F","5F","1M","2M","3M","4M","1S","2S","3S","TOT")
  ss_hbb <-  ss_hbb %>% mutate(etatblissements=str_trunc(etatblissements,15)) %>% replace(., is.na(.), 0)
  return(ss_hbb)
}
# epsp ain oussera
Omar_Idris <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O28","Omar Idris") %>% mutate(UDS="Omar Idris")
Bouamama   <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O29","Bouamama") %>% mutate(UDS="Bouamama")
Technicum  <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O33","Technicum") %>% mutate(UDS="Technicum")
Guernini   <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O7","Guernini") %>% mutate(UDS="Guernini")
Birine     <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O32","Birine") %>% mutate(UDS="Birine")
Benhar     <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O18","Benhar") %>% mutate(UDS="Benhar")
Had_sahari <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O39","Had sahari") %>% mutate(UDS="Had sahari")
Ain_fekka  <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O28","Ain fekka") %>% mutate(UDS="Ain fekka")
Bouiret_lahdeb<- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O13","Bouiret lahdeb") %>% mutate(UDS="Bouiret lahdeb")
Sidi_laadjel  <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O21","Sidi laadjel") %>% mutate(UDS="Sidi laadjel")
Hassi_fedoul  <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O29","Hassi fedoul") %>% mutate(UDS="Hassi fedoul")
Lekhmis       <- name_ss ("data-raw/sscolaire/ss_ao.xlsx","A4:O12","Lekhmis") %>% mutate(UDS="Lekhmis")
ss_ao <- rbind(Omar_Idris,Bouamama,Technicum,Guernini,Birine,Benhar,Had_sahari,Ain_fekka,
               Bouiret_lahdeb,Sidi_laadjel,Hassi_fedoul,Lekhmis)%>% mutate(EPSP="ao")
rm(Omar_Idris,Bouamama,Technicum,Guernini,Birine,Benhar,Had_sahari,Ain_fekka,
      Bouiret_lahdeb,Sidi_laadjel,Hassi_fedoul,Lekhmis)

# epsp hassi-bahbah
KACIMI     <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O32","KACIMI") %>% mutate(UDS="kacimi")
BELAHRECHE <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O34","BELAHRECHE") %>% mutate(UDS="belahreche")
BENKHAIRA  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O25","BENKHAIRA") %>% mutate(UDS="benkhaira")
BENBADISS  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O19","BEN BADISS") %>% mutate(UDS="ben badiss")
AINMAABED  <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O19","AIN MAABED") %>% mutate(UDS="ain maabed")
ZAAFRANE   <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O21","ZAAFRANE") %>% mutate(UDS="zaafrane")
FATEH      <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O38","FATEH") %>% mutate(UDS="fateh")
NOOR       <- name_ss ("data-raw/sscolaire/ss_hbb.xls","A8:O38","NOOR") %>% mutate(UDS="noor")
ss_hbb <- rbind(KACIMI,BELAHRECHE,BENKHAIRA,BENBADISS,AINMAABED,ZAAFRANE,FATEH,NOOR)%>% mutate(EPSP="hbb")
rm(KACIMI,BELAHRECHE,BENKHAIRA,BENBADISS,AINMAABED,ZAAFRANE,FATEH,NOOR)

# epsp djelfa
ADILA <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P14","adila") %>% mutate(UDS="adila")
p1_nov <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P22","1 nov") %>% mutate(UDS="p1_nov")
nadjah <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P25","nadjah") %>% mutate(UDS="nadjah")
al_amir <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P20","al amir") %>% mutate(UDS="al_amir")
saila_karia <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P10","sailaa karia") %>% mutate(UDS="saila_karia")
tahiri <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P19","tahiri") %>% mutate(UDS="tahiri")
mahata_rggab <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P17","mahata rggab") %>% mutate(UDS="mahata_rggab")
belahrch <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P16","belahrch") %>% mutate(UDS="belahrch")
bakai <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P27","bakai") %>% mutate(UDS="bakai")
belhwadjb <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P20","belhwadjb") %>% mutate(UDS="belhwadjb")
el_kotb <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P19","el kotb") %>% mutate(UDS="el_kotb")
idrissia <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P25","idrissia") %>% mutate(UDS="idrissia")
charef <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P27","charef") %>% mutate(UDS="charef")
guedid <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P17","guedid") %>% mutate(UDS="guedid")
ben_yaagoub <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P9","ben yaagoub") %>% mutate(UDS="ben_yaagoub")
douis <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P9","douis") %>% mutate(UDS="douis")
ain_chouhadda <- name_ss ("data-raw/sscolaire/ss_dj.xlsx","B3:P8","ain chouhadda") %>% mutate(UDS="ain_chouhadda")
ss_dj <- rbind(ADILA,p1_nov,nadjah,al_amir,saila_karia,tahiri,mahata_rggab,belahrch,
               bakai,belhwadjb,el_kotb,idrissia,charef,guedid,ben_yaagoub,douis,ain_chouhadda)%>%
         mutate(EPSP="dj")
rm(ADILA,p1_nov,nadjah,al_amir,saila_karia,tahiri,mahata_rggab,belahrch,
   bakai,belhwadjb,el_kotb,idrissia,charef,guedid,ben_yaagoub,douis,ain_chouhadda)

# epsp messaad
UDS1 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O63","UDS 1") %>% mutate(UDS="UDS 1")
UDS2 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O9","UDS 2") %>% mutate(UDS="UDS 2")
UDS3 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O15","UDS 3") %>% mutate(UDS="UDS 3")
UDS4 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O13","UDS 4") %>% mutate(UDS="UDS 4")
UDS5 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O10","UDS 5") %>% mutate(UDS="UDS 5")
UDS6 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O10","UDS 6") %>% mutate(UDS="UDS 6")
UDS7 <- name_ss ("data-raw/sscolaire/ss_ma.xlsx","A3:O15","UDS 7") %>% mutate(UDS="UDS 7")
ss_ma <- rbind(UDS1,UDS2,UDS3,UDS4,UDS5,UDS6,UDS7)%>%mutate(EPSP="ma")
rm(UDS1,UDS2,UDS3,UDS4,UDS5,UDS6,UDS7)


sscolaire <- rbind(ss_ao,ss_hbb,ss_dj,ss_ma)
rm(ss_ao,ss_hbb,ss_dj,ss_ma)
usethis::use_data(sscolaire, overwrite = TRUE)
rm(sscolaire)

## mise a jour documentation ----
devtools::document()
#devtools::build_readme()
#remove.packages("datasets.dsp")
#reinstall package
#datasets.dsp::budget %>% dplyr::filter(annee=="2025")

