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
(`dplyr`? `tidyr`? or `purrr`?).
It will be convenient if you can call those functions
through an easy-to-remember namespace like `tdy`.

Some essential packages (from
[tidyverse](https://github.com/tidyverse/tidyverse) and
[Bioconductor](https://www.bioconductor.org/))
are pre-defined.

```r
load_in_namespace('tdy', pkgs_tidyverse)
iris %>% tdy::select(ends_with('Width'))

load_in_namespace('bio', pkgs_bio)
hg19 %>% bio::select(keys=..., columns=...)
```
