\name{updater}
\alias{updater}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
updater(access_token, instance_url, myobject, data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{access_token}{
%%     ~~Describe \code{access_token} here~~
}
  \item{instance_url}{
%%     ~~Describe \code{instance_url} here~~
}
  \item{myobject}{
%%     ~~Describe \code{myobject} here~~
}
  \item{data}{
%%     ~~Describe \code{data} here~~
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
function (access_token, instance_url, myobject, data) 
{
    instance_u <- paste0(instance_url, "/")
    api <- "36.0"
    session <- c(sessionID = access_token, instanceURL = instance_u, 
        apiVersion = api)
    update_job <- rforcecom.createBulkJob(session, operation = "update", 
        object = myobject)
    my_data <- data
    batches_info <- rforcecom.createBulkBatch(session, jobId = update_job$id, 
        data = my_data)
    close_job_info <- rforcecom.closeBulkJob(session, jobId = update_job$id)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
