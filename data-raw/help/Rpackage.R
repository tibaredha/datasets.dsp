#configure
usethis::create_package("datasets.dsp")
update the description file
usethis::use_mit_license()

devtools::document()
devtools::check()
#################################################################################
#git
usethis::use_git()
usethis::use_github("tibaredha","ssh")  a revoire  ?????
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
