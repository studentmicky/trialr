% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/augbin_fit.R
\name{augbin_fit}
\alias{augbin_fit}
\title{Class used by \pkg{trialr} to fit Wason & Seaman's Augmented Binary method.}
\usage{
augbin_fit(num_patients, tumour_size, non_shrinkage_failure, fit)
}
\arguments{
\item{num_patients}{Integer, the number of patients analysed.}

\item{tumour_size}{matrix-like object containing tumour size measures, with
rows representing patients and columns representing chronological
standardised assessment points. Column one is baseline.}

\item{non_shrinkage_failure}{matrix-like object containing logical indicators
of non-shrinkage failure, with rows representing patients and columns
representing chronological standardised assessment points.}

\item{fit}{An object of class \code{\link[rstan:stanfit]{stanfit}},
containing the posterior samples.}
}
\description{
Class used by \pkg{trialr} to fit Wason & Seaman's Augmented Binary method.
}
\references{
Wason JMS, Seaman SR. Using continuous data on tumour measurements to improve
inference in phase II cancer studies.
Statistics in Medicine. 2013;32(26):4639-4650. doi:10.1002/sim.5867

Eisenhauer EA, Therasse P, Bogaerts J, et al. New response evaluation
criteria in solid tumours: Revised RECIST guideline (version 1.1).
European Journal of Cancer. 2009;45(2):228-247. doi:10.1016/j.ejca.2008.10.026
}
\seealso{
\code{\link{stan_augbin}}
}
