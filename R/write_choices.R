choice_type <- function(dd){
  ifelse(dd[["field_type"]] == "calc", "calc",
         ifelse(dd[["field_type"]]  %in% c("checkbox", "dropdown", "radio"), "choices",
                ifelse(dd[["field_type"]] == "slider", "slider", "none")))
}

parse_choices <- function(dd){
  # split by | and trim ws
  first_split <- base::trimws(base::strsplit(dd[["choices_calculations_or_slider_labels"]],
                                             split = "\\|")[[1]])

  # place character vector into list
  split_list <- vector("list", length(first_split))
  for(i in seq_along(first_split)) {
    split_list[[i]] <- first_split[i]
  }

  # split by ,
  second_split <- lapply(split_list, function(x) {
    strsplit(x, split = ",")[[1]]
  })
  # remove ws
  second_split <- lapply(second_split, base::trimws)

  # convert to data frame
  df <- as.data.frame(do.call(rbind, second_split))

  # add colnames and variable code
  colnames(df) <- c("code", "choice")
  df$export_code <- paste0(df$code, "___", df$choice)
  return(df)
}

add_choices <- function(parsed_choices){
  paste(parsed_choices["code"], "\\tab", parsed_choices["choice"], "\\tab",
         parsed_choices["export_code"], "\\cr")
}



parse_slider <- function(dd){
  base::trimws(base::strsplit(dd["choices_calculations_or_slider_labels"], split = "\\|")[[1]])
}

write_choices_slider_calc <- function(dd){
  if(choice_type(dd) == "none"){
    print("none")
  }
  if(choice_type(dd) == "slider"){
    print("slider")
  }
  if(choice_type(dd) == "choices"){
    print("choices")
  }

  if(choice_type(dd) == "calc"){
    print("calc")
  }
}
