#' Name the filled matrix
#'
#' @description This function names the filled matrix with names 
#' of signatures (rows) and name of tumor genomes (columns). 
#' It assumes that the matrix has no row and column names, and all 
#' the columns are filled, such that on the rows there are the 
#' different signatures and on the columns there are the different 
#' samples.
#'
#' @usage giveNamesMatrix(matrix_filled, exposure_vector)
#' @param matrix_filled (Mandatory) A matrix filled with frequencies 
#' values, but without labels.
#' @param exposure_vector (Mandatory) A list of vectors containing 
#' signatures frequencies for each genome
#' @return A matrix with labels
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
#' ## Name the matrix
#' matrix_named <- giveNamesMatrix(matrix_filled, exposure_vector)
#' 
#' @export


giveNamesMatrix <- function(matrix_filled, exposure_vector){
    rownames(matrix_filled) <- names(exposure_vector[[1]])
    colnames(matrix_filled) <- names(exposure_vector)
    return(matrix_filled)}



