#' Ontological Factors in R
#'
#' The function `ontology` is uset to incode a vector as an ontology, 
#' or a tree-like ordered factor. An `ontology` object *is* a factor,
#' in that it inherits the `factor` and `ordered` classes, and can therefor
#' be manipulated as such. The `ontology` class adds an attribute, "ont_levels",
#' that is a directed graph of class `igraph`.
#'
#' @param x a vector of data.
#' @param ont_levels an optional directed [igraph] object defining the ontology.
#' @param ... other parameters passed on to [factor].
#'
#' @return
#' @export
#'
#' @examples
ontology <- function (x = factor(ordered = TRUE),
                      ont_levels,
                      ...)
{
  if (is.null(x))
    x <- factor(ordered = TRUE)
  
  if (!is.ordered(x))
    x <- factor(x, ordered = TRUE, ...)
  
  if (missing(ont_levels)) {
    edgelist <- cbind(levels(x),c(levels(x)[2:length(levels(x))],NA))
    ont_levels <- igraph::graph_from_data_frame(d = na.omit(edgelist),
                                                vertices = levels(x),
                                                directed = TRUE)
  }
  
  ont_levels(x) <- ont_levels
  
  class(x) <- c("ontology",
                "ordered",
                "factor")
  x
}

is_ontology <- function (x)
  inherits(x, "ontology")

is.ontology <- function (x)
  is_ontology(x)

as_ontology <- function (x)
{
  if (is.ontology(x))
    x
  else if (!is.object(x) && is.integer(x)) {
    ontology(as.factor(x))
  }
  else ontology(x)
}

as.ontology <- function (x)
  as_ontology(x)

ont_levels <- function (x)
  attr(x, "ont_levels")

`ont_levels<-` <- function (x, value)
{
  attr(x, "ont_levels") <- value
  x
}



