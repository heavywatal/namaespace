#' Examples of package set
#' @docType data
#' @name pkgs
NULL

#' tidyverse packages
#' @rdname pkgs
#' @export
#' @examples
#' \dontrun{
#' load_in_namespace('tdy', pkgs_tidyverse)
#' }
pkgs_tidyverse = c('ggplot2', 'tibble', 'tidyr', 'readr', 'purrr', 'dplyr')

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
