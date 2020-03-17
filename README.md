  <!-- badges: start -->
  [![Travis build status](https://travis-ci.org/yannizhou05/stat302Packages.svg?branch=master)](https://travis-ci.org/yannizhou05/stat302Packages)
  [![codecov](https://codecov.io/gh/yannizhou05/stat302Packages/branch/master/graph/badge.svg?token=8e5460da-2984-4947-b096-ba4f04cec584)](https://codecov.io/gh/yannizhou05/stat302Packages)
  <!-- badges: end -->

## Installation

To download the stat302Packages package, use the code below.

``` r
# install.packages("devtools")
devtools::install_github("yannizhou05/stat302Packages")
library(stat302Packages)
```

## Use

The vignette demonstrates example usage of all main functions. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):

``` r
# install.packages("devtools")
devtools::install_github("yannizhou05/stat302Packages", build_vignette = TRUE, build_opts = c())
library(stat302Packages)
# Use this to view the vignette in the stat302Packages HTML help
help(package = "stat302Packages", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "stat302Packages")
```
