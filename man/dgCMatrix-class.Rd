\name{dgCMatrix-class}
\title{Compressed, sparse, column-oriented numeric matrices}
\docType{class}
%
\alias{dgCMatrix-class}
% 'Arith' not yet documented {untested} ... FIXME
\alias{Arith,dgCMatrix,dgCMatrix-method}
\alias{Arith,dgCMatrix,logical-method}
\alias{Arith,dgCMatrix,numeric-method}
\alias{Arith,logical,dgCMatrix-method}
\alias{Arith,numeric,dgCMatrix-method}
\alias{coerce,dgCMatrix,dgRMatrix-method}
\alias{coerce,dgCMatrix,dgTMatrix-method}
\alias{coerce,dgCMatrix,dgeMatrix-method}
\alias{coerce,dgCMatrix,dsCMatrix-method}
\alias{coerce,dgCMatrix,dsTMatrix-method}
\alias{coerce,dgCMatrix,dtCMatrix-method}
\alias{coerce,dgCMatrix,dtTMatrix-method}
\alias{coerce,dgCMatrix,lgCMatrix-method}
\alias{coerce,dgCMatrix,ngCMatrix-method}
\alias{coerce,matrix,dgCMatrix-method}
\alias{coerce,numLike,dgCMatrix-method}
\alias{determinant,dgCMatrix,logical-method}
%
\description{The \code{dgCMatrix} class is a class of sparse numeric
  matrices in the compressed, sparse, column-oriented format.  In this
  implementation the non-zero elements in the columns are sorted into
  increasing row order.  \code{dgCMatrix} is the
  \emph{\dQuote{standard}} class for sparse numeric matrices in the
  \pkg{Matrix} package.
}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("dgCMatrix",
    ...)}, more typically via \code{as(*, "CsparseMatrix")} or similar.
  Often however, more easily via \code{\link{Matrix}(*, sparse = TRUE)},
  or most efficiently via \code{\link{sparseMatrix}()}.
}
\section{Slots}{
  \describe{
    \item{\code{x}:}{Object of class \code{"numeric"} - the non-zero
      elements of the matrix.}
    \item{\dots}{all other slots are inherited from the superclass
      \code{"\linkS4class{CsparseMatrix}"}.
    }
  }
}
\section{Methods}{
  Matrix products (e.g., \link{crossprod-methods}), and (among other)
  \describe{
    \item{coerce}{\code{signature(from = "matrix", to = "dgCMatrix")}}
    \item{coerce}{\code{signature(from = "dgCMatrix", to = "matrix")}}
    \item{coerce}{\code{signature(from = "dgCMatrix", to = "dgTMatrix")}}
    \item{diag}{\code{signature(x = "dgCMatrix")}: returns the diagonal
      of \code{x}}
    \item{dim}{\code{signature(x = "dgCMatrix")}: returns the dimensions
      of \code{x}}
    \item{image}{\code{signature(x = "dgCMatrix")}: plots an image of
      \code{x} using the \code{\link[lattice]{levelplot}} function}
    \item{solve}{\code{signature(a = "dgCMatrix", b = "...")}:
      see \code{\link{solve-methods}}, notably the extra argument
      \code{sparse}.}
    \item{lu}{\code{signature(x = "dgCMatrix")}: computes the LU
      decomposition of a square \code{dgCMatrix} object}
  }
}
%\references{}
%\author{}
%\note{}
\seealso{
  Classes \code{\linkS4class{dsCMatrix}},
  \code{\linkS4class{dtCMatrix}}, \code{\link{lu}}
}
\examples{
(m <- Matrix(c(0,0,2:0), 3,5))
str(m)
m[,1]
\dontshow{## regression test: this must give a validity-check error:
stopifnot(inherits(try(new("dgCMatrix", i = 0:1, p = 0:2,
                           x = c(2,3), Dim = 3:4)),
          "try-error"))
}
}
\keyword{classes}
\keyword{algebra}
