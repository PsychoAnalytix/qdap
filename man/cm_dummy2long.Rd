\name{cm_dummy2long}
\alias{cm_dummy2long}
\title{Convert cm_combine.dummy Back to Long}
\usage{
  cm_dummy2long(cm.comb.obj, rm.var = "time")
}
\arguments{
  \item{cm.comb.obj}{An object from cm_combine.dummy}

  \item{rm.var}{Name of the repeated measures column.
  Default is \code{"time"}.}
}
\value{
  Returns a dataframe with co-occurrences of provided code
  columns.
}
\description{
  \code{cm_combine.dummy} back to long.
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
(out1 <- cm_long2dummy(x))

(z <- cm_range2long(foo, foo2, v.name="time"))
out2 <- cm_long2dummy(z, "time")
lapply(out2, head)
cm_combine.dummy(out1, combine.code = list(AB=qcv(AA, BB)))

combines <- list(AB=qcv(AA, BB), ABC=qcv(AA, BB, CC))
A <- cm_combine.dummy(D2, combine.code = combines)
head(A, 10)
B <- cm_combine.dummy(D1, combine.code = combines)
head(B, 10)

cm_dummy2long(A)
cm_dummy2long(B, "time")
}
}
\seealso{
  \code{\link[qdap]{cm_long2dummy}},
  \code{\link[qdap]{cm_combine.dummy}}
}

