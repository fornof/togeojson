% Generated by roxygen2 (4.0.0): do not edit by hand
\name{file_to_geojson}
\alias{file_to_geojson}
\title{Convert spatial data files to GeoJSON from various formats.}
\usage{
file_to_geojson(input, method = "web", destpath = "~/",
  outfilename = "myfile")
}
\arguments{
\item{input}{The file being uploaded, path to the file on your machine.}

\item{method}{One of web or local. Matches on partial strings.}

\item{destpath}{Destination for output geojson file. Defaults to your root
directory ('~/').}

\item{outfilename}{The output file name, without file extension.}
}
\description{
The web option uses the Ogre web API. Ogre currently has an output size limit of 15MB.
See here \url{http://ogre.adc4gis.com/} for info on the Ogre web API.
The local option uses the function \code{\link{writeOGR}} from the package rgdal.

Note that for Shapefiles, GML, MapInfo, and VRT, you need to send zip files
to Ogre. For other file types (.bna, .csv, .dgn, .dxf, .gxt, .txt, .json,
.geojson, .rss, .georss, .xml, .gmt, .kml, .kmz) you send the actual file with
that file extension.

If you're having trouble rendering geoJSON files, ensure you have a valid
geoJSON file by running it through a geoJSON linter \url{http://geojsonlint.com/}.
}
\details{
You can use a web interface called Ogre, or do conversions locally using the
rgdal package.
}
\examples{
\dontrun{
file <- '/Users/sacmac/Downloads/bison-Poa_annua-20140508-151800.kml'

# KML type file - using the web method
file_to_geojson(input=file, method='web', outfilename='kml_web')

# KML type file - using the local method
file_to_geojson(input=file, method='local', outfilename='kml_local')

# Shp type file - using the web method - input is a zipped shp bundle
file <- '~/github/sac/bison.zip'
file_to_geojson(file, method='web', outfilename='shp_web')

# Shp type file - using the local method - input is the actual .shp file
file <- '~/Downloads/bison-Bison_bison-20140508-154311/bison-Bison_bison-20140508-154311.shp'
file_to_geojson(file, method='local', outfilename='shp_local')

# Get data and save map data
splist <- c('Accipiter erythronemius', 'Junco hyemalis', 'Aix sponsa')
keys <- sapply(splist, function(x) gbif_lookup(name=x, kingdom='plants')$speciesKey,
   USE.NAMES=FALSE)
out <- occ_search(keys, georeferenced=TRUE, limit=50, return='data')
dat <- ldply(out)
datgeojson <- spocc_stylegeojson(input=dat, var='name',
   color=c('#976AAE','#6B944D','#BD5945'), size=c('small','medium','large'))

# Put into a github repo to view on the web
write.csv(datgeojson, '~/github/sac/mygeojson/rgbif_data.csv')
file <- '~/github/sac/mygeojson/rgbif_data.csv'
file_to_geojson(file, method='web', destpath='~/github/sac/mygeojson/',
   outfilename='rgbif_data')

# Natural earth layers
# Download from here http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip
file = "~/Downloads/ne_110m_admin_0_countries/ne_110m_admin_0_countries.shp"
file_to_geojson(file, method='local', outfilename='shp_local')

# Neighborhoods in the US
url <- 'http://www.zillow.com/static/shp/ZillowNeighborhoods-OR.zip'
url <- 'http://www.zillow.com/static/shp/ZillowNeighborhoods-MT.zip'
file_to_geojson(input=url, method='web', outfilename='zillow_mt')
}
}

