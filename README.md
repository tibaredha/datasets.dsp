
<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```

<!-- README.md is generated from README.Rmd. Please edit that file -->

# datasets.dsp <a href="https://tibaredha.com"><img src="man/figures/logo.png" align="right" height="138" alt="datasets.dsp website" /></a>

<!-- badges: start -->

<a href="https://lifecycle.r-lib.org/articles/stages.html#experimental">
<img alt="datasets.dsp website" src=".//man//figures//lifecycle-experimental.svg" ></img></a>
<!-- badges: end --> The goal of datasets.dsp is to …

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
#> Warning: package 'tidyverse' was built under R version 4.3.3
#> Warning: package 'tibble' was built under R version 4.3.3
#> Warning: package 'tidyr' was built under R version 4.3.3
#> Warning: package 'readr' was built under R version 4.3.3
#> Warning: package 'purrr' was built under R version 4.3.3
#> Warning: package 'dplyr' was built under R version 4.3.3
#> Warning: package 'stringr' was built under R version 4.3.3
#> Warning: package 'forcats' was built under R version 4.3.3
#> Warning: package 'lubridate' was built under R version 4.3.3
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.4     ✔ readr     2.1.5
#> ✔ forcats   1.0.0     ✔ stringr   1.5.1
#> ✔ ggplot2   4.0.1     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
#> ✔ purrr     1.0.4     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

### bloc ophtalmologie

``` r
bloc %>% dplyr::select(AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE) %>% head()
#> # A tibble: 6 × 6
#>     AGE SEXE  DATE_INTERVENTION   MEDECIN                 DIAGNOSTIC TYPE     
#>   <dbl> <chr> <dttm>              <chr>                   <chr>      <chr>    
#> 1    76 M     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
#> 2    42 M     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
#> 3    74 M     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
#> 4    38 F     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
#> 5    57 M     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
#> 6    70 M     2024-01-02 00:00:00 Yaimeris Martinez pavon Pterygium. Programme
```

### rh

``` r
rh %>% dplyr::select(structure,nom,prenom,sexe,datenaissance,age,grade,nv_grade,specialité) %>% head()
#> # A tibble: 6 × 9
#>   structure  nom      prenom sexe  datenaissance   age grade nv_grade specialité
#>   <fct>      <chr>    <chr>  <fct> <date>        <dbl> <fct> <fct>    <fct>     
#> 1 DSP Djelfa AROUR    BELKA… M     1963-04-27       62 Admi… AD       <NA>      
#> 2 DSP Djelfa DJAKBOUB BACHIR M     1972-04-09       53 Admi… AD       <NA>      
#> 3 DSP Djelfa AMOUR    SAIDA  F     1983-09-01       42 Admi… AD       <NA>      
#> 4 DSP Djelfa BEN KHA… NAIMA  F     1979-04-21       46 Admi… AD       <NA>      
#> 5 DSP Djelfa AMDJKOU… SOUAD  F     1976-03-16       49 Atta… Other    <NA>      
#> 6 DSP Djelfa KAMESSE  FATIHA F     1983-07-02       42 Secr… Other    <NA>
```

### deceshosp

``` r
deceshosp %>%  select(DINS, DATENAISSANCE, SEX) %>% head()
#>         DINS DATENAISSANCE SEX
#> 1 2020-01-27    1948-08-12   M
#> 2 2019-08-10    1963-06-08   M
#> 3 2020-01-24          <NA>   M
#> 4 2020-01-24    1943-01-23   M
#> 5 2020-01-24    2020-01-19   F
#> 6 2019-11-28          <NA>   F
```
