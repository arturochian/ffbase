\name{ffrandom}
\alias{ffrandom}
\title{Generate \code{ff} vector with draws from distribution}
\usage{
ffrandom(n, rfun = runif, ..., vmode = NULL)
}
\arguments{
  \item{n}{number of observations}

  \item{rfun}{a function generating the draws from the
  random distribution.  This function should expect the
  number of draws as its first argument.  Valid examples
  are the routines \code{\link{runif}},
  \code{\link{rnorm}}, and \code{\link{rlnorm}}.}

  \item{...}{additional arguments are passed on to
  \code{rfun}.}

  \item{vmode}{the vmode of the resulting vector. See
  \code{\link{ff}}. If none given the vmode is determined
  from a single draw from \code{rfun}.}
}
\value{
An \code{ff} vector with draws from the distribution.
}
\description{
A convenience function to generate \code{ff} vectors with
draws from random distributions using functions such as
\code{\link{runif}}, \code{\link{rnorm}} and
\code{\link{rlnorm}}.
}
\details{
Before generating the vector a single draw is taken from
the distribution. This might be important if one tries to
reproduce draws directly from \code{rfun}.
}
\examples{

n <- ffrandom(1E3, rnorm, mean = 10, sd = 5)

set.seed(123)
runif(1)
a <- runif(10)
set.seed(123)
b <- ffrandom(10, runif)
identical(a, b[])

}

