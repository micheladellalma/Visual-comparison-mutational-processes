#' Draw a heatmap.
#'
#' @description This function allows a visualization of the signatures 
#' weights (exposures) per genome. It assumes that the object of the 
#' function is a matrix with specific column and row names.
#'
#' @usage heatMap(matrix_named) 
#' @details False color image with a dendrogram added to the left side 
#' and to the top, typically, reordering of the rows and columns according 
#' to some set of values (row or column means) within the restrictions 
#' imposed by the dendrogram is carried out.
#' @param matrix_named (Mandatory) A matrix with as rows the signatures 
#' names (string) and as columns the tumor genomes (string) and as 
#' numerical values the contributions.
#' @return Heatmap visualization of the signatures contributions for 
#' each tumor genome.
#' @author Michela Dell'Alma\cr Maintainer: Michela Dell'Alma
#' \cr E-Mail: < micheladellalma@@gmail.com> or <michela.dellalma@@polimi.it>
#' 
#' @importFrom stats heatmap
#' 
#' @examples 
#' 
#' #' ## Retrieve signatures and tumor genomes
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
#' ## Create the heatmap
#' heatMap(matrix_named)
#' 
#' @export

heatMap <- function(matrix_named){
    heatmap(matrix_named, labRow = rownames(matrix_named))}



