# install.packages ----
# install.packages(c("usethis", "roxygen2", "devtools"))
# devtools::install_github("hoxo-m/githubinstall") # name/pkgname
# install.packages("devtools")

# import library --------
library(usethis)
library(devtools)
library(roxygen2)
library(bannerCommenter)

##    tree.com //f //a   in git explore
# precomit as add
# precomit add  echo

# library(bannerCommenter)
# txt <- "This is the text of a comment"
# banner(txt)
# boxup(txt, snug = TRUE, bandChar = "=")
# section("")
# banner("Section 1:", "Data input","hhhh", emph = TRUE)

# import ( graphics )            #Pour le package integralement
# importFrom ( graphics , plot ) #Pour une unique fonction en lui pr?ecisant le nom du package puis celui de la fonction

# * create a cfg ----
# usethis::use_package("ggplot2", type = "imports")   packages that your package requires to work
# usethis::use_package("ggplot2", type = "suggests")  packages that developers of your package need
# usethis::use_package("dplyr")
# usethis::use_package("dplyr", min_version = "1.0.0")
# usethis::use_package("dplyr", min_version = TRUE)

# usethis::use_readme_md()
# usethis::use_news_md()
# usethis::use_roxygen_md()
# usethis::use_pipe()
# usethis::use_mit_license()

# 0 create a data ++++ ----
# usethis::use_data_raw("***")                                     create  a folder  data-raw  then edit script file to prepare data
# usethis::use_data(data name, overwrite= TRUE)                    create  a folder  data and data name.rda file
# usethis::use_data(compress = "bzip2")                            bzip2,gzip,xz
# usethis::use_data(internal_this, internal_that, internal = TRUE) create  R/sysdata.rda
# usethis::use_build_ignore("extdata/")                            to ignore ext data in build proces
# Raw data file inst/extdata/                                      use file <- yahiatiba::read_ext_data("yahiatiba","djelfa.shp")  # to get file path
# CRAN  in R pakages is limitede to 5 megabyte ????
# install.packages("data.table")                                   which provides efficient tools for working with large datasets.
# tools::resave   tools::checkRdafiles(). ????
# document your data
#' World Health Organization TB data
#'
#' A subset of data from the World Health Organization Global Tuberculosis
#' Report ...
#'
#' @format ## `who`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{iso2, iso3}{2 & 3 letter ISO country codes}
#'   \item{year}{Year}
#'   ...
#' }
#' @source <https://www.who.int/teams/global-tuberculosis-programme/data>
# "who"
# check if LazyData: true in your DESCRIPTION

# 1 create a function ----
# use_r("function name")
# edit function
# vignette("rd") =  Block are broken up by tag  = @tagName tagValue
# Code/insert roxygen2 skeleton
# devtools::document() or roxygen2::roxygenise()
# create man/function name.rd in latex form R uses to generate the documentation you see when you type ?str_length.
# help(function name) or ?function name to display the help of my function
# usethis::use_package_doc() create R/{pkgname}-package.R

# 2 test the function ----
# usethis::use_testthat()  # create a folder test
# usethis::use_test()      # you must open a file  with a function to test befor
# devtools::test()         # test functions


# 3 document ----

# 3.0 package
# usethis::use_package_doc()    create a fille R/{pkgname}-package.R it work but ?????
# usethis::use_package_doc()    create a fille R/{pkgname}-package.R it work but problem # apres instalation le probleme disparait ??????

# 3.1 fonctions
# Documenting data  use_r("data") the template is below
# Documenting function  roxygen2
# devtools::document()
# citation("yahiatiba") usethis::use_citation() ???
# usethis::use_version()               to incremente version in description file
# usethis::use_lifecycle()             generate svg file and look at the read me file
# lifecycle::badge("experimental") ?? `r lifecycle::badge("experimental")`
# lifecycle::badge("stable")       ?? `r lifecycle::badge("stable")`  quand je document fc()
# lifecycle::badge('superseded')   ?? `r lifecycle::badge("superseded")`
# lifecycle::badge('deprecated')   ?? `r lifecycle::badge("deprecated")` Dépassé, périmé

# 3.2 vignette : A vignette is a long-form guide to your package
# 1-usethis::use_vignette("my-vignette")    create vignette folder  create my-vignette.Rmd file  and clic butun knit to get  html vignette
# 2-devtools::build_vignettes()             create doc/meta folder  or  with devtools::build_vignettes("package name") possible if we close the package !!!!!!
# 3-first load all or libray(packagename)   and execute  browseVignettes("yahiatiba")  to display the vignette
# 4-browseVignettes()
# 5-remotes::install_github("multiple", build_vignettes = TRUE)

# 3.3 pkgdown :  create a web_site  for mypakages : https://pkgdown.r-lib.org/
# Remove docs/ from gitignore to ensure it is checked into git.
# 1- usethis::use_pkgdown()              #  creat a config file
# 2- pkgdown::build_site()               #  create docs folder and all the site
# 3- usethis::use_vignette("yahiatiba")  #  create a article in articles menu
# 4- pkgdown::build_site()               #  build site
# 5- usethis::use_pkgdown_github_pages() #  Run this once to publish your site regularly
#
# error  add folder : man/figures/*.svg to docs/
# Le site est placé dans le dossier docs. Ouvrir le fichier index.htm avec
# un navigateur web pour le visualiser. Dès que le projet sera poussé sur GitHub,
# activer les pages du dépôt pour que le site soit visible en ligne (voir section 3.7).
# pkgdown place le site dans le dossier docs.

# Ajouter l’adresse des pages GitHub dans une nouvelle ligne du fichier
# DESCRIPTION :
# URL: https://GitHubID.github.io/multiple   #  https://tibaredha.github.io/yahiatiba/index.html

# L’ajouter aussi dans le fichier _pkgdown.yml qui a été créé vide, ainsi que
# l’option suivante :
# url: https://GitHubID.github.io/multiple
# development:
# mode: auto


# Rmarkdown custum template usethis::use_rmarkdown_template("note-mensuelle") create a template *.rmd +++
# https://bookdown.org/yihui/rmarkdown/template-support.html
# Pour créer un modèle de document R Markdown dans votre package
# Il ne vous reste plus qu’à éditer le fichier
# inst/rmarkdown/templates/note-mensuelle/skeleton/skeleton.Rmd
# aucour de la creation dun rmarkdown avec tempplate like Rticles

# use_r() usethis::use_test() devtools::test() devtools::document() devtools::load_all(".")

# use_rmarkdown_template(template_name = "Worksheet1")
# ✔ Setting active project to '/Users/desiree/Documents/New R Projects/testpackage'
# ✔ Creating 'inst/rmarkdown/templates/worksheet1/skeleton/'
# ✔ Writing 'inst/rmarkdown/templates/worksheet1/template.yaml'
# ✔ Writing 'inst/rmarkdown/templates/worksheet1/skeleton/skeleton.Rmd'
#

# git hub action ----
# use_github_action()
# use one of 3 choices to create yaml file in .github/workflows
# https://github.com/r-lib/actions/tree/v2/examples
# check-release     - A simple CI workflow to check with the release version of R.
# check-standard    - A standard CI workflow to check with the release version of R on the three major OSs.
# check-full        - A more complex CI workflow
# test-coverage     - Run covr::codecov() on an R package.
# lint              - Run lintr::lint_package() on an R package.
# pr-commands       - Adds /document and /style commands for pull requests.
# pkgdown           - Build a pkgdown site for an R package and deploy it to GitHub Pages or Cloudflare Pages.
# document          - Run roxygen2::roxygenise() on an R package.
# style             - Run styler::style_pkg() on an R package.
# usethis::use_github_action("check-release")

# use_github_links ----
# usethis::use_github_links()
# URL: https://github.com/tibaredha/yahiatiba
# BugReports: https://github.com/tibaredha/yahiatiba/issues
