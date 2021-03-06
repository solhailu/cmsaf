\name{cmsaf-package}
\alias{cmsaf-package}
\alias{cmsaf}
\docType{package}
\title{cmsaf}
\description{The cmsaf-package contains a small collection of functions
for basic analysis and manipulation of CM SAF NetCDF formatted data. 
The operation and functions are inspired by the Climate Data Operatores ('cdo').
}
\details{
\tabular{ll}{
Package: \tab cmsaf\cr
Type: \tab Package\cr
Version: \tab 1.7.1\cr
Date: \tab 2016-11-01\cr
License: \tab GPL (>= 3)\cr
}
The cmsaf-functions are manipulating NetCDF input files and write the result 
in a separate output file. The functions were designed and tested for CM SAF
NetCDF data, but most of the funtions can be applied for other NetCDF data,
which use the CF convention and a rectangular lon-lat grid. As interface to
the NetCDF data the 'ncdf4' package is used. 


}
\author{Steffen Kothe <Steffen.Kothe@dwd.de>

Maintainer: Steffen Kothe <Steffen.Kothe@dwd.de>

Contact: CM SAF Team <contact.cmsaf@dwd.de>
}
\references{<http://www.cmsaf.eu>

Schulz, J., W. Thomas, R. Mueller, H.-D. Behr, D. Caprion, H. Deneke, S. Dewitte, 
B. Duerr, P. Fuchs, A. Gratzki, R. Hollmann, K.-G. Karlsson, T. Manninen, M. Reuter, 
A. Riihela, R. Roebeling, N. Selbach, A. Tetzlaff, E. Wolters, A. Zelenka, M. Werscheck, 
2008: Operational climate monitoring from space: the EUMETSAT satellite application 
facility on climate monitoring (CM SAF), Atmos. Chem. Phys. Discuss., 8, 8517-8563, 
2008, SRef-ID: 1680-7375/acpd/2008-8-8517
}
\keyword{ package }
\keyword{ manip }
\keyword{ datagen }
\keyword{ univar }
\keyword{ ts }
\keyword{ spatial }