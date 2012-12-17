\name{pacbpred}
\alias{pacbpred}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  pacbpred
}
\description{
  This package is intended to perform estimation and prediction in high-dimensional additive models, using a PAC-Bayesian point of view and a MCMC algorithm. The method is fully described in Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction in Sparse Additive Models' (see \url{http://arxiv.org/abs/1208.1211}).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pacbpred(niter, burnin = floor(niter * 2/3), Xtrain, Xtest, Y, K = 8,
cst,
sigma2, alpha = 0.1, delta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{niter}{
    Mandatory. The number of MCMC iterations.
%%     ~~Describe \code{niter} here~~
}
\item{burnin}{
  Optional. How many iterations should be discarded in the beginning of
  the chain?
%%     ~~Describe \code{burnin} here~~
}
\item{Xtrain}{
  Mandatory. The design matrix of the training sample.
%%     ~~Describe \code{Xtrain} here~~
}
\item{Xtest}{
  Optional. The design matrix of the test sample.
%%     ~~Describe \code{Xtest} here~~
}
\item{Y}{
  Mandatory. The vector of responses corresponding to \code{Xtrain}. \code{Y} is assumed to have the same number
    of rows as \code{Xtrain}.
%%     ~~Describe \code{Y} here~~
}
\item{K}{
  Optional. The maximal order of the development on the trigonometric basis.
%%     ~~Describe \code{K} here~~
}
\item{cst}{
  Optional. A numerical constant bounding from above the sup norm of true
    regression function.
%%     ~~Describe \code{cst} here~~
}
\item{sigma2}{
  Optional. The variance of the proposal density along the algorithm.
%%     ~~Describe \code{sigma2} here~~
}
\item{alpha}{
  Optional. The penalization term over the complexity of a model.
%%     ~~Describe \code{alpha} here~~
}
\item{delta}{
  Optional. The inverse temperature parameter.
%%     ~~Describe \code{delta} here~~
}
}
\details{
  See Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction
  in Sparse Additive Models' (arXiv preprint \url{http://arxiv.org/abs/1208.1211}
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  A list composed of the following items.
  \item{predict}{If \code{Xtest} is provided, the predicted values of the
   corresponding responses.}
 \item{estimates}{The vector of estimates over the trigonometric basis.}
 \item{ratio.mcmc}{A vector of the MCMC ratio for each iteration.}
 \item{accept}{A logical vector whose length is the number of
   iterations. For each iteration, has the proposed move been accepted
 ?}
\item{models.mcmc}{The current models all along the MCMC chain.}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
  \url{http://www.lsta.upmc.fr/doct/guedj/index.html}
  
  Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction
  in Sparse Additive Models' (arXiv preprint: \url{http://arxiv.org/abs/1208.1211})
%% ~put references to the literature/web site here ~
}
\author{Benjamin Guedj
%%  ~~who you are~~
}
\note{This is still an early stage development. Use at your own risk !
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  pacbpred-package
%% ~~objects to See Also as \code{\link{help}}, ~~~
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ nonlinear }
\keyword{ prediction }% __ONLY ONE__ keyword per line
