context("Test my_knn_cv")
data("my_iris")
data("my_gapminder")


test_that("my_knn_cv works", {
  expect_is(my_knn_cv(iris[,-5],iris$Species,5,5), "list")
})
