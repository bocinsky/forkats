
<!-- README.md is generated from README.Rmd. Please edit that file -->

# treecats

[![Travis-CI Build
Status](https://travis-ci.org/bocinsky/treecats.svg?branch=master)](https://travis-ci.org/bocinsky/treecats)
[![Coverage
Status](https://img.shields.io/codecov/c/github/bocinsky/treecats/master.svg)](https://codecov.io/github/bocinsky/treecats?branch=master)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/treecats)](https://cran.r-project.org/package=treecats)

The `treecats` package defines a new subclass of an ordered
factor—“trees”— that are simple tree-like ontologies where values
lower on the tree inherit values above. `treecats` allows for the
creation of tree factors, and provides functions for their basic
manipulation including querying up and down the tree, collapsing to a
level, and dropping unused levels.

## Installation

You can install treecats from github with:

``` r
# install.packages("devtools")
devtools::install_github("bocinsky/treecats")
```

<!-- ## Example -->

<!-- This is a basic example which shows you how to solve a common problem: -->

<!-- ```{r example} -->

<!-- library(magritty) -->

<!-- x <- c("John","Kyle","Molly") %>% -->

<!--   ontology() %>% -->

<!-- ``` -->

## Contributor Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
