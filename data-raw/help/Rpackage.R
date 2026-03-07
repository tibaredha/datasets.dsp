#configure
usethis::create_package("datasets.dsp")
update the description file
usethis::use_mit_license()

devtools::document()
devtools::check()
#################################################################################
#git
# in terminal execute which git to check work directory
usethis::edit_git_config()

# for the first time only we get the token  use https protocole ++++ not ssh
# usethis::create_github_token()  # open browser and create a token  then copy
# library(gitcreds)
# gitcreds::gitcreds_set()
# and copy paste  the  code given

 #### git push dont work with Rstudio terminal in mode ssh ++++++ but it work in mode https
usethis::use_git()      # create a repo git in locale 
usethis::use_github()   # create a repo git in remote  use https protocole  create a new project 
# add file and then create a commit and then git push in Rstudio terminal work properly  +++++++
# il peut ya voir un confli entre https and ssh +++++
##usethis::use_github("tibaredha","ssh")  #a revoire  ?????

# NB ++ a nother way to create a project from scratch 
# or create a project from github and then take url from github and then create a project from Rstudio verssion controle and paste the url
#################################################################################
#data
usethis::use_data_raw("bloc") #create  data-raw/bloc.R  #edite bloc.R
usethis::use_package("***",type = "depends")
usethis::use_r("data")        #create  R/data.R         #edite data.R
#' description de la base de donnée
#'
#' Look up airline names from their carrier codes.
#'
#' @source <https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236>
#' @format Data frame with columns
#' \describe{
#' \item{carrier}{Two letter abbreviation.}
#' \item{name}{Full name.}
#' }
#' @examples
#'   df_oph_2025
"df_oph_2025"
#################################################################################
# documentation of packages
usethis::use_package_doc()
#################################################################################
#NEWS
usethis::use_news_md()  #create the  NEWS.md

# Install the package if you haven't already
# install.packages("newsmd")
library(newsmd)
my_news <- newsmd() # Initializes a new news object
my_news$add_version("0.0.1")
my_news$add_subtitle("Bugfixes")
my_news$add_bullet(c("this is point 1", "this is point 2"))
my_news$get_text() or  print(my_news)
my_news$write()

# check
news(package = "datasets.dsp") ++++++
#readme
##readme_md
usethis::use_readme_md()
##readme_rmd
usethis::use_readme_rmd() # for the first time only  edit readme.rmd  and see the change in readme.md
devtools::document()
devtools::build_readme()  # edit readme.rmd  and see the change in readme.md
#################################################################################

wc_algeria <- read_sf("shp/gadm41_DZA_2.shp")
w_algeria  <- read_sf("shp/gadm41_DZA_1.shp",stringsAsFactors = TRUE)

devtools::load_all()
