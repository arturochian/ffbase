\name{ffdfdply}
\alias{ffdfdply}
\title{Performs a split-apply-combine on an ffdf}
\usage{
ffdfdply(x, split, FUN, BATCHBYTES = getOption("ffbatchbytes"),
  RECORDBYTES = sum(.rambytes[vmode(x)]), trace = TRUE, ...)
}
\arguments{
  \item{x}{an ffdf}

  \item{split}{an ff vector which is part of the ffdf x}

  \item{FUN}{the function to apply to each split. This
  function needs to return a data.frame}

  \item{BATCHBYTES}{integer scalar limiting the number of
  bytes to be processed in one chunk}

  \item{RECORDBYTES}{optional integer scalar representing
  the bytes needed to process one row of x}

  \item{trace}{logical indicating to show on which split
  the function is computing}

  \item{...}{other parameters passed on to FUN}
}
\value{
an ffdf
}
\description{
Performs a split-apply-combine on an ffdf. Splits the x
ffdf according to split and applies FUN to the data, stores
the result of the FUN in an ffdf.\cr Remark that this
function does not actually split the data. In order to
reduce the number of times data is put into RAM for
situations with a lot of split levels, the function
extracts groups of split elements which can be put into RAM
according to BATCHBYTES. Please make sure your FUN covers
the fact that several split elements can be in one chunk of
data on which FUN is applied.\cr Mark also that NA's in the
split are not considered as a split on which the FUN will
be applied.
}
\examples{
data(iris)
ffiris <- as.ffdf(iris)

youraggregatorFUN <- function(x){
	dup <- duplicated(x[c("Species", "Petal.Width")])
  o <- order(x$Petal.Width)
  lowest_pw <- x[rev(o),][!dup,]
  highest_pw <- x[o,][!dup,]
  lowest_pw$group <- factor("lowest", levels=c("lowest", "highest"))
  highest_pw$group <- factor("highest", levels=c("lowest", "highest"))
	rbind(lowest_pw, highest_pw)
}
result <- ffdfdply( x = ffiris, split = ffiris$Species,
                   FUN = function(x) youraggregatorFUN(x),
                   BATCHBYTES = 5000, trace=TRUE)
dim(result)
dim(iris)
result[1:10,]

ffiris$integerkey <- with(ffiris, as.integer(Sepal.Length))
result <- ffdfdply( x = ffiris, split = ffiris$integerkey
                  , FUN = function(x) youraggregatorFUN(x), BATCHBYTES = 5000
                  , trace=TRUE
                  )

ffiris$datekey <- ff( as.Date(ffiris$Sepal.Length[], origin = "1970-01-01"),
                      vmode = "integer")
result <- ffdfdply( x = ffiris, split = ffiris$datekey 
                  , FUN = function(x) youraggregatorFUN(x)
                  , BATCHBYTES = 5000, trace=TRUE
                  )
}
\seealso{
\code{\link{grouprunningcumsum}, \link{table}}
}

