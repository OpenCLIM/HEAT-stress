# HEAT-stress v.1.0

## Purpose

HEAT-stress is the OpenCLIM Heat Extremes Analysis Toolbox (HEAT) for calculating basic heat stress metrics. Climate data in netCDF format is loaded and used to calculate one of the following heat stress metrics:
1. Simplified Wet Bulb Globe Temperature
2. Humidex
3. Apparent Temperature
4. Temperature Humidity Index

1-3 are calculated following the equations of Zhao et al. 2015.
4 is calculated following the equation of Dunn et al. 2014.

All metrics require a temperature and humidity input. Currently, more complex metrics accounting for radiation and/or wind speed are not included. All equations for 1-4 require daily mean vapour pressure as the humidity measure, however it is possible to provide other humidity measures which are then converted to vapour pressure. Vapour pressure is calculated following the equations of Bolton (1980) and University Corporation for Atmospheric Research (2003). Alternative possible humidity measures are:
1. Dew point temperature
2. Relative humidity
3. Specific humidity

No additional climate variables are required for converting dew point temperature to vapour pressure. Conversion of relative humidity to vapour pressure requires daily mean temperature to be provided. Conversion of specific humidity requires daily mean temperature and daily mean surface pressure to be provided. Alternatively, sea level pressure can be provided along with a file showing surface height/elevation at each grid cell (named ht.csv) and the conversion of sea level pressure to surface pressure will be carried out, as described in Kennedy-Asser et al. (2021).

This model assumes there is temporal and spatial consistency between all input climate variables and, if required, the surface height field (ht.csv) is on the same spatial grid. 

It is assumed that the netCDF inputs use the same variable naming convention as UKCP18. If not (e.g. instead of relative humidity being called 'hurs',' it is called 'RH'), then the variable name must be provided. Additionally, heat stress metrics can be calculated for the daily maximum by providing a daily maximum temperature netCDF, however in this case if vapour pressure is to be calculated, daily mean temperature must also be provided in the second temperature data slot.

### The default UKCP18 variable names are as follows:

tas = daily mean temperature
tasmax = daily maximum temperature
tasmin = daily minimum temperature
psl = daily mean sea level pressure
hurs = daily mean relative humidity
huss = daily mean specific humidity
projection_x_coordinate = x coordinate of spatial grid
projection_y_coordinate = y coordinate of spatial grid
time = z coordinate (time in hours since midnight 01/01/1970)
yyyymmdd = character string of dates

The output will be saved in netCDF format concatenating all time steps together. The output file name can be adjusted by providing an experiment name, taking the format ExptName_HeatStressMetric_StartDate-EndDate.nc.
Additionally, the input choices will be saved as inputs.mat so the result can be reproduced in future if necessary. 

'inputs' is an optional structure for running locally. If running on DAFNI, all input options must be provided as environment variables.

Coded by A.T. Kennedy-Asser, University of Bristol, 2022.
Contact: alan.kennedy@bristol.ac.uk

## References

Bolton, D. 1980. The computation of equivalent potential temperature. Monthly Weather Review, 108, 1046-1053, DOI: 10.1175/1520-0493(1980)108<1046:TCOEPT>2.0.CO;2.
Dunn, R.J.H., Mead, N.E., Willett, K.M. & Parker, D.E. 2014. Analysis of heat stress in UK dairy cattle and impact on milk yields. Environental Research Letters, 9, 6, 064006. DOI: 10.1088/1748-9326/9/6/064006.
Kennedy-Asser A.T., Andrews O., Mitchell D.M. & Warren R.F. 2021. Evaluating heat extremes in the UK Climate Projections (UKCP18). Environmental Research Letters, 16, 014039, DOI: 10.1088/1748-9326/abc4ad
University Corporation for Atmospheric Research 2003. CEOP Derived Parameter Equations; Compute the Specific Humidity (Bolton 1980). URL: https://archive.eol.ucar.edu/projects/ceop/dm/documents/refdata_report/eqns.html, last accessed 05/11/2020.
Zhao, Y., Ducharne, A., Sultan, B., Braconnot, P. & Vautard, R. 2015. Estimating heat stress from climate-based indicators: present-day biases and future spreads in the CMIP5 global climate model ensemble. Environmental Research Letters, 10, 084013, DOI: 10.1088/1748-9326/10/8/084013.
