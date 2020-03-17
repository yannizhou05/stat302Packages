context("Test my_t_test")
data("my_gapminder")


test_that("my_t_test has the correct output", {

  true_output1 = list(-1.6795, 1703, 0.0932, "two.sided")
  output1 = my_t_test(my_gapminder$lifeExp, alternative = "two.sided", mu = 60)
  expect_equal(true_output1[1], output1[1])
  expect_equal(true_output1[2], output1[2])
  expect_equal(true_output1[3], output1[3])
  expect_identical(true_output1[4], output1[4])

  true_output2 = list(-1.6795, 1703, 0.9534, "greater")
  output2 = my_t_test(my_gapminder$lifeExp, alternative = "greater", mu = 60)
  expect_equal(true_output2[1], output2[1])
  expect_equal(true_output2[2], output2[2])
  expect_equal(true_output2[3], output2[3])
  expect_identical(true_output2[4], output2[4])

  true_output3 = list(-1.6795, 1703, 0.0466, "less")
  output3 = my_t_test(my_gapminder$lifeExp, alternative = "less", mu = 60)
  expect_equal(true_output3[1], output3[1])
  expect_equal(true_output3[2], output3[2])
  expect_equal(true_output3[3], output3[3])
  expect_identical(true_output3[4], output3[4])

})

test_that("my_t_test stops with wrong input", {
  expect_error(my_t_test(my_gapminder$lifeExp, alternative = "anything", mu = 60))
})
