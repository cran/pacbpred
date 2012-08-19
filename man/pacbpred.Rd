\name{pacbpred}
\alias{pacbpred}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{pacbpred
%%  ~~function to do ... ~~
}
\description{This package is intended to perform estimation and prediction in high-dimensional additive models, using a PAC-Bayesian point of view and a MCMC algorithm. The method is fully described in Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction in Sparse Additive Models' (see http://arxiv.org/abs/1208.1211).
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pacbpred(niter,
burnin = floor(niter * 2/3),
Xtrain,
Xtest,
Y,
K = 8,
cst = 10^6,
sigma2,
alpha = 0.1,
delta)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{niter}{Mandatory. The number of MCMC iterations.
%%     ~~Describe \code{niter} here~~
}
  \item{burnin}{Optional. How many iterations should the algorithm wait before
    computing the estimate/predictor ?
%%     ~~Describe \code{burnin} here~~
}
  \item{Xtrain}{Mandatory. The design matrix of the training sample.
%%     ~~Describe \code{Xtrain} here~~
}
  \item{Xtest}{Optional. The design matrix of the test sample.
%%     ~~Describe \code{Xtest} here~~
}
  \item{Y}{Mandatory. The vector of responses corresponding to \code{Xtrain}. \code{Y} is assumed to have the same number
    of rows as \code{Xtrain}.
%%     ~~Describe \code{Y} here~~
}
  \item{K}{Optional. The maximal order of the development on the trigonometric basis.
%%     ~~Describe \code{K} here~~
}
  \item{cst}{Optional. A numerical constant bounding from above the sup norm of true
    regression function.
%%     ~~Describe \code{cst} here~~
}
  \item{sigma2}{Optional. The variance of the proposal density along the algorithm.
%%     ~~Describe \code{sigma2} here~~
}
  \item{alpha}{Optional. The penalization term over the complexity of a model.
%%     ~~Describe \code{alpha} here~~
}
  \item{delta}{Optional. The inverse temperature parameter.
%%     ~~Describe \code{saveModels} here~~
}
}
\details{
  See Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction
  in Sparse Additive Models' (arXiv preprint \url{http://arxiv.org/abs/1208.1211}
)
%%  ~~ If necessary, more details than the description above ~~
}
\value{A list composed of the following items.
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{predict}{If \code{Xtest} is provided, the predicted values of the
   corresponding responses.}
 \item{estimates}{The vector of estimates over the trigonometric basis.}
 \item{ratio.mcmc}{A vector of the MCMC ratio for each iteration.}
 \item{accept}{A logical vector whose length is the number of
   iterations. For each iteration, has the proposed move been accepted
 ?}
\item{models.mcmc}{The current models all along the MCMC chain.}
%% ...
}
\references{
  \url{http://www.lsta.upmc.fr/doct/guedj/index.html}
  
  Guedj and Alquier (2012), 'PAC-Bayesian Estimation and Prediction
  in Sparse Additive Models' (arXiv preprint: \url{http://arxiv.org/abs/1208.1211
})
}
\author{Benjamin Guedj
%%  ~~who you are~~
}
\note{
  This is an early stage development. Use at your own risk !
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
pacbpred-package
%% ~~objects to See Also as \code{\link{help}}, ~~~
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ prediction }

