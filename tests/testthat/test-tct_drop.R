context("tct_drop")

test_that("doesn't add NA level", {
  f1 <- tct_tree(c("a", NA), levels = c("a", "b"))
  f2 <- tct_drop(f1)

  expect_equal(levels(f2), "a")
})

test_that("can optionally restrict levels to drop", {
  f1 <- tct_tree("a", levels = c("a", "b", "c"))

  expect_equal(levels(tct_drop(f1, only = "b")), c("a", "c"))
  expect_equal(levels(tct_drop(f1, only = "a")), c("a", "b", "c"))
})
