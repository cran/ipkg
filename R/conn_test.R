#' @title Tests whether the website is properly connected
#'
#' @description
#' Tests whether the website is properly connected.
#'
#' @param url A website url address.
#'
#' @return A string that returns "ok" if the connection is normal 
#' and "no" otherwise.
#'
#' @examples
#' # Example(Not run)
#' # conn_test("www.baidu.com")
#'
#' @export

#------------------------------------------------------------------------------#

# Connection test
conn_test = function(url) {
  result = ""
  tryCatch(
    {
      response = httr::GET(url)
      if (httr::status_code(response) == 200) {
        result = "ok"
      } else {
        result = "no"
      }
    }, 
    error = function(e) {}
  )
  return(result)
}

#------------------------------------------------------------------------------#