# namaespace

namaespace provides a function to create a dummy R package that imports and exports other packages' functions.
The goal is to create a temporary namespace through which you can call those functions.

You can install the latest version from github with

```{r}
devtools::install_github('heavywatal/namaespace')
```

## Usage

```{r}
library(namaespace)
load_in_namespace('had', c('readr', 'stringr', 'plyr', 'tidyr', 'dplyr', 'ggplot2'))
load_in_namespace('bio', c('Biobase', 'IRanges', 'AnnotationDbi', 'BiocGenerics',
                           'S4Vectors', 'XVector', 'Biostrings',
                           'GenomicRanges', 'GenomicFeatures', 'VariantAnnotation'))
iris %>% had::select(ends_with('Width'))
```
