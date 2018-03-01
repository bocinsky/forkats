ont_drop <- function(x)
{

  x <- forcats::fct_drop(x)
  
  missing_levels <- igraph::V(ont_levels(x))$names[!(igraph::V(ont_levels(x))$name %in% x)]
  ont_levels(x) <- igraph::delete_vertices(ont_levels(x),missing_levels)
  
  x
  
}
