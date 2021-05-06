#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
# include<numeric>
# include<algorithm>
# include<array>
#include <map>
# include <tuple>
#include "Tempmin.h"
using namespace std;

Tempmin::Tempmin() { }
double Tempmin::getprof() {return this-> prof; }
double Tempmin::gettminseuil() {return this-> tminseuil; }
double Tempmin::gettmaxseuil() {return this-> tmaxseuil; }
void Tempmin::setprof(double _prof) { this->prof = _prof; }
void Tempmin::settminseuil(double _tminseuil) { this->tminseuil = _tminseuil; }
void Tempmin::settmaxseuil(double _tmaxseuil) { this->tmaxseuil = _tmaxseuil; }
void Tempmin::Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    //- Name: TempMin -Version: 1.0, -Time step: 1
    //- Description:
    //            * Title: Minimum temperature  calculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
    //- inputs:
    //            * name: Sdepth_cm
    //                          ** description : snow depth
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : cm
    //                          ** uri : 
    //            * name: prof
    //                          ** description : snow cover threshold for snow insulation 
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 1000
    //                          ** unit : cm
    //                          ** uri : 
    //            * name: tmin
    //                          ** description : current minimum air temperature
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: tminseuil
    //                          ** description : minimum temperature when snow cover is higher than prof
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: tmaxseuil
    //                          ** description : maximum temperature when snow cover is higher than prof
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : degC
    //                          ** uri : 
    //- outputs:
    //            * name: tminrec
    //                          ** description : recalculated minimum temperature
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : degC
    //                          ** uri : 
    double Sdepth_cm = s.getSdepth_cm();
    double tmin = a.gettmin();
    double tminrec;
    tminrec = tmin;
    if (Sdepth_cm > prof)
    {
        if (tmin < tminseuil)
        {
            tminrec = tminseuil;
        }
        else
        {
            if (tmin > tmaxseuil)
            {
                tminrec = tmaxseuil;
            }
        }
    }
    else
    {
        if (Sdepth_cm > 0.0d)
        {
            tminrec = tminseuil - ((1 - (Sdepth_cm / prof)) * (abs(tmin) + tminseuil));
        }
    }
    s.settminrec(tminrec);
}