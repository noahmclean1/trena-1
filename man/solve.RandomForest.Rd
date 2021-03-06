% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RandomForestSolver.R
\docType{methods}
\name{run,RandomForestSolver-method}
\alias{run,RandomForestSolver-method}
\alias{run.RandomForestSolver}
\alias{solve.RandomForest}
\title{Run the Random Forest Solver}
\usage{
\S4method{run}{RandomForestSolver}(obj)
}
\arguments{
\item{obj}{An object of class TReNA with "randomForest" as the solver string}

\item{targetGene}{A designated target gene that should be part of the mtx.assay data}

\item{candidateRegulators}{The designated set of transcription factors that could be associated with the target gene.}

\item{tf.weights}{A set of weights on the transcription factors (default = rep(1, length(candidateRegulators)))}

\item{extraArgs}{Modifiers to the Random Forest solver}
}
\value{
A list containing various parameters of the Random Forest fit.
}
\description{
Given a TReNA object with RandomForest as the solver, use the \code{\link{randomForest}} function
to estimate coefficients for each transcription factor as a predictor of the target gene's
expression level.
This method should be called using the \code{\link{solve}} method on an appropriate TReNA object.
}
\examples{
# Load included Alzheimer's data, create a TReNA object with Random Forest as solver, and solve
load(system.file(package="trena", "extdata/ampAD.154genes.mef2cTFs.278samples.RData"))
trena <- TReNA(mtx.assay = mtx.sub, solver = "randomForest")
targetGene <- "MEF2C"
candidateRegulators <- setdiff(rownames(mtx.sub), targetGene)
tbl <- solve(trena, targetGene, candidateRegulators)
}
\seealso{
\code{\link{randomForest}}, \code{\link{RandomForestSolver}}

Other solver methods: \code{\link{run,BayesSpikeSolver-method}},
  \code{\link{run,EnsembleSolver-method}},
  \code{\link{run,LassoPVSolver-method}},
  \code{\link{run,LassoSolver-method}},
  \code{\link{run,PearsonSolver-method}},
  \code{\link{run,RidgeSolver-method}},
  \code{\link{run,SpearmanSolver-method}},
  \code{\link{run,SqrtLassoSolver-method}},
  \code{\link{solve,TReNA-method}}
}
