\name{dayrange}
\alias{dayrange}
\title{
This function determines the diurnal range.
}
\description{
The function calculates the difference of maximum and minimum values
of hourly data from a single CM SAF NetCDF input file.
}
\usage{
dayrange(var, infile, outfile)
}
\arguments{
  \item{var}{
Variable name.
}
  \item{infile}{
Filename of input NetCDF file (character). This may include the directory. 
There should be at least two values per day.
}
  \item{outfile}{
Filename of output NetCDF file. This may include the directory (character).
}
}
\value{
A NetCDF file including a timeseries of the diurnal range is written (character).
}
\author{
Steffen Kothe
}
\examples{
## Create an example NetCDF file with a similar structure
## as used by CM SAF. The file is created with the ncdf4 package.
## Alternatively example data can be freely downloaded here: 
## <https://wui.cmsaf.eu/>

library(ncdf4)

## create some (non-realistic) example data

  lon <- seq(5,15,0.5)
  lat <- seq(45,55,0.5)
  time <- seq(ISOdate(2000,1,1), ISOdate(2000,1,6), 'hours')
  origin <- as.Date('1983-01-01 00:00:00')
  time <- as.numeric(difftime(time,origin,units='hour'))
  data <- array(250:350,dim=c(21,21,121))

## create example NetCDF

   x <- ncdim_def(name='lon',units='degrees_east',vals=lon)
   y <- ncdim_def(name='lat',units='degrees_north',vals=lat)
   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time,unlim=TRUE)
   var1 <- ncvar_def('SIS','W m-2',list(x,y,t),-1,prec='short')
   vars <- list(var1)
   ncnew <- nc_create('CMSAF_example_file.nc',vars)
   ncvar_put(ncnew,var1,data)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   nc_close(ncnew)

## Determine the diurnal range of the example CM SAF NetCDF file and write 
## the output to a new file.
   dayrange('SIS','CMSAF_example_file.nc', 'CMSAF_example_file_dayrange.nc')
}