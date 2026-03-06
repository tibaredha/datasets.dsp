## code to prepare `covid19` dataset goes here
if(!require(pacman))install.packages("pacman");library("pacman")
p_load(tidyverse,lubridate,ggthemes,gtsummary,labelled,questionr,readxl)


# covid19 <- read_excel("data-raw/mdo/covid19.xlsx",col_names = FALSE, skip = 1)
# colnames(covid19) <- c("id","age","sexe","communeR","dateA","situation","dateS")
# covid19 <- covid19 %>% mutate(dateA=dmy(dateA),dateS=dmy(dateS)) #%>% view()
# write.csv(covid19,"data-raw/mdo/covid19.csv")
# rm(covid19)

#  fichier corrigé
covid19 <- read.csv("data-raw/mdo/covid19.csv")
covid19 <-covid19 %>% select(-x,-id) %>% select(age,sexe,communeR,dateA,dateS,situation) %>% view()
  # group_by(situation,sexe) %>%
  # summarise(n=n()) %>% view()

table(covid19$situation,covid19$sexe)

usethis::use_data(covid19, overwrite = TRUE)


