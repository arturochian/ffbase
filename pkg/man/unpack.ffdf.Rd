\name{unpack.ffdf}
\alias{unpack.ffdf}
\title{Unpacks previously stored ffdf data.frame into a directory}
\usage{
unpack.ffdf(file, dir = NULL, envir = parent.frame())
}
\arguments{
  \item{file}{packaged file, zipped or tar.gz.}

  \item{dir}{path where the data will be saved and all
  columns of supplied \code{ffdf}'s. It will be created if
  it doesn't exist.}

  \item{envir}{the environment where the stored variables
  should be loaded into.}
}
\description{
\code{unpack.ffdf} restores ffdf data.frames into the given
\code{dir}, that were stored using \code{\link{pack.ffdf}}.
If \code{dir} is \code{NULL} (the default) the data.frames
will restored in a temporary directory. if
}
\examples{
iris.ffdf <- as.ffdf(iris)

td <- tempfile()

# save the ffdf into the supplied directory
save.ffdf(iris.ffdf, dir=td)

# what in the directory?
dir(td)

#remove the ffdf from memory
rm("iris.ffdf")

# and reload the stored ffdf
load.ffdf(dir=td)

tf <- paste(tempfile(), ".zip", sep="")
packed <- pack.ffdf(file=tf, iris.ffdf)

#remove the ffdf from memory
rm("iris.ffdf")

# restore the ffdf from the packed ffdf
unpack.ffdf(tf)
}
\seealso{
\code{\link{load.ffdf}} \code{\link{pack.ffdf}}
}

