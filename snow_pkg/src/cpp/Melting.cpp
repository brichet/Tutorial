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
#include "Melting.h"
using namespace std;

Melting::Melting() { }
double Melting::getTmf() {return this-> Tmf; }
double Melting::getDKmax() {return this-> DKmax; }
double Melting::getKmin() {return this-> Kmin; }
void Melting::setTmf(double _Tmf) { this->Tmf = _Tmf; }
void Melting::setDKmax(double _DKmax) { this->DKmax = _DKmax; }
void Melting::setKmin(double _Kmin) { this->Kmin = _Kmin; }
void Melting::Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    //- Name: Melting -Version: 1.0, -Time step: 1
    //- Description:
    //            * Title: snow in the process of melting
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
    //- inputs:
    //            * name: jul
    //                          ** description : current day of year for the calculation
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : INT
    //                          ** default : 0
    //                          ** min : 0
    //                          ** max : 366
    //                          ** unit : d
    //                          ** uri : 
    //            * name: Tmf
    //                          ** description : threshold temperature for snow melting 
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.5
    //                          ** min : 0.0
    //                          ** max : 1.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: DKmax
    //                          ** description : difference between the maximum and the minimum melting rates
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW/degC/d
    //                          ** uri : 
    //            * name: Kmin
    //                          ** description : minimum melting rate on 21 December
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW/degC/d
    //                          ** uri : 
    //            * name: tavg
    //                          ** description : average temperature
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : degC
    //                          ** uri : 
    //- outputs:
    //            * name: M
    //                          ** description : snow in the process of melting
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW/d
    //                          ** uri : 
    int jul = a.getjul();
    double tavg = a.gettavg();
    double M;
    double K;
    M = 0.0d;
    K = DKmax / 2.0d * -asin((2.0d * M_PI * float(jul) / 366.0d + (9.0d / 16.0d * M_PI))) + Kmin + (DKmax / 2.0d);
    if (tavg > Tmf)
    {
        M = K * (tavg - Tmf);
    }
    r.setM(M);
}