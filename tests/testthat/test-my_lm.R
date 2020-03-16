context("Test my_lm")
data("my_gapminder")

test_that("my_lm works", {
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent, data = my_gapminder),"table")
})
