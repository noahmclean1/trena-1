#----------------------------------------------------------------------------------------------------
# Unit Tests for Naive Solver
library(trena)
library(RUnit)
#----------------------------------------------------------------------------------------------------
printf <- function(...) print(noquote(sprintf(...)))
#----------------------------------------------------------------------------------------------------
# Run All Tests
runTests <- function() {
  test_NaiveSolverConstructor()
  test_ampAD.mef2c.154tfs.278samples.naive()
}
#----------------------------------------------------------------------------------------------------
# Constructor Test
test_NaiveSolverConstructor <- function() {
  printf("--- test_NaiveSolverConstructor")
  
  # Construct solver & get name
  mtx <- matrix(1:9,nrow=3)   
  rownames(mtx) <- c("gene1","gene2","gene3")    
  solver <- NaiveSolver(mtx,targetGene = "gene1",                          
                          candidateRegulators = c("gene2","gene3")) 
  
  checkEquals(class(solver)[1], "NaiveSolver")    
  checkTrue(all(c("NaiveSolver", "Solver") %in% is(solver)))
} # test_NaiveSolverConstructor
#----------------------------------------------------------------------------------------------------
# MEF2C Data Test
test_ampAD.mef2c.154tfs.278samples.naive <- function() {
  printf("--- test_ampAD.mef2c.154tfs.278samples.naive")
  
  # Load matrix and transform via arcsinh
  load(system.file(package="trena", "extdata/ampAD.154genes.mef2cTFs.278samples.RData"))
  target.gene <- "MEF2C"
  mtx.asinh <- asinh(mtx.sub)
  
  tfs <- setdiff(rownames(mtx.asinh), "MEF2C")
  naive.solver <- NaiveSolver(mtx.asinh, target.gene, tfs)
  tbl <- run(naive.solver)
  
  # Checks
  checkTrue(min(tbl$beta) > -0.3)
  checkTrue(max(tbl$beta) < 0.3)
  checkTrue(min(tbl$p.value) > 1e-14)
  checkTrue(max(tbl$p.value) < 1e-01)
} # test_ampAD.mef2c.154tfs.278samples.naive
#----------------------------------------------------------------------------------------------------
if(!interactive()) runTests()
