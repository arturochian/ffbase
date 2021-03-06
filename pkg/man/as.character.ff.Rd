\name{as.character.ff}
\alias{as.character.ff}
\title{Character Vectors

The generic function \code{as.character} converts \code{ff} vectors to characters.\cr}
\usage{
\method{as.character}{ff}(x, ...)
}
\arguments{
  \item{x}{a \code{ff} vector}

  \item{...}{other parameters passed on to chunk}
}
\value{
A factor \code{ff} vector of the same length of x.
}
\description{
Character Vectors

The generic function \code{as.character} converts \code{ff}
vectors to characters.\cr
}
\examples{
as.character(ff(c(NA, 1:100)))
as.character(ff(seq.Date(Sys.Date(), Sys.Date()+100, by = "day")))
as.character(ff(c(Sys.time())))


}
\seealso{
\code{\link[base]{as.character}}
}

