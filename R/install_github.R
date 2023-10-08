#' @title Install R packages from GitHub via the proxy site
#'
#' @description
#' When you want to install R packages from GitHub, but you can't access GitHub,
#' this function helps you download and install R packages from GitHub via the
#' proxy website <https://ghproxy.com/> or <https://gh-proxy.com/>, which is in
#' real-time sync with GitHub.
#'
#' @param repo Repository address in the format username/repo. 
#' 
#' @param subdir A sub-directory within a git repository that may 
#' contain the package we are interested in installing.
#' 
#' @param ref Name of branch, tag or SHA reference to use, if not HEAD.
#' 
#' @param upgrade Should package dependencies be upgraded? One of "default", 
#' "ask", "always", or "never". "default" respects the value of the 
#' R_REMOTES_UPGRADE environment variable if set, and falls back to "ask" 
#' if unset. "ask" prompts the user for which out of date packages to upgrade. 
#' For non-interactive sessions "ask" is equivalent to "always". TRUE and FALSE 
#' are also accepted and correspond to "always" and "never" respectively. 
#' 
#' @param force Force installation, even if the remote state has not changed 
#' since the previous install.
#' 
#' @param quiet If TRUE, suppress output.
#' 
#' @param build If TRUE build the package before installing.
#'
#' @examples
#' # Example(Not run)
#' # install_github("yihui/xfun")
#'
#' @export

#------------------------------------------------------------------------------#

# Install GitHub packages via the proxy site
install_github = function(
    repo,
    subdir = NULL,
    ref = NULL,
    upgrade = c("default", "ask", "always", "never"),
    force = FALSE,
    quiet = FALSE,
    build = TRUE
) {
  # Alternate proxy address
  proxy = c(
    "https://ghproxy.com/",
    "https://gh-proxy.com/"
  )
  # Determine a proxy address
  if (conn_test(proxy[1]) == "ok") {
    proxy_url = paste0(proxy[1], "https://github.com/", repo, ".git")
  } else {
    proxy_url = paste0(proxy[2], "https://github.com/", repo, ".git")
  }
  # Install GitHub package
  remotes::install_git(
    url = proxy_url,
    subdir = subdir,
    ref = ref,
    upgrade = upgrade,
    force = force,
    quiet = quiet,
    build = build
  ) 
}

#------------------------------------------------------------------------------#