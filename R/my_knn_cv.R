#' k-Nearest Neighbors Cross-Validation
#'
#' This function performs k-Nearest Neighbors Cross-Validation.
#'
#' @param train Input data frame
#' @param cl True class value of trainning data
#' @param k_nn Integer representing the number of neighbors
#' @param k_cv Integer representing the number of folds
#' @keywords prediction
#'
#' @return class:  a vector of the predicted class for all observations
#' @return cv_err: a numeric with the cross-validation misclassification error
#'
#' @importFrom dplyr filter select
#' @import class magrittr tidyverse
#' @examples
#' data(my_iris)
#' my_knn_cv(iris[,-5],iris$Species,5,5)
#'
#' @export
my_knn_cv <- function(train,cl,k_nn,k_cv) {
  fold <- sample(rep(1:k_cv, length = length(cl)))
  train <- data.frame(train, "split" = fold)
  cl1 <- data.frame(cl, "split" = fold)
  cv_rate <- vector()
  for (i in 1:k_cv) {
    data_train <- train %>% filter(split != i)
    data_test <- train %>% filter(split == i)
    cl_train <- cl1 %>% filter(split != i)
    cl_test <- cl1 %>% filter(split == i)
    cl_train$split <- NULL
    cl_test$split <- NULL
    # Record predictions
    pred_mat <- knn(data_train,data_test,cl_train$cl,k_nn)
    pred_mat.df <- data.frame(pred_mat)
    cv_rate[i] = sum(pred_mat.df != cl_test) / nrow(cl_test)
  }
  class <- list()
  class[["class"]] = knn(train,train,cl,k_nn)
  class[["cv_error"]] = mean(cv_rate)
  return(class)
}
