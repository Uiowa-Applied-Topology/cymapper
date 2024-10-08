% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quilting_hut.R
\name{create_balls}
\alias{create_balls}
\title{Make a cover of balls}
\usage{
create_balls(data, dists, eps)
}
\arguments{
\item{data}{A data frame.}

\item{dists}{A distance matrix for the data frame.}

\item{eps}{A positive real number.}
}
\value{
A list of vectors of data point names, one list element per ball. The output is such that every data point is contained in a ball of radius \eqn{\varepsilon}, and no ball center is contained in more than one ball. The centers are datapoints themselves.
}
\description{
Make a cover of balls
}
\examples{
num_points = 5000

P.data = data.frame(
  x = sapply(1:num_points, function(x)
    sin(x) * 10) + rnorm(num_points, 0, 0.1),
  y = sapply(1:num_points, function(x)
    cos(x) ^ 2 * sin(x) * 10) + rnorm(num_points, 0, 0.1),
  z = sapply(1:num_points, function(x)
    10 * sin(x) ^ 2 * cos(x)) + rnorm(num_points, 0, 0.1)
)

P.dist = dist(P.data)
balls = create_balls(data = P.data, dists = P.dist, eps = .25)
}
