
<!-- README.md is generated from README.Rmd. Please edit that file -->

# treecats <img src="logo.png" align="right" height="225"/>

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

“treecats” stands for “tree categories.” Yes, the package and its name
is inspired by Hadley Wickham’s
[`forcats`](http://forcats.tidyverse.org/).

## Installation

You can install treecats from github with:

``` r
# install.packages("devtools")
devtools::install_github("bocinsky/treecats")
```

## Example

``` r
library(treecats)
c("John","Kyle","Molly") %>%
  tct_tree()
#> [1] John  Kyle  Molly
#> attr(,"tct_levels")
#> IGRAPH 5a2cd84 DN-- 3 2 -- 
#> + attr: name (v/c)
#> + edges from 5a2cd84 (vertex names):
#> [1] John->Kyle  Kyle->Molly
#> Levels: John < Kyle < Molly
```

## Contributor Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
