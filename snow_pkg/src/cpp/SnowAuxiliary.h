#ifndef _SnowAuxiliary_
#define _SnowAuxiliary_
#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
using namespace std;
class SnowAuxiliary
{
    private:
        int jul;
        double tmin;
        double tmax;
        double precip;
        double tavg;
    public:
        SnowAuxiliary();
        int getjul();
        void setjul(int _jul);
        double gettmin();
        void settmin(double _tmin);
        double gettmax();
        void settmax(double _tmax);
        double getprecip();
        void setprecip(double _precip);
        double gettavg();
        void settavg(double _tavg);

};
#endif