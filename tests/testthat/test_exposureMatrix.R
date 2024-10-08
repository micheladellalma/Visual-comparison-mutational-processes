

context("exposure matrix")
test_that("class of the objects in the list  is equal to matrix", {
  vect_one <- c('a' = 5, 'b' = 6, 'c' = 7, 'd' = 8)
  vect_two <- c('a' = 6, 'b' = 7, 'c' = 8, 'd' = 9)
  list_vect <- list(vect_one,vect_two)
  list_mat <- exposureMatrix(list_vect)
  expect_true(class(list_vect[[1]])=='numeric')
  expect_true(class(list_mat[[1]])=='matrix')
})