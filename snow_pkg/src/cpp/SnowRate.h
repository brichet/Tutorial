#ifndef _SnowRate_
#define _SnowRate_
#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
using namespace std;
class SnowRate
{
    private:
        double Mrf;
        double Snowaccu;
        double M;
    public:
        SnowRate();
        double getMrf();
        void setMrf(double _Mrf);
        double getSnowaccu();
        void setSnowaccu(double _Snowaccu);
        double getM();
        void setM(double _M);

};
#endif