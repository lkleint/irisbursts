## IRIS burst statistics

This repository contains data on IRIS bursts (IBs), small reconnection events in the solar atmosphere. IBs were defined as Si IV 1394 spectra from IRIS that show absorption line blends on top of the Si IV spectrum. The IBs were collected from all IRIS observations from 2013+2014.

The IDL sav file allinfo_pztx_coord.sav contains the information on the date, time, and location of the more than 100k IBs that were identified.

To restore:
```
IDL> restore,'allinfo_pztx_coord.sav',/ve
```

allinfo is a structure array with one entry for each burst:
```
IDL> help,allinfo
ALLINFO         STRUCT    = -> <Anonymous> Array[101337]
```

The following entries exist for each burst:
```
IDL> help,allinfo,/str                                                        
** Structure <b3a5598>, 18 tags, length=120, data length=114, refs=1:
   OBSID           STRING    '4190004125'
   DATE_OBS        STRING    '2013-07-20T20:05:09.260'
   SLITPX          INT            623
   RR              INT             19
   FILENO          INT              0
   EXPTIMEF        FLOAT           1.99961
   EXPTIMEN        FLOAT           1.99957
   OBS_DESC        STRING    'Very large coarse raster 126"x175" 64s  C II   Si IV   Mg II h'
   FOVX            FLOAT           126.792
   FOVY            FLOAT           182.320
   CLASS           FLOAT           58.0000
   IDENTIFIER      STRING    '20130720_200315_4190004125'
   PZTX            FLOAT          -25.0831
   SUMSPAT         FLOAT           1.00000
   SUMSPTRF        FLOAT           1.00000
   SUMSPTRN        FLOAT           1.00000
   XCOORD          FLOAT           49.6795
   YCOORD          FLOAT           300.787
```

OBSID: the IRIS obsid (see De Pontieu et al. 2014 for an explanation)
DATE_OBS: time of the burst
SLITPX: pixel along slit (count starts at zero)
RR: raster step, or in case of sit-and-stare rasters rr is the time index
FILENO: the part of the filename denoting which raster the burst was in. E.g. 173 for iris_l2_20140329_140938_3860258481_raster_t000_r00173.fits.
EXPTIMEF and EXPTIMEN: exposure times of FUV and NUV spectra
OBS_DESC, FOVX, FOVY: observing description and size of FOV (not relevant for IB analysis)
CLASS: the initial k-means class that a burst was classified into. Not relevant because a much finer and better reclassification was performed in a second step.
IDENTIFIER: The IRIS directory name
PZTX: the pztx keyword, which is related to the slit position.
SUMSPAT, SUMSPTRF, SUMSPTRN: the summing modes with which the burst was recorded (see IRIS documentation for details)
XCOORD, YCOORD: The coordinates of the burst that were derived based on the SJI and raster headers.



An example how to use these data is the file ib_locondisk.pro, which was used to create Figure 1 of the paper.

