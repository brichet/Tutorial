#include "SnowRate.h"
SnowRate::SnowRate() { }

double SnowRate::getMrf() {return this-> Mrf; }
double SnowRate::getSnowaccu() {return this-> Snowaccu; }
double SnowRate::getM() {return this-> M; }

void SnowRate::setMrf(double _Mrf) { this->Mrf = _Mrf; }
void SnowRate::setSnowaccu(double _Snowaccu) { this->Snowaccu = _Snowaccu; }
void SnowRate::setM(double _M) { this->M = _M; }