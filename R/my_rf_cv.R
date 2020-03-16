#' Random Forest Cross-Validation function
#'
#' This function performs Random Forest Cross-Validation.
#'
#' @param k A number of folds.
#' @keywords prediction
#'
#' @return cv_MSE: a numeric with the cross-validation error.
#'
#' @importFrom stats predict
#' @importFrom dplyr filter
#' @import randomForest class magrittr tidyverse
#' @examples
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k) {
  my_gapminder <- my_gapminder
  fold <- sample(rep(1:k, length = length(my_gapminder$lifeExp)))
  train <- data.frame(my_gapminder, "split" = fold)
  cv_MSE <- vector()
  for (i in 1:k) {
    data_train <- train %>% filter(split != i)
    data_test <- train %>% filter(split == i)
    MODEL <- randomForest(lifeExp ~ gdpPercap, data = data_train, ntree = 100)
    PREDICTIONS <- predict(MODEL, data_test[, -1])
    cv_MSE[i] = mean((PREDICTIONS - data_test$lifeExp)^2)
  }
  return(mean(cv_MSE))
}

