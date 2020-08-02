test_that("sing_day works", {

  sample <- data.frame("column1" = 1:2, "column2" = c("one puppy running","two horses a-leaping"))

  correct_result <- "On the second day of Christmas, my true love sent to me,
                     two horses a-leaping,
                     one puppy running."

  my_result <- sing_day(sample, 2, column2)

  expect_equal(my_result, correct_result)

})
