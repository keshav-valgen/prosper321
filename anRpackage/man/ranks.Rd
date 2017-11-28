\name{ranks}
\alias{ranks}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ranks(access_token, instance_url, object, depfield, indfield, newname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{access_token}{
%%     ~~Describe \code{access_token} here~~
}
  \item{instance_url}{
%%     ~~Describe \code{instance_url} here~~
}
  \item{object}{
%%     ~~Describe \code{object} here~~
}
  \item{depfield}{
%%     ~~Describe \code{depfield} here~~
}
  \item{indfield}{
%%     ~~Describe \code{indfield} here~~
}
  \item{newname}{
%%     ~~Describe \code{newname} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (access_token, instance_url, object, depfield, indfield, 
    newname) 
{
    instance_u <- paste0(instance_url, "/")
    api <- "36.0"
    myquery <- paste0("Select Id, ", depfield, ", ", indfield, 
        " FROM ", object)
    session <- c(sessionID = access_token, instanceURL = instance_u, 
        apiVersion = api)
    data1 <- rforcecom.bulkQuery(session, myquery, object)
    data1 <- na.omit(data1)
    data1 <- ranker(data1)
    data1 <- subset(data1, select = c("Id", "decile"))
    data1$decile[data1$decile == 5 | data1$decile == 6 | data1$decile == 
        7 | data1$decile == 8] <- 5
    data1$decile[data1$decile == 9 | data1$decile == 10 | data1$decile == 
        11] <- 6
    colnames(data1) <- c("Id", newname)
    updater(access_token, instance_url, object, data1)
    return(data1)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
