#' Examples of package set
#' @docType data
#' @name pkgs
NULL

#' Hadley Wickham packages
#' @rdname pkgs
#' @export
#' @examples
#' \dontrun{
#' load_in_namespace('had', pkgs_had)
#' }
pkgs_had = c('plyr', 'dplyr', 'tibble', 'tidyr', 'purrr', 'readr', 'stringr', 'ggplot2')

#' BioConductor basic packages
#' @rdname pkgs
#' @export
#' @examples
#' \dontrun{
#' load_in_namespace('bio', pkgs_bio)
#' }
pkgs_bio = c('Biobase', 'IRanges', 'AnnotationDbi', 'BiocGenerics',
             'S4Vectors', 'XVector', 'Biostrings',
             'GenomicRanges', 'GenomicFeatures', 'VariantAnnotation')
