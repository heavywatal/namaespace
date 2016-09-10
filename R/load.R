#' Extract export lines from NAMESPACE
#' @param package A string
#' @return A string vector of \code{export()} lines in NAMESPACE
#' @rdname load
#' @export
#' @examples
#' exported_from('readr')
exported_from = function(package) {
    stopifnot(!package %in% c('base'))
    infile = system.file('NAMESPACE', package=package)
    content = readChar(infile, file.info(infile)$size)
    content = gsub('#.+?(\\n|$)', '', content)
    pattern = 'export\\([[:graph:][:space:]]+?\\)'
    unlist(stringr::str_extract_all(content, pattern))
}

#' Load packages and put all objects into a namespace
#' @param namespace A string
#' @param packages A string vector
#' @rdname load
#' @export
#' @examples
#' \dontrun{
#' load_in_namespace('had', c('plyr', 'dplyr', 'tidyr', 'purrr', 'readr', 'stringr', 'ggplot2'))
#' }
load_in_namespace = function(namespace, packages) {
    installed = rownames(utils::installed.packages())
    stopifnot(all(packages %in% installed))
    path = file.path(tempdir(), namespace)
    unlink(path, recursive=TRUE)
    title = sprintf('Dummy package to use a namespace "%s".', namespace)
    description = list(
        Package=namespace, Title=title,
        `Authors@R`=getOption('devtools.desc.author'),
        Description=title,
        License='MIT',
        Imports=paste(packages, collapse=', '),
        URL='https://github.com/heavywatal/namaespace',
        BugReports='https://github.com/heavywatal/namaespace/issues')
    devtools::create(path, description=description, rstudio=FALSE)
    imports = sprintf('import(%s)', packages)
    exports = unlist(lapply(packages, exported_from))
    output = paste(c(imports, exports), collapse='\n')
    cat(output, file=file.path(path, 'NAMESPACE'))
    devtools::load_all(path)
}
