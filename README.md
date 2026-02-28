
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datasets.dsp <a href="https://tibaredha.com"><img src="man/figures/logo.png" align="right" height="138" alt="datasets.dsp website" /></a>

<!-- badges: start -->

<a href="https://lifecycle.r-lib.org/articles/stages.html#experimental">
<img src=".//man//figures//lifecycle-experimental.svg" ></img></a>
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
```

### bloc ophtalmologie

``` r
df_oph %>% select(AGE,SEXE,DATE_INTERVENTION,MEDECIN,DIAGNOSTIC,TYPE) %>% head()
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
rh %>% dplyr::select(wilaya,structure,sexe,datenaissance,grade,specialité) %>% head()
#> # A tibble: 6 × 6
#>   wilaya structure  sexe  datenaissance grade                         specialité
#>   <fct>  <fct>      <fct> <date>        <fct>                         <fct>     
#> 1 Djelfa DSP Djelfa homme 1963-04-27    Administrateur Conseiller     <NA>      
#> 2 Djelfa DSP Djelfa homme 1972-04-09    Administrateur                <NA>      
#> 3 Djelfa DSP Djelfa femme 1983-09-01    Administrateur                <NA>      
#> 4 Djelfa DSP Djelfa femme 1979-04-21    Administrateur                <NA>      
#> 5 Djelfa DSP Djelfa femme 1976-03-16    Attaché principal d'administ… <NA>      
#> 6 Djelfa DSP Djelfa femme 1983-07-02    Secrétaire                    <NA>
```
