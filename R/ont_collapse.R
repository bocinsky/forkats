ont_collapse <- function(x,
                         level,
                         update_levels = TRUE)
{
  desc <- get_descendents(x, level)
  x[x %in% desc] <- level
  
  if(!update_levels)
    return(x)
  else
    return(ont_drop(x))
  
}
