#' Exposures vector for each tumor genome, given the MPF file 
#' and the Alexandrov signatures
#' 
#' @description Given as input the tumor genomes as MPF file, 
#' and a set of Alexandrov signatures, thanks to the function 
#' already defined in decompTumor2Sig package, the function 
#' reads the two files and compute the signature weight vectors 
#' (also called 'exposures'), one for each tumor genome.
#' 
#' @usage exposureVector(sigfile, genomes_file)
#' @param genomes_file (Mandatory) The name of the MPF file 
#' (can be compressed with \code{gzip}).
#' @param sigfile (Mandatory) Can be a file name or an URL for 
#' download.
#' @return A list of signature weight vectors (also called 
#' 'exposures'), one
#' for each tumor genome. E.g., the first vector element of 
#' the first list object is the weight/contribution of the 
#' first signature to the first tumor genome. 
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
#' exposure_vector <- exposureVector(sigfile, genomes_file)
#' 
#' @importFrom BSgenome.Hsapiens.UCSC.hg19 BSgenome.Hsapiens.UCSC.hg19
#' @importFrom decompTumor2Sig readGenomesFromMPF readAlexandrovSignatures 
#' convertAlexandrov2Shiraishi decomposeTumorGenomes
#' 
#' @export 

exposureVector <- function(sigfile, genomes_file)  {
    refGenome <- BSgenome.Hsapiens.UCSC.hg19::BSgenome.Hsapiens.UCSC.hg19
    genomes <- decompTumor2Sig::readGenomesFromMPF(genomes_file, numBases=3, 
                type="Shiraishi",trDir=FALSE,
                refGenome=refGenome, verbose=FALSE)
    sign_a <- decompTumor2Sig::readAlexandrovSignatures(file = sigfile)
    sign_s <- decompTumor2Sig::convertAlexandrov2Shiraishi(sign_a)
    exposure_vector <- decompTumor2Sig::decomposeTumorGenomes(genomes, sign_s)
    return(exposure_vector)}

