#' Tree-like Factors
#'
#' The function `tct_tree` is used to encode a vector as a tree-like ordered factor. 
#' An `tct_tree` object *is* a factor,
#' in that it inherits the `factor` and `ordered` classes, and can therefor
#' be manipulated as such. The `tct_tree` class adds an attribute, `tct_levels`,
#' that is a directed graph of class `igraph`.
#' 
#' `tct_is_tree`, `is.tct_tree`, `tct_as_tree`, and `as.tct_tree`, 
#' are the membership and coercion functions for the `tct_tree` class.
#' 
#' `tct_levels` provides access to the `tct_levels` attribute of a `tct_tree`. 
#' The first form returns the value of the levels of its argument and the second sets the attribute.
#'
#' @param x a vector of data.
#' @param tct_levels an optional directed [igraph] object defining the ontology.
#' @param ... other parameters passed on to [factor].
#'
#' @importFrom stats na.omit
#'
#' @export
#'
#' @examples
#' c("Kyle", "John", "Molly") %>%
#'   tct_tree()
tct_tree <- function(x = factor(ordered = TRUE),
                     tct_levels,
                     ...) {
  if (is.null(x)) {
    x <- factor(ordered = TRUE)
  }

  if (!is.ordered(x)) {
    x <- factor(x, ordered = TRUE, ...)
  }

  if (missing(tct_levels)) {
    edgelist <- cbind(levels(x), c(levels(x)[2:length(levels(x))], NA))
    tct_levels <- igraph::graph_from_data_frame(
      d = na.omit(edgelist),
      vertices = levels(x),
      directed = TRUE
    )
  }

  tct_levels(x) <- tct_levels

  class(x) <- c(
    "tct_tree",
    "ordered",
    "factor"
  )
  x
}

#' @describeIn tct_tree Membership function for the `tct_tree` class.
#' @export
tct_is_tree <- function(x)
  inherits(x, "tct_tree")

#' @describeIn tct_tree Membership function for the `tct_tree` class.
#' @export
is.tct_tree <- function(x)
  tct_is_tree(x)

#' @describeIn tct_tree Coercion function for the `tct_tree` class.
#' @export
tct_as_tree <- function(x) {
  if (tct_is_tree(x)) {
    x
  } else if (!is.object(x) && is.integer(x)) {
    tct_tree(as.factor(x))
  }
  else {
    tct_tree(x)
  }
}

#' @describeIn tct_tree Coercion function for the `tct_tree` class.
#' @export
as.tct_tree <- function(x)
  tct_as_tree(x)

#' @describeIn tct_tree Return the value of the `tct_levels` attribute of a `tct_tree`.
#' @export
tct_levels <- function(x)
  attr(x, "tct_levels")

#' @describeIn tct_tree Set the value of the `tct_levels` attribute of a `tct_tree`.
#' @param value a vector of character strings with length at least the number of levels of x.
#' @export
`tct_levels<-` <- function(x, value) {
  attr(x, "tct_levels") <- value
  x
}
