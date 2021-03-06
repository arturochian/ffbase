\name{droplevels.ffdf}
\alias{droplevels.ffdf}
\title{The function \code{droplevels} is used to drop unused levels from factors
in a \code{\link{ffdf}}}
\usage{
\method{droplevels}{ffdf}(x, except = NULL, ..., inplace = FALSE)
}
\arguments{
  \item{x}{\code{ffdf} object}

  \item{except}{specify which columns will be excluded from
  dropping levels}

  \item{...}{further arguments passed to
  \code{\link{droplevels.ff}}}

  \item{inplace}{if \code{TRUE} the columns will be
  physically changed, otherwise (default) new \code{ff}
  vectors will be created}
}
\value{
\code{ffdf} object where levels of factors are dropped
}
\description{
The function \code{droplevels} is used to drop unused
levels from factors in a \code{\link{ffdf}}
}
\seealso{
\code{\link{droplevels}} \code{\link{droplevels.ff}}
}

