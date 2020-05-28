#' Read in Data Dictionary
#'
#' @param dd_file path to the csv formatted data dictionary
#'
#' @return a tibble.
#'
#' @export

dd_read <- function(dd_file){
  dd <- readr::read_csv(file = dd_file)
  base::colnames(dd) <- janitor::make_clean_names(colnames(dd))
  #if (!all(dd$field_type %in% FIELD_TYPE_DESCRIPTION$field_type)) return error
  #if (!all(dd$text_validation_type_or_show_slider_number %in% VALIDATION_TYPE_EXAMPLE$validation_annotation)) return error
  return(dd)
}

