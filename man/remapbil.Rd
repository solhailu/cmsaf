\name{remapbil}
\alias{remapbil}
\title{
Bilinear grid interpolation.
}
\description{
The function interpolates the data of infile1 to the grid of infile2.
From infile2 only the grid information is used. Both grids have to be
regular. For interpolation a simple bilinear interpolation is used as
provided by the fields-package's interp.surface.grid function.
}
\usage{
remapbil(var, infile1, infile2, outfile)
}
\arguments{
  \item{var}{
Name of NetCDF variable in infile1 (character).
}
  \item{infile1}{
Filename of first input NetCDF file. This may include the directory (character).
The data of infile1 are interpolated.
}
  \item{infile2}{
Filename of second input NetCDF file. This may include the directory (character).
The grid information of infile2 are the target grid for the interpolation.
}
  \item{outfile}{
Filename of output NetCDF file. This may include the directory (character).
}
}
\value{
A NetCDF file including the interpolated data of infile1 on the grid of 
infile2 is written.
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
  lon2 <- seq(5,15,1)
  lat2 <- seq(45,55,1)
  time <- c(as.Date('2000-01-01'), as.Date('2001-02-01'))
  origin <- as.Date('1983-01-01 00:00:00')
  time <- as.numeric(difftime(time,origin,units='hour'))
  data1 <- array(250:350,dim=c(21,21,1))
  data2 <- array(230:320,dim=c(21,21,1))

## create two example NetCDF files

   x <- ncdim_def(name='lon',units='degrees_east',vals=lon)
   y <- ncdim_def(name='lat',units='degrees_north',vals=lat)
   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[1],unlim=TRUE)
   var1 <- ncvar_def('SIS','W m-2',list(x,y,t),-1,prec='short')
   vars <- list(var1)
   ncnew <- nc_create('CMSAF_example_file_1.nc',vars)
   ncvar_put(ncnew,var1,data1)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   nc_close(ncnew)

   x <- ncdim_def(name='lon',units='degrees_east',vals=lon2)
   y <- ncdim_def(name='lat',units='degrees_north',vals=lat2)
   t <- ncdim_def(name='time',units='hours since 1983-01-01 00:00:00',
   vals=time[1],unlim=TRUE)
   ncnew <- nc_create('CMSAF_example_file_2.nc',vars)
   ncvar_put(ncnew,var1,data2)
   ncatt_put(ncnew,'lon','standard_name','longitude',prec='text')
   ncatt_put(ncnew,'lat','standard_name','latitude',prec='text')
   nc_close(ncnew)

## Interpolate the fields of both example CM SAF NetCDF file 1 to the 
## coarser grid of file 2 and write the result into one output file.
   remapbil('SIS','CMSAF_example_file_1.nc', 'CMSAF_example_file_2.nc', 
   'CMSAF_example_file_remapbil.nc')
}
