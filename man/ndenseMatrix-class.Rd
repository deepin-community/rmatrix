\name{ndenseMatrix-class}
\title{Virtual Class "ndenseMatrix" of Dense Logical Matrices}
\docType{class}
%
\alias{ndenseMatrix-class}
%
\alias{&,ndenseMatrix,ddiMatrix-method}
\alias{&,ndenseMatrix,ldiMatrix-method}
\alias{*,ndenseMatrix,ddiMatrix-method}
\alias{*,ndenseMatrix,ldiMatrix-method}
\alias{Ops,ndenseMatrix,ndenseMatrix-method}
\alias{Summary,ndenseMatrix-method}
\alias{^,ndenseMatrix,ddiMatrix-method}
\alias{^,ndenseMatrix,ldiMatrix-method}
\alias{as.logical,ndenseMatrix-method}
\alias{as.numeric,ndenseMatrix-method}
\alias{as.vector,ndenseMatrix-method}
\alias{coerce,matrix,ndenseMatrix-method}
\alias{coerce,ndenseMatrix,matrix-method}
\alias{coerce,ndenseMatrix,vector-method}
\alias{coerce,numLike,ndenseMatrix-method}
\alias{which,ndenseMatrix-method}
%
\description{
  \code{ndenseMatrix} is the virtual class of all dense \bold{l}ogical
  (S4) matrices.  It extends both \code{\linkS4class{denseMatrix}}
  and \code{\linkS4class{lMatrix}} directly.
}
\section{Slots}{
  \describe{
    \item{\code{x}:}{logical vector containing the entries of the matrix.}
    \item{\code{Dim}, \code{Dimnames}:}{see \code{\linkS4class{Matrix}}.}
  }
}
\section{Extends}{
Class \code{"nMatrix"}, directly.
Class \code{"denseMatrix"}, directly.
Class \code{"Matrix"}, by class \code{"nMatrix"}.
Class \code{"Matrix"}, by class \code{"denseMatrix"}.
}
\section{Methods}{
  \describe{
    \item{\%*\%}{\code{signature(x = "nsparseMatrix", y = "ndenseMatrix")}: ... }
    \item{\%*\%}{\code{signature(x = "ndenseMatrix", y = "nsparseMatrix")}: ... }
    \item{coerce}{\code{signature(from = "matrix", to = "ndenseMatrix")}: ... }
    \item{coerce}{\code{signature(from = "ndenseMatrix", to = "matrix")}: ... }
    \item{crossprod}{\code{signature(x = "nsparseMatrix", y = "ndenseMatrix")}: ... }
    \item{crossprod}{\code{signature(x = "ndenseMatrix", y = "nsparseMatrix")}: ... }
    \item{as.vector}{\code{signature(x = "ndenseMatrix", mode = "missing")}: ...}
    \item{diag}{\code{signature(x = "ndenseMatrix")}: extracts the
      diagonal as for all matrices, see the generic \code{\link{diag}()}.}
    \item{which}{\code{signature(x = "ndenseMatrix")}, semantically
      equivalent to \pkg{base} function \code{\link{which}(x, arr.ind)};
      for details, see the \code{\linkS4class{lMatrix}} class documentation.}
  }
}
\seealso{
 Class \code{\linkS4class{ngeMatrix}} and the other subclasses.
}
\examples{
showClass("ndenseMatrix")

as(diag(3) > 0, "ndenseMatrix")# -> "nge"
}
\keyword{classes}
