\name{cm_combine.dummy}
\alias{cm_combine.dummy}
\title{Find Co-occurrence Between Codes}
\usage{
  cm_combine.dummy(cm.l2d.obj, combine.code,
    rm.var = "time", overlap = TRUE)
}
\arguments{
  \item{cm.l2d.obj}{An object from
  \code{\link[qdap]{cm_long2dummy}}.}

  \item{combine.code}{A list of named character vectors of
  at least two code column names to combine}

  \item{rm.var}{Name of the repeated measures column.
  Default is "time".}

  \item{overlap}{logical, integer or character of binary
  operator + integer. If \code{TRUE} finds the overlap.  If
  \code{FALSE} finds anywhere any of the codes occur.  If
  integer finds that exact combination of overlaps.  If
  character must be a logical vector c(\code{>}, \code{<},
  \code{=<}, \code{=>}, \code{==}, \code{!=}) followed by
  an integer and wrapped with quotes.}
}
\value{
  Returns a dataframe with co-occurrences of provided code
  columns.
}
\description{
  Combine code columns where they co-occur.
}
\examples{
\dontrun{
foo <- list(
    AA = qcv(terms="1:10"),
    BB = qcv(terms="1:2, 3:10, 19"),
    CC = qcv(terms="1:3, 5:6")
)

foo2  <- list(
    AA = qcv(terms="4:8"),
    BB = qcv(terms="1:4, 10:12"),
    CC = qcv(terms="1, 11, 15:20"),
    DD = qcv(terms="")
)


(x <- cm_range2long(foo))
(D1 <- cm_long2dummy(x))

(z <- cm_range2long(foo, foo2, v.name="time"))
(D2 <- cm_long2dummy(z, "time"))
cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)))
cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap="==1")
cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap="!=1")
D1 <- cm_combine.dummy(D1, combine.code = list(AB=qcv(AA, BB)), overlap=0)
D1 <- cm_combine.dummy(D1, combine.code = list(CAB=qcv(AB, CC)), overlap=FALSE)

combines <- list(AB=qcv(AA, BB), ABC=qcv(AA, BB, CC))
cm_combine.dummy(D1, combine.code = combines)
cm_combine.dummy(D2, combine.code = combines)
}
}
\seealso{
  \code{\link[qdap]{cm_long2dummy}}
}
\keyword{co-occurrence}

