#' Descendents of a tree level
#' 
#' Get the descendents of a tree level.
#'
#' @param x a `tct_tree`.
#' @param level a level whose descendents will be returned.
#' @param return_self whether to return the level in the vector of descendents.
#'
#' @importFrom stats na.omit
#' 
#' @export
#'
#' @examples
#' c("Kyle", "John", "Molly") %>%
#'   tct_tree() %>%
#'   tct_get_descendents("Kyle")
tct_get_descendents <- function(x, 
                                level,
                                return_self = TRUE) {
  out <- igraph::with_igraph_opt(
    options = list(return.vs.es = FALSE),
    igraph::dominator_tree(
      graph = tct_levels(x),
      root = level,
      mode = "out"
    )$leftout
  )
  
  if(length(out) > 0)
    out <- igraph::V(tct_levels(x))$name[-out]
  else
    out <- igraph::V(tct_levels(x))$name
  
  if(return_self) 
    return(out)
  
  out[out != level]
  
}

#' @describeIn tct_get_descendents Returns a logical vector of descendent values.
tct_is_descendent <- function(x, 
                              level,
                              return_self = TRUE) {
  x[x %in% tct_get_descendents(x, level, return_self)]
  
}
