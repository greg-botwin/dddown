#' Build a Data Dictionary Website for Your Project
#'
#' @param website_path Path to where your project's data dictionary website will be stored
#' @param dd_file  File to  your project's data dictionary
#'
#' @export
dd_build_site <- function(website_path, dd_file){
  usethis::create_package(path = website_path, check_name = FALSE, open = FALSE)
  setwd(paste(getwd(), website_path, sep= "/"))
  dd <- dd_read(dd_file = dd_file)
  update_yaml(dd = dd)
  usethis::use_pkgdown()
  # this where my functions will read in data dictionary and project info
  # create documentation for each column
  # use project information to develop readme
  create_rd_files(dd = dd)
  pkgdown::build_site()
}
