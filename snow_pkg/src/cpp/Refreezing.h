#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
#include "SnowState.h"
#include "SnowRate.h"
#include "SnowAuxiliary.h"
using namespace std;
class Refreezing
{
    private:
        double Tmf;
        double SWrf;
    public:
        Refreezing();
        void  Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a);
        double getTmf();
        void setTmf(double _Tmf);
        double getSWrf();
        void setSWrf(double _SWrf);

};