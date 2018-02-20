# library(tidyverse)

#### Select predefined subsets ####
select_disc_ref <- function(df) {
  
  df %>% 
    select(NAME,
           OTHERNAME,
           DATE,
           #MONTH,
           #PLANETDISCMONTH,
           #STARDISCMONTH,
           ORBREF,
           FIRSTREF,
           JSNAME,
           ETDNAME,
           EANAME,
           SIMBADNAME,
           KEPID,
           KOI,
           EOD,
           MICROLENSING,
           IMAGING,
           TIMING,
           ASTROMETRY)
}

select_orbital_param <- function(df) {
  
  df %>% 
    select(MSINI,
           MASS,
           A,
           SEP,
           PER,
           K,
           ECC,
           I,
           OM,
           BIGOM,
           T0,
           DVDT,
           LAMBDA,
           TRANSIT)
}

select_transit_param <- function(df) {
  
  df %>% 
    select(R,
           TT,
           T14,
           B,
           AR,
           DEPTH,
           DENSITY,
           GRAVITY,
           DR,
           RR)
}

select_orbital_fit <- function(df) {
  
  df %>% 
    select(CHI2,
           NOBS,
           RMS,
           FREEZE_ECC,
           TREND,
           NCOMP,
           MULT,
           COMP)
}

select_secondary_eclipse <- function(df) {
  
  df %>% 
    select(SE,
           SEDEPTHH,
           SEDEPTHJ,
           SEDEPTHKS,
           SEDEPTHKP,
           SEDEPTH36,
           SEDEPTH45,
           SEDEPTH58,
           SEDEPTH80,
           SET)
}

select_stellar_prop <- function(df) {
  
  df %>% 
    select(STAR,
           BINARY,
           MSTAR,
           RSTAR,
           FE,
           TEFF,
           RHOSTAR,
           LOGG,
           VSNI,
           GAMMA)
}

select_stellar_mag <- function(df) {
  
  df %>% 
    select(V,
           BMV,
           J,
           H,
           KS,
           SHK,
           RHK,
           KP,
           SPECREF)
}

select_coords_catalogs <- function(df) {
  
  df %>%
    select(RA,
           RA_STRING,
           DEC,
           DEC_STRING,
           PAR,
           DIST,
           HIPP,
           HD,
           GL,
           HR,
           SAO)
}

#### Convert from Jupiter to Earth parameters ####

# https://nssdc.gsfc.nasa.gov/planetary/factsheet/planet_table_ratio.html

convert_jupiter_earth <- function(df) {
  
  if ("MASS" %in% colnames(df)) {
    df$MASS <- df$MASS*317.8
  }
  if ("R" %in% colnames(df)) {
    df$R <- df$R*11.21
  }
  
  return(df)
}