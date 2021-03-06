% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binary_prob_success.R
\name{binary_prob_success}
\alias{binary_prob_success}
\alias{binary_prob_success.augbin_2t_1a_fit}
\title{Calculate the binary probability of success.}
\usage{
binary_prob_success(x, ...)

\method{binary_prob_success}{augbin_2t_1a_fit}(x, y1_lower = -Inf,
  y1_upper = Inf, y2_lower = -Inf, y2_upper = log(0.7),
  conf.level = 0.95, ...)
}
\arguments{
\item{x}{an R object of class \code{"augbin_fit"}}

\item{...}{arguments passed to other methods}

\item{y1_lower}{numeric, minimum threshold to constitute success,
scrutinising the log of the tumour size ratio comparing time 1 to baseline.
Defaults to negative infinity.}

\item{y1_upper}{numeric, maximum threshold to constitute success,
scrutinising the log of the tumour size ratio comparing time 1 to baseline.
Defaults to positive infinity.}

\item{y2_lower}{numeric, minimum threshold to constitute success,
scrutinising the log of the tumour size ratio comparing time 2 to baseline.}

\item{y2_upper}{numeric, maximum threshold to constitute success,
scrutinising the log of the tumour size ratio comparing time 2 to baseline.
Defaults to log(0.7).}

\item{conf.level}{confidence level for interval.}
}
\value{
a \code{data.frame}-like object
}
\description{
Calculate the binary probability of success.

Calculate the binary probability of success from an augbin_2t_1a_fit object.
}
\examples{
\dontrun{
fit <- stan_augbin_demo()
binary_prob_success(fit, y2_upper = log(0.7))
}
}
