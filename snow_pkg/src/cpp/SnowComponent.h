#include "Melting.h"
#include "Refreezing.h"
#include "Snowaccumulation.h"
#include "Snowdensity.h"
#include "Snowdepth.h"
#include "Snowdepthtrans.h"
#include "Snowdry.h"
#include "Snowmelt.h"
#include "Snowwet.h"
#include "Tavg.h"
#include "Tempmax.h"
#include "Tempmin.h"
#include "Preciprec.h"
using namespace std;

class SnowComponent
{
    private:
        double tmaxseuil;
        double tminseuil;
        double prof;
        double E;
        double rho;
        double Pns;
        double Kmin;
        double Tmf;
        double SWrf;
        double tsmax;
        double DKmax;
        double trmax;
    public:
        SnowComponent();
        SnowComponent(const SnowComponent& copy);
        void  Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a);
        void  Init(SnowState& s,SnowState& s1, SnowRate& r, SnowAuxiliary& a);
        double gettmaxseuil();
        void settmaxseuil(double _tmaxseuil);
        double gettminseuil();
        void settminseuil(double _tminseuil);
        double getprof();
        void setprof(double _prof);
        double getE();
        void setE(double _E);
        double getrho();
        void setrho(double _rho);
        double getPns();
        void setPns(double _Pns);
        double getKmin();
        void setKmin(double _Kmin);
        double getTmf();
        void setTmf(double _Tmf);
        double getSWrf();
        void setSWrf(double _SWrf);
        double gettsmax();
        void settsmax(double _tsmax);
        double getDKmax();
        void setDKmax(double _DKmax);
        double gettrmax();
        void settrmax(double _trmax);

        Melting _Melting;
        Refreezing _Refreezing;
        Snowaccumulation _Snowaccumulation;
        Snowdensity _Snowdensity;
        Snowdepth _Snowdepth;
        Snowdepthtrans _Snowdepthtrans;
        Snowdry _Snowdry;
        Snowmelt _Snowmelt;
        Snowwet _Snowwet;
        Tavg _Tavg;
        Tempmax _Tempmax;
        Tempmin _Tempmin;
        Preciprec _Preciprec;

};