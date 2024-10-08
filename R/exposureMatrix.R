#' Convertion of the vector of signatures exposures per genome 
#' into matrix of signatures exposures per genome.
#'
#' @description This function converts the list of vectors 
#' created with the core function of the package decompTumor2Sig, 
#' into a list of matrices.
#' 
#' @usage exposureMatrix(exposure_vector)
#' @details The matrices are composed by number of rows equal to 
#' the number of signatures and one column, referring to the sample
#' @param exposure_vector (Mandatory) is a list of objects with 
#' names of the tumor genomes, the objects are composed each by a 
#' vector of signatures.
#' @return exposure list composed by matrix type objects.
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
#' ## Convert exposure vectors in exposure matrix
#' exposure_matrix <- exposureMatrix(exposure_vector)
#' 
#' @export


exposureMatrix <- function(exposure_vector){
    lapply(exposure_vector, function(x){x <- as.matrix(x)
    dimnames(x)=NULL
    return(x)})}













