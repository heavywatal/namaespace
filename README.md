# namaespace

`namaespace` provides a function to create a dummy R package that imports and exports other packages' functions.
The goal is to create a temporary namespace through which you can call those functions.

The latest version can be installed from github with

```r
devtools::install_github('heavywatal/namaespace')
```

## Usage

```r
library(namaespace)
load_in_namespace('myns', c('pkg1', 'pkg2', 'pkg3'))
myns::pkg1_func()
myns::pkg2_func()
```

Functions `select()` and `rename()` from `dplyr`
often get masked by other packages.
To avoid such conflicts, you had to write the package names explicitly
like `dplyr::select()`.
But it is very hard to remember where those functions are loaded from
(`plyr`? `dplyr`? or `tidyr`?).
It will be convenient if you can call those functions
through an easy-to-remember namespace like `had`.

```r
load_in_namespace('had', pkgs_had)
load_in_namespace('bio', pkgs_bio)
iris %>% had::select(ends_with('Width'))
```
