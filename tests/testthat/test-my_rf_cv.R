context("Test my_rf_cv")
data("my_gapminder")

test_that("multiplication works", {
  expect_is(my_rf_cv(5), "numeric")
})
