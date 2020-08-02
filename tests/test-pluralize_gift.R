test_that("pluralize_gift works", {

  correct_result <- "Horses"

  my_result <- pluralize_gift("Horse")

  expect_equal(my_result, correct_result)
})
