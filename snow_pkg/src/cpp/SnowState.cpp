#include "SnowState.h"
SnowState::SnowState() { }

double SnowState::gettmaxrec() {return this-> tmaxrec; }
double SnowState::getps() {return this-> ps; }
double SnowState::getSwet() {return this-> Swet; }
double SnowState::getSnowmelt() {return this-> Snowmelt; }
double SnowState::getSdry() {return this-> Sdry; }
double SnowState::getSdepth() {return this-> Sdepth; }
double SnowState::gettminrec() {return this-> tminrec; }
double SnowState::getpreciprec() {return this-> preciprec; }
double SnowState::getSdepth_cm() {return this-> Sdepth_cm; }

void SnowState::settmaxrec(double _tmaxrec) { this->tmaxrec = _tmaxrec; }
void SnowState::setps(double _ps) { this->ps = _ps; }
void SnowState::setSwet(double _Swet) { this->Swet = _Swet; }
void SnowState::setSnowmelt(double _Snowmelt) { this->Snowmelt = _Snowmelt; }
void SnowState::setSdry(double _Sdry) { this->Sdry = _Sdry; }
void SnowState::setSdepth(double _Sdepth) { this->Sdepth = _Sdepth; }
void SnowState::settminrec(double _tminrec) { this->tminrec = _tminrec; }
void SnowState::setpreciprec(double _preciprec) { this->preciprec = _preciprec; }
void SnowState::setSdepth_cm(double _Sdepth_cm) { this->Sdepth_cm = _Sdepth_cm; }