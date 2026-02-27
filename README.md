
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
library(tidyverse)
df_oph_2025 %>% select(AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE) %>% head()
#> # A tibble: 6 × 6
#>     AGE SEXE  DATE_INTERVENTION MEDECIN                         DIAGNOSTIC TYPE 
#>   <dbl> <chr> <date>            <chr>                           <chr>      <chr>
#> 1    66 M     2025-01-01        Jorge Amet Ramis Big&ntilde;ott Extraccio… Urge…
#> 2    83 F     2025-01-01        Jorge Amet Ramis Big&ntilde;ott Extraccio… Urge…
#> 3    73 M     2025-01-01        Jorge Amet Ramis Big&ntilde;ott Extraccio… Urge…
#> 4    75 M     2025-01-01        Jorge Amet Ramis Big&ntilde;ott Extraccio… Urge…
#> 5    39 F     2025-01-02        ANISLEY Lashley Parris          Iridotomi… Prog…
#> 6    52 M     2025-01-02        HECTOR Santiago Montes Fong     Extraccio… Urge…
```
