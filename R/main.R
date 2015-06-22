#' namaespace: A package to create dummy packages for namespace
#' @docType package
#' @name namaespace
#' @import devtools
#' @import readr
NULL

#' Extract export lines from NAMESPACE
#' @param package A string
#' @return \code{export()} lines in NAMESPACE
#' @export
#' @examples
#' extract_exports('readr')
extract_exports = function(package) {
    infile = system.file('NAMESPACE', package=package)
    content = read_lines(infile)
    grep('^export', content, value=TRUE)
}

#' Write import() and export() to NAMESPACE
#' @param packages A string vector
#' @param path A string
import_export_all = function(packages, path='.') {
    imports = sprintf('import(%s)', packages)
    exports = unlist(lapply(packages, extract_exports))
    output = paste(c(imports, exports), collapse='\n')
    cat(output, file=file.path(path, 'NAMESPACE'))
}

#' Load packages and put all objects into a namespace
#' @param namespace A string
#' @param packages A string vector
#' @export
#' @examples
#' load_in_namespace('had', c('devtools', 'readr'))
load_in_namespace = function(namespace, packages) {
    installed = rownames(installed.packages())
    stopifnot(all(packages %in% installed))
    path = file.path(tempdir(), namespace)
    title = sprintf('Dummy package to use a namespace "%s".', namespace)
    description = list(
        Package=namespace, Title=title,
        `Authors@R`='person("Nelson", "Sauvin",
            email="user@example.com", role=c("aut", "cre"))',
        Description=title,
        License='MIT',
        Imports=paste(packages, collapse=', '),
        URL='https://github.com/heavywatal/namaespace',
        BugReports='https://github.com/heavywatal/namaespace/issues')
    devtools::create(path, description=description, rstudio=FALSE)
    import_export_all(packages, path)
    devtools::load_all(path)
    unlink(path, recursive=TRUE)
}
