
#' @export
update_yaml <- function(dd){
  dd_grouped <- dd %>%
    dplyr::mutate(form_name = gsub(":", "-", form_name),
                  section_header = gsub(":", "-", section_header),
                  form_name = gsub("[\r\n]", "", form_name),
                  section_header = gsub("[\r\n]", "", section_header)) %>%
    dplyr::group_by(form_name) %>%
    tidyr::fill(section_header) %>%
    dplyr::group_by(form_name, section_header) %>%
    dplyr::group_split()

  write(paste("- reference:"), file = "_pkgdown.yml", append = TRUE)

  for(i in seq_along(dd_grouped)){
    write(paste("-", "title:", unique(dd_grouped[[i]]$form_name)), file = "_pkgdown.yml", append = TRUE)
    write(paste("-", "subtitle:", unique(dd_grouped[[i]]$section_header)), file = "_pkgdown.yml", append = TRUE)
    write(paste("-", "contents:"), file = "_pkgdown.yml", append = TRUE)
    for(r in seq_along(dd_grouped[[i]]$variable_field_name)){
      write(paste("-", dd_grouped[[i]]$variable_field_name[r]), file = "_pkgdown.yml", append = TRUE)
    }
  }
}
