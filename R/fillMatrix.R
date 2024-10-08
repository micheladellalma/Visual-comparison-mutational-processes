#' Fill the empty matrix with the values of signature for each genome
#'
#' @description This function fills the empty matrix by coulmns taken 
#' from the list of exposures per genome. It assumes that the empty 
#' matrix given has a number of rows equal to the number of rows of 
#' the object in the list, and a number of columns equal to the length 
#' of the exposure list (number 
#' tumor samples).
#'
#' @details With a for loop the columns are filled
#' @param matrix_empty (Mandatory) A NA fill matrix with num col equal
#' to lengthexposure_matrix (num of tumor genomes) and num of rows 
#' equal to the nrow of the exposure_matrix objects (num signatures).
#' @param exposure_matrix (Mandatory) A list of matrices
#' which length is equal to the number of tumor genomes and 
#' number of rows in the matrix is equal to the number of signatures
#' @return filled matrix with values of frequencies.
#' @author Michela Dell'Alma\cr Maintainer: Michela Dell'Alma
#' \cr E-Mail: < micheladellalma@@gmail.com> or <michela.dellalma@@polimi.it>
#'
#' @examples
#'
#'#' ## Retrieve signatures and tumor genomes
#' sigfile <- system.file("extdata",
#'            paste0("signatures.Rdata"),
#'            package="VisualComparisonMutationsSetTumors")
#' genomes_file <- system.file("extdata",
#'                 paste0("Nik-Zainal_PMID_22608084-MPF.Rdata"),
#'                package="VisualComparisonMutationsSetTumors")
#' 
#' ## Find exposures vectors for genome
#' exposure_vector <- exposureVector(sigfile, genomes_file)
#' 
#' ## Convert exposure vectors in exposure matrix
#' exposure_matrix <- exposureMatrix(exposure_vector)
#'
#' ## Create the empty matrix
#' matrix_empty <- createEmptyMatrix(exposure_matrix)
#'
#' ## Fill the empty matrix 
#' matrix_filled <- fillMatrix(matrix_empty, exposure_matrix)
#' 
#' @export


fillMatrix <- function(matrix_empty, exposure_matrix) {
    for (i in (seq_along(exposure_matrix))){
    matrix_empty[,i] <- exposure_matrix[[i]]}
    return(matrix_empty)}




