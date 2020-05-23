#' Read in Data Dictionary
#'
#' @param path_to_dd path to the xls or xlsx formatted data dictionary
#'
#' @return
#' @export
#'
#' @examples
dd_read <- function(path_to_dd){
  readxl::read_excel(path = "path_to_dd")
}
