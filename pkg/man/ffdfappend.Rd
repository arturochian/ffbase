\name{ffdfappend}
\alias{ffdfappend}
\title{Append a dataframe or an \code{ffdf} to another \code{ffdf}}
\usage{
ffdfappend(x, dat, recode = TRUE, adjustvmode = TRUE, ...)
}
\arguments{
  \item{x}{\code{ffdf} object where data will be appended
  to. If \code{x==NULL} a new \code{ffdf} object will be
  created}

  \item{dat}{\code{ffdf} object or \code{data.frame}
  object}

  \item{recode}{should factors be recoded (default), or not
  (faster)}

  \item{adjustvmode}{logical, indicating to coerce the
  columns of \code{x} to a higher \code{vmode} to make sure
  \code{y} is appended without loss of information.}

  \item{...}{Further arguments passed to
  \code{\link{as.ffdf}}, when \code{x==NULL}}
}
\value{
\code{ffdf} object with same physical storage as \code{x}
unless the corresponding column of \code{y} has a higher
\code{vmode} in which case the data will be cloned to the
higher \code{vmode}
}
\description{
Appends a dataframe or an \code{ffdf} called \code{dat} to
an existing \code{ffdf} called \code{x}. Please note that
the data of \code{x} will be coerced to the type of
\code{y} if the corresponding column of \code{y} has a
higher \code{vmode}.
}
\seealso{
\code{\link{c.ff}}
}

