% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VarianceFilter.R
\docType{methods}
\name{getCandidates,VarianceFilter-method}
\alias{getCandidates,VarianceFilter-method}
\alias{getCandidates-VarianceFilter}
\title{Get candidate genes using the variance filter}
\usage{
\S4method{getCandidates}{VarianceFilter}(obj, argsList)
}
\arguments{
\item{obj}{An object of class VarianceFilter}

\item{argsList}{A named list containing two fields:
\itemize{
\item{"target.gene" A designated target gene that should be part of the mtx.assay data}
\item{"var.size" A user-specified percentage (0-1) of the target gene variance to use as a filter}
}}
}
\value{
A vector containing all genes with variances less than the target gene
}
\description{
Get candidate genes using the variance filter
}
\examples{

# Using the included Alzheimer's dataset, filter out only those transcription factors with variance
# within 50\% of the variance of MEF2C
load(system.file(package="trena", "extdata/ampAD.154genes.mef2cTFs.278samples.RData"))
variance.filter <- VarianceFilter(mtx.assay = mtx.sub)

target.gene <- "MEF2C"
tfs <- getCandidates(variance.filter, argsList = list("target.gene" = target.gene, "var.size" = 0.5))
}
\seealso{
\code{\link{VarianceFilter}}

Other getCandidate Methods: \code{\link{getCandidates,FootprintFilter-method}},
  \code{\link{getCandidates}}
}
