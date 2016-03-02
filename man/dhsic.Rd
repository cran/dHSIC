\name{dhsic}
\alias{dhsic}

\title{d-variable Hilbert Schmidt independence criterion - dHSIC}

\description{
  The d-variable Hilbert Schmidt independence criterion (dHSIC) is
  a non-parametric measure of dependence between an arbitrary number of
  variables. In the large sample limit the value of dHSIC is 0 if the
  variables are jointly independent and positive if there is a
  dependence. It is therefore able to detect any type of dependence
  given a sufficient amount of data.
}
\usage{
dhsic(X, Y, kernel = "gaussian")
}
\arguments{
  \item{X}{
    either a list of at least two numeric matrices or a single numeric
    matrix. The rows of a matrix correspond to the observations of a
    variable. It is always required that there are an equal number of
    observations for all variables (i.e. all matrices have to have the
    same number of rows). If \code{X} is a single numeric matrix than
    one has to specify the second variable as \code{Y}.
  }
  \item{Y}{
    a numeric matrix if \code{X} is also a numeric
    matrix and omitted if \code{X} is a list.
  }
  \item{kernel}{
    a vector of character strings specifying the kernels for each
    variable. There exist two pre-defined kernels: "gaussian" (Gaussian kernel
    with median heuristic as bandwidth) and "discrete" (discrete
    kernel). User defined kernels can also be used by passing the
    function name as a string, which will then be matched using
    \code{\link[base]{match.fun}}. If the length of \code{kernel} is
    smaller than the number of variables the kernel specified in
    \code{kernel[1]} will be used for all variables.
  }
}
\details{
  The d-variable Hilbert Schmidt independence criterion is a direct
  extension of the standard Hilbert Schmidt independence criterion
  (HSIC) from two variables to an arbitrary number of
  variables. It is 0 if and only if all the variables are jointly
  independent. This function computes an estimator of dHSIC, which
  converges to the actual dHSIC in the large sample limit. It is
  therefore possible to detect any type of dependence in the large
  sample limit.
  
  For more details see the references.
}
\value{
A list containing the following components:
\item{dHSIC}{the value of the empirical estimator of dHSIC}
\item{time}{numeric vector containing computation times. \code{time[1]}
  is time to compute Gram matrix and \code{time[2]} is time to compute
  dHSIC.}
}
\references{
  Gretton, A., K. Fukumizu, C. H. Teo, L. Song, B. Sch{\"o}lkopf and
  A. J. Smola (2007). A kernel statistical test of independence. In
  Advances in Neural Information Processing Systems (pp. 585-592).
  
  Pfister, N., P. B{\"u}hlmann, B. Sch{\"o}lkopf and J. Peters (2016).
  Kernel-based Tests for Joint Independence. ArXiv e-prints
  (1603.00285).
}
\author{
Niklas Pfister and Jonas Peters
}


\seealso{
  \code{\link{dhsic.test}}
}

\examples{
### Two different input methods
set.seed(0)
x <- matrix(rnorm(200),ncol=2)
y <- matrix(rbinom(100,30,0.1),ncol=1)
dhsic(list(x,y),kernel=c("gaussian","discrete"))$dHSIC
dhsic(x,y,kernel=c("gaussian","discrete"))$dHSIC

### Using a user-defined kernel (here: sigmoid kernel)
set.seed(0)
x <- matrix(rnorm(500),ncol=1)
y <- x^2+0.02*matrix(rnorm(500),ncol=1)
sigmoid <- function(x_1,x_2){
  return(tanh(sum(x_1*x_2)))
}
dhsic(x,y,kernel="sigmoid")$dHSIC

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{nonparametric}