\name{MatrixFactorization-class}
\title{Class "MatrixFactorization" of Matrix Factorizations}
\docType{class}
%
\alias{MatrixFactorization-class}
\alias{CholeskyFactorization-class}
%
\alias{determinant,MatrixFactorization,missing-method}
\alias{dim,MatrixFactorization-method}
\alias{show,MatrixFactorization-method}
%
\description{
  The class \code{"MatrixFactorization"} is the virtual (super) class of
  (potentially) all matrix factorizations of matrices from package
  \pkg{Matrix}.

  The class \code{"CholeskyFactorization"} is the virtual class of all
  Cholesky decompositions from \pkg{Matrix} (and trivial sub class of
  \code{"MatrixFactorization"}).
}
\section{Objects from the Class}{A virtual Class: No objects may be
  created from it.}
\section{Slots}{
  \describe{
    \item{\code{Dim}:}{Object of class \code{"integer"} - the dimensions
      of the original matrix - must be an integer vector with exactly two
      non-negative values.}
  }
}
\section{Methods}{
  \describe{
    \item{dim}{\code{(x)} simply returns \code{x@Dim}, see above.}
    \item{expand}{\code{signature(x = "MatrixFactorization")}: this has
      not been implemented yet for all matrix factorizations. It should
      return a list whose components are matrices which when multiplied
      return the original \code{\linkS4class{Matrix}} object.}
    \item{show}{\code{signature(object = "MatrixFactorization")}: simple
      printing, see \code{\link{show}}.}
    \item{solve}{\code{signature(a = "MatrixFactorization", b= .)}: solve
      \eqn{A x = b} for \eqn{x}; see \code{\link{solve-methods}}.}
  }
}
\seealso{
  classes inheriting from \code{"MatrixFactorization"}, such as
  \code{\linkS4class{LU}},
  \code{\linkS4class{Cholesky}},
  \code{\linkS4class{CHMfactor}}, and
  \code{\linkS4class{sparseQR}}.
}
\examples{
showClass("MatrixFactorization")
getClass("CholeskyFactorization")
}
\keyword{classes}
