% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dose_finding_fit.R
\docType{class}
\name{dose_finding_fit-class}
\alias{dose_finding_fit-class}
\alias{dose_finding_fit}
\title{Class of dose-finding model fit by \pkg{trialr} using Stan.}
\usage{
dose_finding_fit(dose_indices, num_patients, doses, tox, prob_tox,
  median_prob_tox, recommended_dose, dat, fit)
}
\arguments{
\item{dose_indices}{A vector of integers representing the dose-levels under
consideration.}

\item{num_patients}{Integer, the number of patients analysed.}

\item{doses}{vector of integers representing the dose given to the patients.}

\item{tox}{vector of integers representing the toxicity status of the
patients.}

\item{prob_tox}{The posterior mean probabilities of toxicity at doses 1:n;
a vector of numbers between 0 and 1.}

\item{median_prob_tox}{The posterior median probabilities of toxicity at
doses 1:n; a vector of numbers between 0 and 1.}

\item{recommended_dose}{An integer representing the dose-level that is
recommended for the next patient or cohort.}

\item{dat}{Object \code{\link{crm_params}} containing data passed to
\code{\link[rstan:sampling]{sampling}}.}

\item{fit}{An object of class \code{\link[rstan:stanfit]{stanfit}},
containing the posterior samples.}
}
\description{
Class of dose-finding model fit by \pkg{trialr} using Stan.
}
\seealso{
\code{\link{crm_fit}},
\code{\link{efftox_fit}}
}
