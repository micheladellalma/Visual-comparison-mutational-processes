

context("fill matrix")
test_that("the matrix is filled", {
       matrix_one <- as.matrix(1:9, nrow=3, ncol=3)
       matrix_two <- as.matrix(1:9, nrow=3, ncol=3)
       list_mat <- list(matrix_one, matrix_two)
       empty_mat <- createEmptyMatrix(list_mat)
       filled_mat <- fillMatrix(empty_mat, list_mat)
       expect_false(all(is.na(filled_mat)))
       })
