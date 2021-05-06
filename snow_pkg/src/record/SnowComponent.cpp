#include "SnowComponent.h"

    SnowComponent::SnowComponent()
    {
           
    }
    

double SnowComponent::gettmaxseuil() {return this-> tmaxseuil; }
double SnowComponent::gettminseuil() {return this-> tminseuil; }
double SnowComponent::getprof() {return this-> prof; }
double SnowComponent::getE() {return this-> E; }
double SnowComponent::getrho() {return this-> rho; }
double SnowComponent::getPns() {return this-> Pns; }
double SnowComponent::getKmin() {return this-> Kmin; }
double SnowComponent::getTmf() {return this-> Tmf; }
double SnowComponent::getSWrf() {return this-> SWrf; }
double SnowComponent::gettsmax() {return this-> tsmax; }
double SnowComponent::getDKmax() {return this-> DKmax; }
double SnowComponent::gettrmax() {return this-> trmax; }

void SnowComponent::settmaxseuil(double _tmaxseuil)
{
    _Tempmin.settmaxseuil(_tmaxseuil);
    _Tempmax.settmaxseuil(_tmaxseuil);
}
void SnowComponent::settminseuil(double _tminseuil)
{
    _Tempmin.settminseuil(_tminseuil);
    _Tempmax.settminseuil(_tminseuil);
}
void SnowComponent::setprof(double _prof)
{
    _Tempmin.setprof(_prof);
    _Tempmax.setprof(_prof);
}
void SnowComponent::setE(double _E)
{
    _Snowdepth.setE(_E);
}
void SnowComponent::setrho(double _rho)
{
    _Snowdepth.setrho(_rho);
    _Preciprec.setrho(_rho);
}
void SnowComponent::setPns(double _Pns)
{
    _Snowdepthtrans.setPns(_Pns);
}
void SnowComponent::setKmin(double _Kmin)
{
    _Melting.setKmin(_Kmin);
}
void SnowComponent::setTmf(double _Tmf)
{
    _Refreezing.setTmf(_Tmf);
    _Melting.setTmf(_Tmf);
}
void SnowComponent::setSWrf(double _SWrf)
{
    _Refreezing.setSWrf(_SWrf);
}
void SnowComponent::settsmax(double _tsmax)
{
    _Snowaccumulation.settsmax(_tsmax);
}
void SnowComponent::setDKmax(double _DKmax)
{
    _Melting.setDKmax(_DKmax);
}
void SnowComponent::settrmax(double _trmax)
{
    _Snowaccumulation.settrmax(_trmax);
}
void SnowComponent::Calculate_Model(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    _Tavg.Calculate_Model(s, s1, r, a);
    _Refreezing.Calculate_Model(s, s1, r, a);
    _Melting.Calculate_Model(s, s1, r, a);
    _Snowdensity.Calculate_Model(s, s1, r, a);
    _Snowmelt.Calculate_Model(s, s1, r, a);
    _Snowaccumulation.Calculate_Model(s, s1, r, a);
    _Snowdry.Calculate_Model(s, s1, r, a);
    _Snowwet.Calculate_Model(s, s1, r, a);
    _Snowdepth.Calculate_Model(s, s1, r, a);
    _Preciprec.Calculate_Model(s, s1, r, a);
    _Snowdepthtrans.Calculate_Model(s, s1, r, a);
    _Tempmax.Calculate_Model(s, s1, r, a);
    _Tempmin.Calculate_Model(s, s1, r, a);
}
SnowComponent::SnowComponent(const SnowComponent& toCopy)
{
    tmaxseuil = toCopy.tmaxseuil;
    tminseuil = toCopy.tminseuil;
    prof = toCopy.prof;
    E = toCopy.E;
    rho = toCopy.rho;
    Pns = toCopy.Pns;
    Kmin = toCopy.Kmin;
    Tmf = toCopy.Tmf;
    SWrf = toCopy.SWrf;
    tsmax = toCopy.tsmax;
    DKmax = toCopy.DKmax;
    trmax = toCopy.trmax;
}


void SnowComponent::Init(SnowState& s, SnowState& s1, SnowRate& r, SnowAuxiliary& a)
{
    s.preciprec = a.precip;
    s.tminrec = a.tmin;
    s.tmaxrec = a.tmax;
}
