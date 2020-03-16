#' T.test function
#'
#' This function performs a one sample t-test.
#'
#' @param x A numeric vector of data.
#' @param alternative A character string specifying the alternative hypothesis.
#' This should only accept "two.sided", "less", or "greater". Otherwise, throw an informative error.
#' @param mu A number indicating the null hypothesis value of the mean.
#' @keywords inference
#'
#' @return test_stat: the numeric test statistic.
#' @return df: the degrees of freedom.
#' @return \code{alternative}: the value of the parameter \code{alternative}.
#' @return p_val: the numeric p-value.
#'
#' @importFrom stats pt sd
#' @examples
#' my_t_test(rnorm(10, mean = 1.5, sd = 1), alternative = "greater", mu = 0)
#' my_t_test(rnorm(10, mean = 1.5, sd = 1), alternative = "less", mu = 0)
#' my_t_test(rnorm(10, mean = 1.5, sd = 1), alternative = "two.sided", mu = 0)
#'
#' @export
my_t_test <- function(x, alternative, mu) {
  if (alternative != "two.sided" & alternative != "less" & alternative != "greater") {
    stop ("alternative has to equal two sided, less or greater")
  }
  test_stat = (mean(x) - mu) / (sd(x) / sqrt(length(x)))
  degree_freedom = length(x) - 1
  if (alternative == "less") {
    p_val = 1 - pt(test_stat, df = degree_freedom, lower.tail = FALSE)
  } else if (alternative == "greater"){
    p_val = 1 - pt(test_stat, df = degree_freedom, lower.tail = TRUE)
  } else {
    p_val = 2 * pt(abs(test_stat), df = degree_freedom, lower.tail = FALSE)
  }
  output_list <- list(round(test_stat, signif(4)), degree_freedom, round(p_val,signif(4)), alternative)
  return(output_list)
}
