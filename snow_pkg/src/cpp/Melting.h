#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
#include "SnowState.h"
#include "SnowRate.h"
#include "SnowAuxiliary.h"
using namespace std;
class Melting
{
    private:
        double Tmf;
        double DKmax;
        double Kmin;
    public:
        Melting();
        void  Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a);
        double getTmf();
        void setTmf(double _Tmf);
        double getDKmax();
        void setDKmax(double _DKmax);
        double getKmin();
        void setKmin(double _Kmin);

};