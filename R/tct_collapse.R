#' Collapse to a tree level
#' 
#' Collapse to a tree level, recoding descendent values in the tree to 
#' the collapsed level.
#'
#' @param x a `tct_tree`.
#' @param level a level to collapse.
#' @param update_levels whether the `levels` and `tct_levels` should 
#' be updated to remove descendent levels. Defaults to TRUE.
#'
#' @export
#'
#' @examples
#' c("Kyle", "John", "Molly") %>%
#'   tct_tree() %>%
#'   tct_collapse("Kyle")
tct_collapse <- function(x,
                         level,
                         update_levels = TRUE) {
  desc <- tct_get_descendents(x, level)
  x[x %in% desc] <- level

  if (!update_levels) {
    return(x)
  } else {
    return(tct_drop(x))
  }
}
