% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_rf_cv.R
\name{my_rf_cv}
\alias{my_rf_cv}
\title{Random Forest Cross-Validation function}
\usage{
my_rf_cv(k)
}
\arguments{
\item{k}{A number of folds.}
}
\value{
cv_MSE: a numeric with the cross-validation error.
}
\description{
This function performs Random Forest Cross-Validation.
}
\examples{
my_rf_cv(5)

}
\keyword{prediction}
