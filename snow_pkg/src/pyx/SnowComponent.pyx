from datetime import datetime
from math import *
from Melting import model_Melting
from Refreezing import model_Refreezing
from SnowAccumulation import model_SnowAccumulation
from SnowDensity import model_SnowDensity
from SnowDepth import model_SnowDepth
from SnowDepthTrans import model_SnowDepthTrans
from SnowDry import model_SnowDry
from SnowMelt import model_SnowMelt
from SnowWet import model_SnowWet
from Tavg import model_Tavg
from TempMax import model_TempMax
from TempMin import model_TempMin
from Preciprec import model_Preciprec
def model_Snow(int jul=0,
      float tmaxseuil=0.0,
      float tminseuil=0.0,
      float prof=0.0,
      float tmin=0.0,
      float tmax=0.0,
      float precip=0.0,
      float Sdry_t1=0.0,
      float E=0.0,
      float rho=100.0,
      float Sdepth_t1=0.0,
      float Pns=100.0,
      float Swet_t1=0.0,
      float Kmin=0.0,
      float Tmf=0.0,
      float SWrf=0.0,
      float tsmax=0.0,
      float DKmax=0.0,
      float trmax=0.0,
      float ps_t1=0.0):
    cdef float Snowaccu
    cdef float tavg
    cdef float M
    cdef float Mrf
    cdef float Sdry
    cdef float Swet
    cdef float Sdepth
    cdef float preciprec
    cdef float ps
    cdef float Sdepth_cm
    cdef float tminrec
    cdef float Snowmelt
    cdef float tmaxrec
    tavg = model_Tavg( tmin,tmax)
    Mrf = model_Refreezing( tavg,Tmf,SWrf)
    M = model_Melting( jul,Tmf,DKmax,Kmin,tavg)
    ps = model_SnowDensity( ps_t1,Sdepth_t1,Sdry_t1,Swet_t1)
    Snowmelt = model_SnowMelt( ps,M)
    Snowaccu = model_SnowAccumulation( tsmax,tmax,trmax,precip)
    Sdepth = model_SnowDepth( Snowmelt,Sdepth_t1,Snowaccu,E,rho)
    Sdepth_cm = model_SnowDepthTrans( Sdepth,Pns)
    tmaxrec = model_TempMax( Sdepth_cm,prof,tmax,tminseuil,tmaxseuil)
    tminrec = model_TempMin( Sdepth_cm,prof,tmin,tminseuil,tmaxseuil)
    Sdry = model_SnowDry( Sdry_t1,Snowaccu,Mrf,M)
    Swet = model_SnowWet( Swet_t1,precip,Snowaccu,Mrf,M,Sdry)
    preciprec = model_Preciprec( Sdry_t1,Sdry,Swet,Swet_t1,Sdepth_t1,Sdepth,Mrf,precip,Snowaccu,rho)
    return tmaxrec, ps, Mrf, tavg, Swet, Snowmelt, Snowaccu, Sdry, Sdepth, tminrec, M, preciprec, Sdepth_cm

def init_Snow(int jul=0,
                float tmaxseuil=0.0,
                float tminseuil=0.0,
                float prof=0.0,
                float tmin=0.0,
                float tmax=0.0,
                float precip=0.0,
                float E=0.0,
                float rho=100.0,
                float Pns=100.0,
                float Kmin=0.0,
                float Tmf=0.0,
                float SWrf=0.0,
                float tsmax=0.0,
                float DKmax=0.0,
                float trmax=0.0):

    cdef float tmaxrec = 0.0
    cdef float ps = 0.0
    cdef float Mrf = 0.0
    cdef float tavg = 0.0
    cdef float Swet = 0.0
    cdef float Snowmelt = 0.0
    cdef float Snowaccu = 0.0
    cdef float Sdry = 0.0
    cdef float Sdepth = 0.0
    cdef float tminrec = 0.0
    cdef float M = 0.0
    cdef float preciprec = 0.0
    cdef float Sdepth_cm = 0.0
    preciprec=precip
    tminrec=tmin
    tmaxrec=tmax
    return  tmaxrec, ps, Mrf, tavg, Swet, Snowmelt, Snowaccu, Sdry, Sdepth, tminrec, M, preciprec, Sdepth_cm
