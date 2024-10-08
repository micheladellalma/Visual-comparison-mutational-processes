#' Create an empty matrix
#'
#' @description This function creates an empty matrix ready 
#' to be filled with the exposures values, the empty matrix 
#' has a number of rows that is equal to the length of the 
#' object in the signatures exposure list (number of signatures), 
#' and number of columns that is equal to the length of the 
#' signatures exposures list (number of tumor genomes).
#' 
#' @usage createEmptyMatrix(exposure_matrix)
#' @details The number of rows is equal to the length of the 
#' signatures (number of row of the matrices in the list) and 
#' the number of columns to the number of genomes (length of 
#' the list)
#' @param exposure_matrix (Mandatory) A list of objects, in 
#' particular a list of matrices.
#' @return An empty matrix with num col of \code{length(exposure_matrix)} 
#' and num rows equal to the number of signatures in each object of 
#' exposure_matrix.
#' @author Michela Dell'Alma\cr Maintainer: Michela Dell'Alma
#' \cr E-Mail: < micheladellalma@@gmail.com> or <michela.dellalma@@polimi.it>
#' 
#' @examples
#' 
#' ## Retrieve signatures and tumor genomes
#' sigfile <- system.file("extdata",
#'            paste0("signatures.Rdata"),
#'            package="VisualComparisonMutationsSetTumors")
#' genomes_file <- system.file("extdata",
#'                paste0("Nik-Zainal_PMID_22608084-MPF.Rdata"),
#'                package="VisualComparisonMutationsSetTumors")
#' 
#' ## Find exposures vectors for genome
#' exposure_vector <- exposureVector(sigfile, genomes_file)
#' 
#' ## Find the exposures matrix for each genome, given 
#' ## exposure vectors
#' exposure_matrix <- exposureMatrix(exposure_vector)
#' 
#' ## Create an empty matrix given the length of the list 
#' ## and the nrow of the matrices (exposure_matrix)
#' empty_matrix <- createEmptyMatrix(exposure_matrix)
#' 
#' 
#' @export

createEmptyMatrix <- function(exposure_matrix){
    list_length <- lapply(exposure_matrix, nrow)
    num_sign <- list_length[[1]]
    matrix_empty <- matrix(, nrow = num_sign, ncol = length(exposure_matrix))
    return(matrix_empty)}






