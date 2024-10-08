
context("create an empty matrix")
test_that("empty matrix with right num of columns and rows", {
  matrix_one <- as.matrix(1:9, nrow=3, ncol=3)
  matrix_two <- as.matrix(1:9, nrow=3, ncol=3)
  list_mat <- list(matrix_one, matrix_two)
  empty_mat <- createEmptyMatrix(list_mat)
  num_row <- nrow(list_mat[[1]])
  num_col <- length(list_mat)
  expect_true((nrow(empty_mat))==num_row)
  expect_true((ncol(empty_mat))==num_col)
})






