#' Creat References for Elements of Data Dictionary
#'
#' @param dd a propoerly formatted data dictionary as tibble. Readin from dd_read
#'
#' @export
create_rd_files <- function(dd){

  # create file with the variable id in man
  dir.create("man")
  sapply(paste0("man/", dd$variable_field_name, ".Rd"), file.create,
         overwrite = TRUE)
  apply(dd, 1, write_rd)
}


write_rd <- function(dd){
  fileConn<-file(paste0("man/", dd["variable_field_name"], ".Rd"))
  writeLines(c(paste0("\\name{", dd["variable_field_name"], "}"),
               paste0("\\title{", dd["field_label"], "}"),
               paste0("\\arguments{"),
               paste0("\\item{FIELD LABEL}{", dd["field_label"], "}"),
               paste0("\\item{FIELD TYPE}{", return_field_type(dd), "}"),
               paste0("\\item{IDENTIFIER}{", return_logical(dd["identifier"]), "}"),
               paste0("\\item{REQUIRED FIELD}{", return_logical(dd["required_field"]), "}"),
               paste0("\\item{VALIDATION TYPE}{", dd["text_validation_type_or_show_slider_number"], "}"),
               paste0("\\item{BRANCHING LOGIC SHOW IF}{", "\\code{", dd["branching_logic_show_field_only_if"], "}", "}"),
               paste0("\\item{FIELD NOTE}{", dd["field_note"], "}", "}"),
               paste0("\\section{Validation}{"),
               paste0("\\describe{"),
               paste0("\\item{TYPE}{", dd["text_validation_type_or_show_slider_number"], "}"),
               paste0("\\item{DESCRIPTION}{", return_validation_description(dd), "}"),
               paste0("\\item{MIN}{", dd["text_validation_min"], "}"),
               paste0("\\item{MAX}{", dd["text_validation_max"], "}"),
               paste0("\\item{EXAMPLE}{", return_validation_example(dd), "}", "}", "}"),
               # paste0("\\section{Choices}{"),
               # paste0("\\tabular{rrr}{"),
               # paste0("1 \\tab Choice One \\tab 1___Choice One \\cr"),
               # paste0("2 \\tab Choice Two \\tab 2___Choice Two \\cr"),
               # paste0("3 \\tab Choice Three \\tab 3___Choice Three", "}"),
               paste0("}")), fileConn)
  close(fileConn)
}



return_logical <- function(x){
  # value from row of dd, designed for identifer and required field
  ifelse(is.na(x), FALSE, TRUE)
}


return_matched_field <- function(dataset, match_column, match_value, return_value) {
  data
}

return_field_type <- function(x){
  paste(x["field_type"], "-",
          FIELD_TYPE_DESCRIPTION[match(x["field_type"],
                                       FIELD_TYPE_DESCRIPTION$field_type),
                                 "field_description"])
}

return_validation_description <- function(x){
  VALIDATION_TYPE_EXAMPLE[match(x["text_validation_type_or_show_slider_number"],
                              VALIDATION_TYPE_EXAMPLE$validation_annotation), "notes"]
}

return_validation_example <- function(x){
  VALIDATION_TYPE_EXAMPLE[match(x["text_validation_type_or_show_slider_number"],
                                VALIDATION_TYPE_EXAMPLE$validation_annotation), "example"]
}
