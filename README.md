
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
