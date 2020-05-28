## code to prepare `VALIDATION_TYPE_EXAMPLE` dataset goes here

VALIDATION_TYPE_EXAMPLE <- data.frame(
  validation_annotation = c("date_dmy", "date_mdy", "date_ymd", "datetime_dmy", "datetime_mdy",
                            "datetime_ymd", "datetime_seconds_dmy", "datetime_seconds_mdy",
                            "datetime_seconds_ymd", "email", "integer", "alpha_only", "number",
                            "number_1dp_comma_decimal", "number_1dp", "number_2dp_comma_decimal",
                            "number_2dp", "number_3dp_comma_decimal", "number_3dp",
                            "number_4dp_comma_decimal", "number_4dp", "number_comma_decimal",
                            "phone_australia", "phone", "postalcode_australia", "postalcode_canada",
                            "ssn", "time", "time_mm_ss", "mrn", "zipcode", "signature"),
  example = c("31-12-2008", "12-31-2008", "2008-12-31", "16-02-2011 17:45",
              "02-16-2011 17:45", "2011-02-16 17:45", "16-02-2011 17:45:23",
              "02-16-2011 17:45:23", "2011-02-16 17:45:23", "john.doe@vanderbilt.edu",
              "1, 4, -10", "name", "1.3, 22, -6.28, 3.14e-2", rep(NA, 10),
              "615-322-2222", "2150", "K1A 0B1", "123-12-1234", "19:30", "31:22",
              "0123456789", "01239", NA),
  notes = c(rep(NA, 10), "whole number with no decimal",
            "letters only, no numbers, spaces or special characters",
            "a general number or scientific notation (no spaces)",
            "number to 1 decimal place - comma as decimal",
            "number to 1 decimal place",
            "number to 2 decimal place - comma as decimal",
            "number to 2 decimal place",
            "number to 3 decimal place - comma as decimal",
            "number to 3 decimal place",
            "number to 4 decimal place - comma as decimal",
            "number to 4 decimal place",
            "number comma as decimal",
            NA,
            "Area codes start with a number from 2-9, followed by 0-8 and then any third digit.
            The second group of three digits, known as the central office or schange code, starts with a number from 2-9, followed by any two digits.
            The final four digits, known as the station code, have no restrictions.",
            "4-digit number",
            "Format: A0A 0A0 where A is a letter and 0 is a digit",
            "Format: xxx-xx-xxxx",
            "military time",
            "time in minutes and seconds",
            "10 digits",
            "U.S. Zipcode",
            "User draws signature with mouse or finger")
)

## code to prepare `FIELD_TYPE_DESCRIPTION` dataset goes here

FIELD_TYPE_DESCRIPTION <- data.frame(field_type = c("text", "notes", "dropdown",
                                                    "radio", "checkbox", "file",
                                                    "calc", "sql", "descriptive",
                                                    "slider", "yesno", "truefalse"),
                                     field_description = c("A single-line text box (for text and numbers)",
                                                           "A large text box for lots of text",
                                                           "A dropdown menu with options, select one",
                                                           "Radio buttons with options, select one",
                                                           "Checkboxes to allow selection of more than one option",
                                                           "Allows user to upload a document",
                                                           "Perform real-time calculations, no data entry",
                                                           "Select query statement to populate dropdown choices",
                                                           "Text is displayed with no data entry and optional image/file attachment",
                                                           "Visual analogue scale; coded as 0-100",
                                                           "Radio buttons with yes and no options; coded as 1, Yes | 0, No",
                                                           "Radio buttons with true and false options; coded as 1, True | 0, False"))


usethis::use_data(FIELD_TYPE_DESCRIPTION, VALIDATION_TYPE_EXAMPLE, overwrite = TRUE, internal = TRUE)

