
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Introduce

When you want to install an R package on GitHub, but you can’t access
GitHub, this function helps you download and install the package from
another website <https://hub.fastgit.org/>, which is in real-time sync
with GitHub.

## Installation

``` r
# Install development version from GitLab
remotes::install_git("https://gitlab.com/chuxinyuan/ipkg.git")
```

## Usage

Install the development version of the R package on GitHub. Take the xfun package as an example.

``` r
install_github("yihui/xfun")
```

## License

ecce is free and open source software, licensed under MIT + file
LICENSE.
