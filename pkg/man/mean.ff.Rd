\name{mean.ff}
\alias{mean.ff}
\title{Mean of ff vector}
\usage{
\method{mean}{ff}(x, trim = 0, ..., range = NULL)
}
\arguments{
  \item{x}{a ff vector}

  \item{trim}{percentage of robustness, between 0 and 1}

  \item{...}{other arguments passed to \code{mean}}

  \item{range}{a \code{ri} or an \code{integer} vector of
  \code{length==2} giving a range restriction for chunked
  processing}
}
\value{
mean value
}
\description{
Mean of ff vector
}
\examples{
# create a vector of length 10 million
x <- ff(vmode="double", length=1e7)

mean(x)
}

