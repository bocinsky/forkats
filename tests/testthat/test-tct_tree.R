context("test-tct_tree")

# test_that("Create empty tree", {
#   tct_tree()
# })

test_that("Create tree from vector", {
     tct_tree(x = c("Kyle", "John", "Molly"))
})

test_that("Create tree from vector with manual tct_levels", {
  x <- c("Molly", "John", "Kyle")
  edgelist <- cbind(x, c(x[2:length(x)], NA))
  tct_levels <- igraph::graph_from_data_frame(
    d = na.omit(edgelist),
    vertices = levels(x),
    directed = TRUE
  )
  
  tct_tree(x = c("Kyle", "John", "Molly"),
           tct_levels = tct_levels)
  
  
  x <- c("Molly", "John", "Kyle", "Janice")
  edgelist <- cbind(x, c(x[2:length(x)], NA))
  tct_levels <- igraph::graph_from_data_frame(
    d = na.omit(edgelist),
    vertices = levels(x),
    directed = TRUE
  )
  
  tct_tree(x = c("Kyle", "Mike", "John", "Molly", "Jim"),
           tct_levels = tct_levels)
})
