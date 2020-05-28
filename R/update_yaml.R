
#' @export
update_yaml <- function(dd){
  dd <- dd %>%
    dplyr::mutate(form_name = gsub(":", "-", form_name),
                  section_header = gsub(":", "-", section_header),
                  form_name = gsub("[\r\n]", "", form_name),
                  section_header = gsub("[\r\n]", "", section_header),
                  form_name = gsub("_", " ", form_name),
                  form_name = simpleCap(form_name)) %>%
    dplyr::group_by(form_name) %>%
    tidyr::fill(section_header) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(section_header = ifelse(is.na(section_header), "", section_header))

  dd_form_grouped <- dd %>%
    dplyr::group_by(form_name) %>%
    dplyr::group_split()

  dd_form_section_grouped <- dd %>%
    dplyr::group_by(form_name, section_header) %>%
    dplyr::group_split()


  write(paste("reference:"), file = "_pkgdown.yml", append = TRUE)

  for(f in seq_along(dd_form_grouped)){
    write(paste0("- ", "title: \"", unique(dd_form_grouped[[f]]$form_name), "\""), file = "_pkgdown.yml", append = TRUE)
    for(s in seq_along(dd_form_section_grouped)){
      write(paste0("- ", "subtitle: \"", unique(dd_form_section_grouped[[s]]$section_header), "\""), file = "_pkgdown.yml", append = TRUE)
      for(c in seq_along(dd_form_section_grouped[[s]]$variable_field_name)){
        write(paste("   ", "-", dd_form_section_grouped[[s]]$variable_field_name[c]), file = "_pkgdown.yml", append = TRUE)
      }
    }
  }
}



simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}
