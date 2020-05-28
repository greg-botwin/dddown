choices <- "a, Choice A | b, Choice B | c, Choice C"

test_that("number of choices", {
  expect_equal(length(parse_choices(choices)), 3)
})

