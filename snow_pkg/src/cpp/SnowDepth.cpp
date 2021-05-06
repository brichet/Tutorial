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
#include "Snowdepth.h"
using namespace std;

Snowdepth::Snowdepth() { }
double Snowdepth::getE() {return this-> E; }
double Snowdepth::getrho() {return this-> rho; }
void Snowdepth::setE(double _E) { this->E = _E; }
void Snowdepth::setrho(double _rho) { this->rho = _rho; }
void Snowdepth::Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    //- Name: SnowDepth -Version: 1.0, -Time step: 1
    //- Description:
    //            * Title: snow cover depth Calculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
    //- inputs:
    //            * name: Snowmelt
    //                          ** description : snow melt 
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : m
    //                          ** uri : 
    //            * name: Sdepth_t1
    //                          ** description : snow cover depth Calculation in previous day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m
    //                          ** uri : 
    //            * name: Snowaccu
    //                          ** description : snowfall accumulation
    //                          ** inputtype : variable
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : mmW/d
    //                          ** uri : 
    //            * name: E
    //                          ** description : snow compaction parameter
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : mm/mm/d
    //                          ** uri : 
    //            * name: rho
    //                          ** description : The density of the new snow fixed by the user
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 100
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : kg/m**3
    //                          ** uri : 
    //- outputs:
    //            * name: Sdepth
    //                          ** description : snow cover depth Calculation
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m
    //                          ** uri : 
    double Snowmelt = s.getSnowmelt();
    double Sdepth_t1 = s1.getSdepth();
    double Snowaccu = r.getSnowaccu();
    double Sdepth;
    Sdepth = 0.0d;
    if (Snowmelt <= Sdepth_t1 + (Snowaccu / rho))
    {
        Sdepth = Snowaccu / rho + Sdepth_t1 - Snowmelt - (Sdepth_t1 * E);
    }
    s.setSdepth(Sdepth);
}