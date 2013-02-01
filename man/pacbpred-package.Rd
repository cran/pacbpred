\name{pacbpred-package}
\alias{pacbpred-package}
%% \alias{pacbpred}
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
Version: \tab 0.92.1\cr
Date: \tab 2013-02-01\cr
License: \tab GPL (>= 2)\cr
}
}
\author{
Benjamin Guedj

Maintainer: Benjamin Guedj <benjamin.guedj@upmc.fr>
}
\references{
  \url{http://www.lsta.upmc.fr/doct/guedj/index.html}
  
  Guedj and Alquier (2013), 'PAC-Bayesian Estimation and Prediction
  in Sparse Additive Models'. Electronic Journal of Statistics, 7,
  264--291. DOI:10.1214/13-EJS771.
  Available on \url{http://projecteuclid.org/DPubS?service=UI&version=1.0&verb=Display&handle=euclid.ejs/1359041592}.
}
\keyword{ package }
\seealso{
\code{pacbpred}
}
\examples{
ndata <- 100
ntrain <- 80
ntest <- ndata - ntrain
p <- 10
Y <- numeric(ndata)
X <- matrix(nr = ndata, nc = p, data = 2*runif(n = ndata*p) - 1)
for(i in 1:ndata)
  {
    Y[i] <- X[i,1]^3+sin(pi*X[i,2])
  }

Xtrain <- X[1:ntrain,]
Xtest <- X[(ntrain+1):ndata,]
Ytrain <- Y[1:ntrain]
Ytest <- Y[(ntrain+1):ndata]

niter <- 100
cst <- Inf
alpha <- .1
sigma2 <- .1
delta <- ntrain/2

res <- pacbpred(niter = niter, Xtrain = Xtrain, Xtest = Xtest, Y =
Ytrain, cst = cst,
sigma2 = sigma2, delta = delta, alpha = alpha)

print(cbind(res$predict,Ytest))

}
