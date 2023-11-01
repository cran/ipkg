#' @title Download file from GitHub via the proxy site
#'
#' @description
#' This function can be used to download a file from GitHub via the 
#' proxy website <https://ghproxy.com/> or <https://gh-proxy.com/>.
#'
#' @param url a character string (or longer vector for the "libcurl" method) 
#' naming the URL of a resource to be downloaded. 
#' 
#' @param destfile a character string (or vector, see the url argument) 
#' with the file path where the downloaded file is to be saved. 
#' Tilde-expansion is performed.
#' 
#' @param method Method to be used for downloading files. Current download 
#' methods are "internal", "libcurl", "wget", "curl" and "wininet" (Windows only), 
#' and there is a value "auto": see ‘Details’ and ‘Note’. The method can also 
#' be set through the option "download.file.method": see options().
#' 
#' @param quiet If TRUE, suppress status messages (if any), and the progress bar.
#'  
#' @param mode character. The mode with which to write the file. Useful values 
#' are "w", "wb" (binary), "a" (append) and "ab". Not used for methods "wget" and 
#' "curl". See also ‘Details’, notably about using "wb" for Windows. 
#' 
#' @param cacheOK logical. Is a server-side cached value acceptable?
#' 
#' @param extra character vector of additional command-line arguments for the 
#' "wget" and "curl" methods.
#' 
#' @param headers named character vector of additional HTTP headers to use in 
#' HTTP[S] requests. It is ignored for non-HTTP[S] URLs. The User-Agent header 
#' taken from the HTTPUserAgent option (see options) is automatically used as 
#' the first header.
#'
#' @examples
#' # Example(Not run)
#' # download_file(
#' #  url = "https://github.com/hadley/mastering-shiny/raw/main/neiss/products.tsv",
#' #  destfile = "products.tsv",
#' #  quiet = TRUE
#' # )
#'
#' @export

#------------------------------------------------------------------------------#

# Download file from GitHub via the proxy site
download_file = function(
    url, 
    destfile, 
    method, 
    quiet = FALSE, 
    mode = "w",
    cacheOK = TRUE,
    extra = getOption("download.file.extra"),
    headers = NULL
) {
  if (grepl("github", url) == TRUE) {
    # Alternate proxy address
    proxy = c(
      "https://ghproxy.com/",
      "https://gh-proxy.com/"
    )
    # Determine a proxy address
    if (conn_test(proxy[1]) == "ok") {
      proxy_url = paste0(proxy[1], url)
    } else {
      proxy_url = paste0(proxy[2], url)
    }
    # Download file
    utils::download.file(
      url = proxy_url,
      destfile = destfile,
      method = method,
      quiet = quiet,
      mode = mode,
      cacheOK = cacheOK,
      extra = extra,
      headers = headers
    )
  } else {
    # Download file
    utils::download.file(
      url = url,
      destfile = destfile,
      method = method,
      quiet = quiet,
      mode = mode,
      cacheOK = cacheOK,
      extra = extra,
      headers = headers
    )
  }
}

#------------------------------------------------------------------------------#