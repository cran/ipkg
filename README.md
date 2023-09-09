
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Introduce

When you want to install an R package on GitHub, but you can’t access
GitHub, this function helps you download and install the package on
GitHub via the proxy website <https://ghproxy.com/>, which is in real-time 
sync with GitHub.

## Installation

``` r
# Install development version from GitLab
remotes::install_git("https://gitlab.com/chuxinyuan/ipkg.git")
# Install from CRAN
install.packages("ipkg")
```

## Usage

Install the development version of the R package on GitHub. Take the 'xfun' package as an example.

``` r
install_github("yihui/xfun")
```

Download file from GitHub via the proxy site https://ghproxy.com. for example:

``` r
download_file(
 url = "https://github.com/hadley/mastering-shiny/raw/main/neiss/products.tsv",
 destfile = "products.tsv",
 quiet = TRUE
)
```

## License

ecce is free and open source software, licensed under MIT + file
LICENSE.
