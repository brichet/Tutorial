#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
#include "SnowState.h"
#include "SnowRate.h"
#include "SnowAuxiliary.h"
using namespace std;
class Snowdepth
{
    private:
        double E;
        double rho;
    public:
        Snowdepth();
        void  Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a);
        double getE();
        void setE(double _E);
        double getrho();
        void setrho(double _rho);

};