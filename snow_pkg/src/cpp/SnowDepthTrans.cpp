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
#include "Snowdepthtrans.h"
using namespace std;

Snowdepthtrans::Snowdepthtrans() { }
double Snowdepthtrans::getPns() {return this-> Pns; }
void Snowdepthtrans::setPns(double _Pns) { this->Pns = _Pns; }
void Snowdepthtrans::Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    //- Name: SnowDepthTrans -Version: 1.0, -Time step: 1
    //- Description:
    //            * Title: snow cover depth conversion
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
    //- inputs:
    //            * name: Sdepth
    //                          ** description : snow cover depth Calculation
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m
    //                          ** uri : 
    //            * name: Pns
    //                          ** description : density of the new snow
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 100.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : cm/m
    //                          ** uri : 
    //- outputs:
    //            * name: Sdepth_cm
    //                          ** description : snow cover depth in cm
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : cm
    //                          ** uri : 
    double Sdepth = s.getSdepth();
    double Sdepth_cm;
    Sdepth_cm = Sdepth * Pns;
    s.setSdepth_cm(Sdepth_cm);
}