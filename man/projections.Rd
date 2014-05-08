\name{projections}
\alias{projections}
\title{topojson projections}
\usage{
projections(proj, rotate = NULL, center = NULL, translate = NULL,
  scale = NULL, clipAngle = NULL, precision = NULL, parallels = NULL,
  clipExtent = NULL, invert = NULL)
}
\arguments{
  \item{proj}{Map projection name}

  \item{rotate}{}

  \item{center}{}

  \item{translate}{}

  \item{scale}{}

  \item{clipAngle}{}

  \item{precision}{}

  \item{parallels}{}

  \item{clipExtent}{}

  \item{invert}{}
}
\description{
topojson projections
}
\examples{
projections(proj="albers")
projections(proj="albers", rotate='[98 + 00 / 60, -35 - 00 / 60]', scale=5700)
projections(proj="albers", scale=5700)
projections(proj="albers", translate='[55 * width / 100, 52 * height / 100]')
projections(proj="albers", clipAngle=90)
projections(proj="albers", precision=0.1)
projections(proj="albers", parallels='[30, 62]')
projections(proj="albers", clipExtent='[[105 - 87, 40], [105 + 87 + 1e-6, 82 + 1e-6]]')
projections(proj="albers", invert=60)
projections("orthographic")
projections("alber")
}
