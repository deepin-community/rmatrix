\name{Cholesky}
\concept{Choleski} % alternate English spelling
\title{Cholesky Decomposition of a Sparse Matrix}
%
\alias{Cholesky}
%
\alias{Cholesky,denseMatrix-method}
\alias{Cholesky,dsCMatrix-method}
\alias{Cholesky,nsparseMatrix-method}
\alias{Cholesky,sparseMatrix-method}
%
\alias{.SuiteSparse_version}
%
\usage{
Cholesky(A, perm = TRUE, LDL = !super, super = FALSE, Imult = 0, \dots)
}
\description{
  Computes the Cholesky (aka \dQuote{Choleski}) decomposition of a
  sparse, symmetric, positive-definite matrix.  However, typically \code{\link{chol}()}
  should rather be used unless you are interested in the different kinds
  of sparse Cholesky decompositions.
}
\arguments{
  \item{A}{sparse symmetric matrix.  No missing values or IEEE special
    values are allowed.}
  \item{perm}{logical scalar indicating if a fill-reducing permutation
    should be computed and applied to the rows and columns of \code{A}.
    Default is \code{TRUE}.}% NA not available here
  \item{LDL}{logical scalar indicating if the decomposition should be
    computed as LDL' where \code{L} is a unit lower triangular matrix.
    The alternative is LL' where \code{L} is lower triangular with
    arbitrary diagonal elements.  Default is \code{TRUE}.  Setting it to
    \code{\link{NA}} leaves the choice to a CHOLMOD-internal heuristic.}
  \item{super}{logical scalar indicating if a supernodal decomposition
    should be created.  The alternative is a simplicial decomposition.
    Default is \code{FALSE}.  Setting it to \code{\link{NA}} leaves the
    choice to a CHOLMOD-internal heuristic.}
  \item{Imult}{numeric scalar which defaults to zero. The matrix that is
    decomposed is \eqn{A+m*I} where \eqn{m} is the value of \code{Imult}
    and \code{I} is the identity matrix of order \code{ncol(A)}.}
  \item{\dots}{further arguments passed to or from other methods.}
}
\value{
  an object inheriting from either
  \code{"\linkS4class{CHMsuper}"}, or
  \code{"\linkS4class{CHMsimpl}"}, depending on the \code{super}
  argument; both classes extend \code{"\linkS4class{CHMfactor}"} which
  extends \code{"\linkS4class{MatrixFactorization}"}.

  In other words, the result of \code{Cholesky()} is \emph{not} a
  matrix, and if you want one, you should probably rather use
  \code{\link{chol}()}, see Details.
}
%FAILS WHY??\newcommand{\tR}{\tilde{R}}% both \tR{} and simple '\tR' fails
\details{
  This is a generic function with special methods for different types
  of matrices.  Use \code{\link{showMethods}("Cholesky")} to list all
  the methods for the \code{\link{Cholesky}} generic.

  The method for class \code{\linkS4class{dsCMatrix}} of sparse matrices
  --- the only one available currently ---
  is based on functions from the CHOLMOD library.

  Again: If you just want the Cholesky decomposition of a matrix in a
  straightforward way, you should probably rather use \code{\link{chol}(.)}.

  Note that if \code{perm=TRUE} (default), the decomposition is
  \deqn{A = P' \tilde{L} D \tilde{L}' P = P' L L' P,}{A = P' L~ D L~' P = P' L L' P,}
  where \eqn{L} can be extracted by \code{as(*, "Matrix")}, \eqn{P} by
  \code{as(*, "pMatrix")} and both by \code{\link{expand}(*)}, see the
  class \code{\linkS4class{CHMfactor}} documentation.

  Note that consequently, you cannot easily get the \dQuote{traditional}
  cholesky factor \eqn{R}, from this decomposition, as
  \deqn{R'R = A = P'LL'P = P'\tilde{R}'\tilde{R} P = (\tilde{R}P)' (\tilde{R}P),}{
        R'R = A = P'LL'P = P' R~' R~ P = (R~ P)' (R~ P),}
  but \eqn{\tilde{R}P}{R~ P} is \emph{not} triangular even though \eqn{\tilde{R}}{R~} is.
}
\references{
  Yanqing Chen, Timothy A. Davis, William W. Hager, and Sivasankaran Rajamanickam (2008)
  Algorithm 887: CHOLMOD, Supernodal Sparse Cholesky Factorization and Update/Downdate.
  \emph{ACM Trans. Math. Softw.} \bold{35}, 3, Article 22, 14 pages.
  \doi{10.1145/1391989.1391995}

  Timothy A. Davis (2006)
  \emph{Direct Methods for Sparse Linear Systems}, SIAM Series
  \dQuote{Fundamentals of Algorithms}.
}
\seealso{
  Class definitions \code{\linkS4class{CHMfactor}} and
  \code{\linkS4class{dsCMatrix}} and function \code{\link{expand}}.
  Note the extra \code{\link{solve}(*, system = . )} options in
  \code{\linkS4class{CHMfactor}}.

  Note that \code{\link{chol}()} returns matrices (inheriting from
  \code{"\linkS4class{Matrix}"}) whereas \code{Cholesky()} returns a
  \code{"\linkS4class{CHMfactor}"} object, and hence a typical user
  will rather use \code{chol(A)}.
}
\examples{
data(KNex)
mtm <- with(KNex, crossprod(mm))
str(mtm@factors) # empty list()
(C1 <- Cholesky(mtm))             # uses show(<MatrixFactorization>)
str(mtm@factors) # 'sPDCholesky' (simpl)
(Cm <- Cholesky(mtm, super = TRUE))
c(C1 = isLDL(C1), Cm = isLDL(Cm))
str(mtm@factors) # 'sPDCholesky'  *and* 'SPdCholesky'
str(cm1  <- as(C1, "sparseMatrix"))
str(cmat <- as(Cm, "sparseMatrix"))# hmm: super is *less* sparse here
cm1[1:20, 1:20]

b <- matrix(c(rep(0, 711), 1), ncol = 1)
## solve(Cm, b) by default solves  Ax = b, where A = Cm'Cm (= mtm)!
## hence, the identical() check *should* work, but fails on some GOTOblas:
x <- solve(Cm, b)
stopifnot(identical(x, solve(Cm, b, system = "A")),
          all.equal(x, solve(mtm, b)))

Cn <- Cholesky(mtm, perm = FALSE)# no permutation -- much worse:
sizes <- c(simple = object.size(C1),
           super  = object.size(Cm),
           noPerm = object.size(Cn))
## simple is 100, super= 137, noPerm= 812 :
noquote(cbind(format(100 * sizes / sizes[1], digits=4)))


## Visualize the sparseness:
dq <- function(ch) paste('"',ch,'"', sep="") ## dQuote(<UTF-8>) gives bad plots
image(mtm, main=paste("crossprod(mm) : Sparse", dq(class(mtm))))
image(cm1, main= paste("as(Cholesky(crossprod(mm)),\"sparseMatrix\"):",
                        dq(class(cm1))))
\dontshow{% FIXME-- move to ../tests/factorizing.R :
expand(C1) ## to check printing
}

## Smaller example, with same matrix as in  help(chol) :
(mm <- Matrix(toeplitz(c(10, 0, 1, 0, 3)), sparse = TRUE)) # 5 x 5
(opts <- expand.grid(perm = c(TRUE,FALSE), LDL = c(TRUE,FALSE), super = c(FALSE,TRUE)))
rr <- lapply(seq_len(nrow(opts)), function(i)
             do.call(Cholesky, c(list(A = mm), opts[i,])))
nn <- do.call(expand.grid, c(attr(opts, "out.attrs")$dimnames,
              stringsAsFactors=FALSE,KEEP.OUT.ATTRS=FALSE))
names(rr) <- apply(nn, 1, function(r)
                   paste(sub("(=.).*","\\\\1", r), collapse=","))% extra '\\' in Rd
str(rr, max.level=1)

str(re <- lapply(rr, expand), max.level=2) ## each has a 'P' and a 'L' matrix
%% FIXME !! --- "check" them  __unfinished__
R0 <- chol(mm, pivot=FALSE)
R1 <- chol(mm, pivot=TRUE )
stopifnot(all.equal(t(R1), re[[1]]$L),
          all.equal(t(R0), re[[2]]$L),
          identical(as(1:5, "pMatrix"), re[[2]]$P), # no pivoting
TRUE)

%% --> ../TODO : .diag.dsC() should be renamed, documented, tested,...
\dontshow{
str(dd <- .diag.dsC(mtm))
dc <- .diag.dsC(Chx=C1) # <- directly from the Cholesky
stopifnot(all.equal(dd,dc))
}%dont
# Version of the underlying SuiteSparse library by Tim Davis :
.SuiteSparse_version()
}
\keyword{array}
\keyword{algebra}
