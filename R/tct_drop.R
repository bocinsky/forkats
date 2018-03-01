#' Drop unused levels
#'
#' Compared to base::droplevels(), does not drop NA levels that have values.
#'
#' @param x a `tct_tree`.
#' @param only A character vector restricting the set of levels to be dropped. 
#' If supplied, only levels that have no entries and appear in this vector will be removed.
#'
#' @export
#'
#' @examples
#' c("Kyle", "John", "Molly") %>%
#'   tct_tree() %>%
#'   tct_drop("Kyle")
tct_drop <- function(x,
                     only) {
  
  x <- forcats::fct_drop(x, only)

  missing_levels <- igraph::V(tct_levels(x))$names[!(igraph::V(tct_levels(x))$name %in% levels(x))]
  tct_levels(x) <- igraph::delete_vertices(tct_levels(x), missing_levels)

  x
}
