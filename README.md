
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datasets.dsp

<!-- badges: start -->
<!-- badges: end -->

The goal of datasets.dsp is to …

## Installation

You can install the development version of datasets.dsp from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("tibaredha/datasets.dsp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datasets.dsp)
head(df_oph_2025)
#>   N° code_archive nom_patient prenom_patient DATENAIS_PATIENT SEXE_PATIENT
#> 1  1        27374      DJAMEL      MERZOUGUI       24/05/1958            M
#> 2  2        27379     MARFOUA         BOUCIF       24/05/1941            F
#> 3  3        27385  ABDERAHMAN        CHOUIKH       24/05/1951            M
#> 4  4        27392    ABDALLAH       BOUTELBA       24/05/1949            M
#> 5  5       314208     BOUHALA           RIMA       04/06/1985            F
#> 6  6        27402      KHALIL       CHOUIREB       24/05/1972            M
#>   DATE_INTERVENTION oeil complication
#> 1        01/01/2025   OD      Moyenne
#> 2        01/01/2025   OI      Moyenne
#> 3        01/01/2025   OI      Moyenne
#> 4        01/01/2025   OI      Moyenne
#> 5        02/01/2025  A/O      Moyenne
#> 6        02/01/2025   OI      Moyenne
#>                                         ACTE  service    lieu        TYPE
#> 1 Extraccion de cuerpo extrano en la cornea. Cirugias Externo    Urgencia
#> 2 Extraccion de cuerpo extrano en la cornea. Cirugias Externo    Urgencia
#> 3 Extraccion de cuerpo extrano en la cornea. Cirugias Interno    Urgencia
#> 4 Extraccion de cuerpo extrano en la cornea. Cirugias Interno    Urgencia
#> 5                       Iridotomia yag laser    Laser Externo Ambulatorio
#> 6 Extraccion de cuerpo extrano en la cornea. Cirugias Externo    Urgencia
#>   type_anesthesie                         MEDECIN specialite
#> 1          Locale Jorge Amet Ramis Big&ntilde;ott    urgence
#> 2          Locale Jorge Amet Ramis Big&ntilde;ott    urgence
#> 3          Locale Jorge Amet Ramis Big&ntilde;ott    urgence
#> 4          Locale Jorge Amet Ramis Big&ntilde;ott    urgence
#> 5         Topique          ANISLEY Lashley Parris   glaucome
#> 6          Locale     HECTOR Santiago Montes Fong    urgence
```
