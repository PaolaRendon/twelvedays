test_that("make_phrase works", {

  correct_result <- "ten horses a-leaping"

  my_result <- make_phrase(num = 10,
                           num_word = "ten",
                           item = "horses",
                           verb = "a-leaping",
                           adjective = "",
                           location = "")

  expect_equal(my_result, correct_result)
})
