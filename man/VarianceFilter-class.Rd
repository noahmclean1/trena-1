% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VarianceFilter.R
\docType{class}
\name{VarianceFilter-class}
\alias{VarianceFilter-class}
\alias{.VarianceFilter}
\alias{VarianceFilter}
\alias{VarianceFilter}
\title{Create a VarianceFilter object}
\usage{
VarianceFilter(mtx.assay = matrix(), quiet = TRUE)
}
\arguments{
\item{mtx.assay}{An assay matrix of gene expression data}

\item{quiet}{A logical denoting whether or not the solver should print output}
}
\value{
A CandidateFilter class object with variance as the filtering method

An object of the VarianceFilter class
}
\description{
A VarianceFilter object allows for filtering based on the variance of a target gene in relation to
other genes in the assay matrix. Using its associated \code{getCandidates} method, a VarianceFilter
object can be used to filter a list of possible transcription factors to those within a given
range of the variance of a supplied target gene.
}
\examples{
load(system.file(package="trena", "extdata/ampAD.154genes.mef2cTFs.278samples.RData"))
variance.filter <- VarianceFilter(mtx.assay = mtx.sub)
}
\seealso{
\code{\link{getCandidates-VarianceFilter}}, \code{\link{getFilterAssayData}}

Other Filtering Objects: \code{\link{FootprintFilter}}
}
