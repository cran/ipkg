#' @title Install R packages on GitHub from hub.fastgit.org
#'
#' @description
#' When you want to install an R package on GitHub, but you can't access GitHub,
#' this function helps you download and install the package from another website,
#' which is in real-time sync with GitHub.
#'
#' @param pkg Repository address in the format username/repo.  
#'
#' @examples
#'
#' # Example
#' # install_github("yihui/xfun")
#'
#' @export

################################################################################

# Install GitHub packages from another repo
install_github = function(pkg) {
  url = paste0("https://hub.fastgit.xyz/", pkg, ".git")
  remotes::install_git(url) 
}

################################################################################