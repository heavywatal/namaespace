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
pkgs_tidyverse = c("dplyr", "ggplot2", "purrr", "readr", "stringr", "tibble", "tidyr")

#' BioConductor basic packages
#' @rdname pkgs
#' @export
#' @examples
#' \dontrun{
#' load_in_namespace('bio', pkgs_bio)
#' }
pkgs_bio = c(
  "Biobase", "IRanges", "AnnotationDbi", "BiocGenerics",
  "S4Vectors", "XVector", "Biostrings",
  "GenomicRanges", "GenomicFeatures", "VariantAnnotation"
)
