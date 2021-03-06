\name{all.ff}
\alias{all.ff}
\title{Summary methods for ff objects}
\usage{
\method{all}{ff}(x, ..., na.rm = FALSE, range = NULL)
}
\arguments{
  \item{x}{a \code{ff} object}

  \item{...}{optional other (\code{ff}) objects}

  \item{na.rm}{should \code{NA} be removed?}

  \item{range}{a \code{ri} or an \code{integer} vector of
  \code{length==2} giving a range restriction for chunked
  processing}
}
\value{
\code{TRUE}, \code{FALSE} or \code{NA}
}
\description{
Summary methods for ff objects
}

