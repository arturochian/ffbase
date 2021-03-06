\name{duplicated.ff}
\alias{duplicated.ff}
\alias{duplicated.ffdf}
\title{Duplicated for ff and ffdf objects}
\usage{
\method{duplicated}{ff}(x, incomparables = FALSE, fromLast = FALSE,
  trace = FALSE, ...)

\method{duplicated}{ffdf}(x, incomparables = FALSE, fromLast = FALSE,
  trace = FALSE, ...)
}
\arguments{
  \item{x}{\code{ff} object or \code{ffdf} object}

  \item{incomparables}{a vector of values that cannot be
  compared.  FALSE is a special value, meaning that all
  values can be compared, and may be the only value
  accepted for methods other than the default.  It will be
  coerced internally to the same type as x.}

  \item{fromLast}{logical indicating if duplication should
  be considered from the last, i.e., the last (or
  rightmost) of identical elements will be kept}

  \item{trace}{logical indicating to show on which chunk
  the function is computing}

  \item{...}{other parameters passed on to chunk}
}
\value{
A logical ff vector of length \code{nrow(x)} or
\code{length(x)} indicating if each row or element is
duplicated.
}
\description{
Duplicated for ff and ffdf objects similar as in
\code{\link[base]{duplicated}}.\cr Remark that this
duplicated function is slightly different from the
duplicated method in the base package as it first orders
the ffdf or ff_vector object and then applies duplicated.
This means you need to order the ffdf or ff_vector in case
you want to have the exact same result as the result of the
base package. See the example.
}
\examples{
## duplicated.ffdf - mark that you need to order according to the records you 
## like in order to have similar results as the base unique method 
data(iris)
irisdouble <- rbind(iris, iris)
irisdouble <- irisdouble[ sample(x=1:nrow(irisdouble), size=nrow(irisdouble)
                        , replace = FALSE), ]
ffiris <- as.ffdf(irisdouble)
duplicated(ffiris, by=10, trace=TRUE)
duplicated(ffiris$Sepal.Length, by=10, trace=TRUE)
table(duplicated(irisdouble), duplicated(ffiris, by=10)[])
irisdouble <- irisdouble[order(apply( irisdouble
                                    , FUN=function(x) paste(x, collapse=".")
                                    , MARGIN=1
                                    )), ]
ffiris <- as.ffdf(irisdouble)
table(duplicated(irisdouble), duplicated(ffiris, by=10)[])
table(duplicated(ffiris$Sepal.Width, by=10)[], duplicated(ffiris$Sepal.Width[]))

measures <- c("Sepal.Width","Species")
irisdouble <- irisdouble[order(apply( irisdouble[, measures]
                                    , FUN=function(x) paste(x, collapse=".")
                                    , MARGIN=1)), ]
ffiris <- as.ffdf(irisdouble)
table(duplicated(irisdouble[, measures]), duplicated(ffiris[measures], by=10)[])
table(duplicated(ffiris$Sepal.Width, by=10)[], duplicated(ffiris$Sepal.Width[]))
}
\seealso{
\code{\link[base]{duplicated}, \link[ff]{ffdforder},
\link[ff]{fforder}}
}

