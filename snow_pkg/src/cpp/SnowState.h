#ifndef _SnowState_
#define _SnowState_
#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
# include<vector>
# include<string>
using namespace std;
class SnowState
{
    private:
        double tmaxrec;
        double ps;
        double Swet;
        double Snowmelt;
        double Sdry;
        double Sdepth;
        double tminrec;
        double preciprec;
        double Sdepth_cm;
    public:
        SnowState();
        double gettmaxrec();
        void settmaxrec(double _tmaxrec);
        double getps();
        void setps(double _ps);
        double getSwet();
        void setSwet(double _Swet);
        double getSnowmelt();
        void setSnowmelt(double _Snowmelt);
        double getSdry();
        void setSdry(double _Sdry);
        double getSdepth();
        void setSdepth(double _Sdepth);
        double gettminrec();
        void settminrec(double _tminrec);
        double getpreciprec();
        void setpreciprec(double _preciprec);
        double getSdepth_cm();
        void setSdepth_cm(double _Sdepth_cm);

};
#endif