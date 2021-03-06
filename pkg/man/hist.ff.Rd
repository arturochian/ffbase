\name{hist.ff}
\alias{hist.ff}
\title{hist for ff vectors}
\usage{
\method{hist}{ff}(x, breaks = min(100, length(x)), plot = TRUE, ...)
}
\arguments{
  \item{x}{\code{ff} vector of values for which the
  histogram is desired}

  \item{breaks}{a single numer given the number of cells
  for the histogram}

  \item{plot}{logical. If \code{TRUE} (default), a
  histogram is plotted, otherwise a list of breaks and
  counts is returned}

  \item{...}{further arguments supplied to plot.}
}
\value{
histogram object
}
\description{
Currently this is a simple version of \code{\link{hist}}
functionality.
}

