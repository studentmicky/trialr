% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crm_path_analysis.R
\name{crm_path_analysis}
\alias{crm_path_analysis}
\title{Fit a CRM model to the incrementally observed outcomes on a trial pathway.}
\usage{
crm_path_analysis(outcome_str, skeleton, target, model, verbose = FALSE,
  ...)
}
\arguments{
\item{outcome_str}{A string representing the outcomes observed hitherto.
See \code{\link{df_parse_outcomes}} for a description of syntax and
examples. Alternatively, you may provide \code{doses_given} and \code{tox}
parameters. See Details.}

\item{skeleton}{a vector of the prior guesses of toxicity at doses.
This should be a monotonically-increasing vector of numbers between 0 and 1.}

\item{target}{the target toxicity probability, a number between 0 and 1.
This value would normally be one of the values in \code{skeleton}, but that
is not a requirement.}

\item{model}{Character string to denote desired model. One of \code{empiric},
\code{logistic}, \code{logistic_gamma}, or \code{logistic2}.
The choice of model determines which extra parameters are required by
\code{...}. See Details.}

\item{verbose}{logical, TRUE to get log messages.}

\item{...}{Extra parameters passed to \code{\link{stan_crm}}.}
}
\value{
A \code{\link{list}} of \code{\link{dose_finding_path_node}} objects.
}
\description{
Fit a continuous reassessment method (CRM) model to the outcomes cumulatively
observed at the end of each cohort in a trial pathway. E.g. if the trial
pathway is 1NN 2NN 3NT, we have three cohorts of two patients. This function
will fit the model to the following four states: before any patients have
been evaluated; after 1NN; after 1NN 2NN; and finally after 1NN 2NN 3NT.
This allows us to analyse how the trial model is evolving in its estimation
as trial data is accumulated.
}
\details{
Different model choices require that different parameters are provided.
See below.
}
\section{Parameter requirements of \code{empiric} model}{

\itemize{
  \item \code{beta_sd}
}
}

\section{Parameter requirements of \code{logistic} model}{

\itemize{
  \item \code{a0}
  \item \code{beta_mean}
  \item \code{beta_sd}
}
}

\section{Parameter requirements of \code{logistic_gamma} model}{

\itemize{
  \item \code{a0}
  \item \code{beta_shape}
  \item \code{beta_inverse_scale}
}
}

\section{Parameter requirements of \code{logistic2} model}{

\itemize{
  \item \code{alpha_mean}
  \item \code{alpha_sd}
  \item \code{beta_mean}
  \item \code{beta_sd}
}
}

\examples{
\dontrun{
# CRM example
target <- 0.25
skeleton <- c(0.05, 0.15, 0.25, 0.4, 0.6)
paths <- crm_path_analysis(
  outcome_str = '1NNN 2NTN 2NNN',
  skeleton = skeleton, target = target, model = 'empiric',
  beta_sd = 1, seed = 123, refresh = 0)
length(paths)  # 4
names(paths)[1]  # ""
names(paths)[2]  # "1NNN"
names(paths)[3]  # "1NNN 2NTN"
names(paths)[4]  # "1NNN 2NTN 2NNN"
# Each node is an analysis fit to the cumulative outcomes
# Converting to a tibble opens up some nice opportunities
df <- as_tibble(paths)
df
# E.g. how did our view on the risk of toxicity at dose 2 evolve?
library(tidyr)
library(purrr)
library(dplyr)
df \%>\%
  mutate(prob_tox = fit \%>\% map('prob_tox')) \%>\%
  select(outcomes, dose_index, prob_tox) \%>\%
  unnest \%>\%
  filter(dose_index == 2)
}
}
\seealso{
\code{\link{df_parse_outcomes}},
  \code{\link{stan_crm}},
  \code{\link{dose_finding_path_node}}
}
\author{
Kristian Brock
}
