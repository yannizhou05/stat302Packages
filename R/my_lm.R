#' Linear model function
#'
#' This function fits a linear model in R
#'
#' @param formula A formula that will be used for fitting the \code{data} set.
#' @param data A given data set that will be used for the model.
#' @keywords inference
#'
#' @return a summary table of coefficients
#' @return standard error
#' @return t value and p value for a hypothesis test
#'
#' @examples
#' data(my_gapminder)
#' my_lm(lifeExp ~ gdpPercap + continent, data = my_gapminder)
#'
#' @importFrom stats model.frame model.matrix model.response
#' @export
my_lm <- function(formula, data) {
  X = model.matrix(formula, data)
  data_frame = model.frame(formula, data)
  Y = model.response(data_frame)

  coefficients_beta = solve(t(X) %*% X) %*% t(X) %*% Y
  df_var = nrow(X) - ncol(X)
  sigma = sum((Y - X %*% coefficients_beta)^2 / df_var)

  standard_error = sqrt(diag(solve(t(X) %*% X)) * sigma)
  test_stat2 = (coefficients_beta) / standard_error
  Pr = 2 * pt(abs(test_stat2), df = df_var, lower.tail = FALSE)

  my_summary <- cbind(coefficients_beta, standard_error, test_stat2, Pr)
  colnames(my_summary) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(as.table(my_summary))
}
