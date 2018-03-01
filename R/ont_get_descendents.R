ont_get_descendents <- function (x, level)
{
  out <- igraph::with_igraph_opt(
    options = list(return.vs.es = FALSE),
    igraph::dominator_tree(graph = ont_levels(x),
                           root = level,
                           mode = "out")$leftout
  )
  
  igraph::V(ont_levels(x))$name[-out]
}
