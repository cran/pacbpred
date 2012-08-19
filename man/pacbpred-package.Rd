\name{pacbpred-package}
\alias{pacbpred-package}
% \alias{pacbpred}
\docType{package}
\title{
PAC-Bayesian Estimation and Prediction in Sparse Additive Models
}
\description{
This package is intended to perform estimation and prediction in high-dimensional additive models, using a PAC-Bayesian point of view and a MCMC algorithm.
}
\details{
\tabular{ll}{
Package: \tab pacbpred\cr
Type: \tab Package\cr
Version: \tab 0.9\cr
Date: \tab 2012-08-19\cr
License: \tab GPL\cr
}
}
\author{
Benjamin Guedj

Maintainer: Benjamin Guedj <benjamin.guedj@upmc.fr>
}
\references{
Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction in
Sparse Additive Models' (arXiv preprint: \url{http://arxiv.org/abs/1208.1211}
}
\keyword{ package }
\seealso{\code{pacbpred}
}
\examples{
n <- 200
p <- 10
ntest <- 20
Xtest <- matrix(nr = ntest, nc = p, data = 0)
X <- matrix(nr = n, nc = p, data = 0)
Y <- numeric(n)
for(j in 1:p)
  {
    X[, j] <- (2*runif(n = n) - 1)
    Xtest[, j] <- (2*runif(n = ntest) - 1)
  }
for(i in 1:n)
  {
      Y[i] <- 2*X[i,1]-X[i,3]^3+rnorm(n=1,sd=.1)
  }
Y <- Y - mean(Y)
niter <- 100
res <- pacbpred(niter = niter, Xtrain = X, Xtest = Xtest, Y = Y)
print(res$predict)
}
