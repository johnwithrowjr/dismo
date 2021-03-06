\name{Rectangular Hull}

\alias{rectHull}
\alias{rectHull,SpatialPoints-method}
\alias{rectHull,matrix-method}
\alias{rectHull,data.frame-method}
\alias{RectangularHull-class}


\title{Rectangular hull model}


\description{
The Rectangular Hull model predicts that a species is present at sites inside the minimum (rotated) bounding rectangle of a set of training points, and absent outside that rectangle.
}


\usage{
rectHull(p, ...)
}
 
\arguments{
  \item{p}{point locations (presence). Two column matrix, data.frame or SpatialPoints* object}
  \item{...}{ Additional arguments. See details }
}


\details{
You can supply an argument n (>= 1) to get n convex hulls around subset of the points. You can also set n=1:x, to get a set of overlapping polygons consisting of 1 to x parts. I.e. the first polygon has 1 part, the second has 2 parts, and x has x parts.
}


\value{
An object of class 'RectangularHull' (inherits from \code{\link{DistModel-class}})
}


\author{
Robert J. Hijmans
}

\seealso{
\code{\link[dismo]{predict}, \link[dismo]{geoDist}, \link[dismo]{maxent}, \link[dismo]{domain}, \link[dismo]{mahal}}
}


\examples{
r <- raster(system.file("external/rlogo.grd", package="raster"))
# presence data
pts <- matrix(c(17, 42, 85, 70, 19, 53, 26, 84, 84, 46, 48, 85, 4, 95, 48, 54, 66, 
 74, 50, 48, 28, 73, 38, 56, 43, 29, 63, 22, 46, 45, 7, 60, 46, 34, 14, 51, 70, 31, 39, 26), ncol=2)
train <- pts[1:12, ]
test <- pts[13:20, ]
				 
rh <- rectHull(train)
predict(rh, test)

plot(r)
plot(rh, border='red', lwd=2, add=TRUE)
points(train, col='red', pch=20, cex=2)
points(test, col='black', pch=20, cex=2)

pr <- predict(rh, r, progress='')
plot(pr)
points(test, col='black', pch=20, cex=2)
points(train, col='red', pch=20, cex=2)
}

\keyword{spatial}

