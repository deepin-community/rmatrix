\name{nMatrix-class}
\title{Class "nMatrix" of Non-zero Pattern Matrices}
\docType{class}
%
\alias{nMatrix-class}
%
\alias{Arith,logical,nMatrix-method}
\alias{Arith,nMatrix,logical-method}
\alias{Arith,nMatrix,numeric-method}
\alias{Arith,numeric,nMatrix-method}
\alias{Compare,logical,nMatrix-method}
\alias{Compare,nMatrix,logical-method}
\alias{Compare,nMatrix,nMatrix-method}
\alias{Compare,nMatrix,numeric-method}
\alias{Compare,numeric,nMatrix-method}
\alias{Logic,logical,nMatrix-method}
\alias{Logic,nMatrix,Matrix-method}
\alias{Logic,nMatrix,logical-method}
\alias{Logic,nMatrix,nMatrix-method}
\alias{Logic,nMatrix,numeric-method}
\alias{Logic,nMatrix,sparseVector-method}
\alias{Logic,numeric,nMatrix-method}
\alias{Ops,nMatrix,dMatrix-method}
\alias{Ops,nMatrix,lMatrix-method}
\alias{Ops,nMatrix,nMatrix-method}
\alias{Ops,nMatrix,numeric-method}
\alias{Ops,numeric,nMatrix-method}
\alias{Summary,nMatrix-method}
\alias{coerce,matrix,nMatrix-method}
\alias{coerce,numLike,nMatrix-method}
%
\description{
  The \code{nMatrix} class is the virtual \dQuote{mother} class of all
  \emph{\bold{n}on-zero pattern} (or simply \emph{patter\bold{n}})
  matrices in the \pkg{Matrix} package.
}
%\section{Objects from the Class}{A virtual Class: No objects may be
%  created from it.
%}
\section{Slots}{
  Common to \emph{all} matrix object in the package:
  \describe{
    \item{\code{Dim}:}{Object of class \code{"integer"} - the dimensions
     of the matrix - must be an integer vector with exactly two
     non-negative values.}
    \item{\code{Dimnames}:}{list of length two; each component
      containing NULL or a \code{\link{character}} vector length
      equal the corresponding \code{Dim} element.}
  }
}
\section{Methods}{
  There is a bunch of coercion methods (for \code{\link{as}(..)}), e.g.,
  \describe{
    \item{coerce}{\code{signature(from = "matrix", to = "nMatrix")}:
      Note that these coercions (must) coerce \code{\link{NA}}s to
      non-zero, hence conceptually \code{TRUE}.
      This is particularly important when
      \code{\linkS4class{sparseMatrix}} objects are coerced to
      \code{"nMatrix"} and hence to \code{\linkS4class{nsparseMatrix}}.
    }
    \item{coerce}{\code{signature(from = "dMatrix", to = "nMatrix")}, and}
    \item{coerce}{\code{signature(from = "lMatrix", to = "nMatrix")}:
      For dense matrices with \code{\link{NA}}s, these
      coercions are valid since \pkg{Matrix} version 1.2.0 (still with
      a \code{\link{warning}} or a \code{\link{message}} if
      \code{"Matrix.warn"}, or \code{"Matrix.verbose"}
      \code{\link{options}} are set.)}

    \item{coerce}{\code{signature(from = "nMatrix", to = "matrix")}: ... }
    \item{coerce}{\code{signature(from = "nMatrix", to = "dMatrix")}: ... }
    \item{coerce}{\code{signature(from = "nMatrix", to = "lMatrix")}: ... }
  }

  --- --- ---

  Additional methods contain group methods, such as
  \describe{
    \item{Ops}{\code{signature(e1 = "nMatrix", e2 = "....")}, \dots}
    \item{Arith}{\code{signature(e1 = "nMatrix", e2 = "....")}, \dots}
    \item{Compare}{\code{signature(e1 = "nMatrix", e2 = "....")}, \dots}
    \item{Logic}{\code{signature(e1 = "nMatrix", e2 = "....")}, \dots}

    \item{Summary}{\code{signature(x = "nMatrix", "....")}, \dots}
  }
}
\seealso{
  The classes \code{\linkS4class{lMatrix}},
  \code{\linkS4class{nsparseMatrix}}, and the mother class,
  \code{\linkS4class{Matrix}}.
}
\examples{
getClass("nMatrix")

L3 <- Matrix(upper.tri(diag(3)))
L3 # an "ltCMatrix"
as(L3, "nMatrix") # -> ntC*

## similar, not using Matrix()
as(upper.tri(diag(3)), "nMatrix")# currently "ngTMatrix"
}
\keyword{classes}
\keyword{algebra}
