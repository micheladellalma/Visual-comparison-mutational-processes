

context("give names to the matrix")
test_that("matrix with right column and row names", {
  vect_one <- c('a' = 5, 'b' = 6, 'c' = 7, 'd' = 8)
  vect_two <- c('a' = 6, 'b' = 7, 'c' = 8, 'd' = 9)
  list_vect <- list(vect_one,vect_two)
  names(list_vect) <- c('name1', 'name2')
  list_mat <- exposureMatrix(list_vect)
  empty_mat <- createEmptyMatrix(list_mat)
  filled_mat <- fillMatrix(empty_mat, list_mat)
  matrix_named <- giveNamesMatrix(filled_mat, list_vect)
  row_names <- names(list_vect[[1]])
  col_names <- names(list_vect)
  expect_equal(rownames(matrix_named), row_names)
  expect_equal(colnames(matrix_named), col_names)
})



