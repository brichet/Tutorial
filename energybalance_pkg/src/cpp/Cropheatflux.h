#ifndef _CROP_HEAT_FLUX
#define _CROP_HEAT_FLUX
#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
#include <vector>
#include <string>

#include "EnergybalanceState.h"
#include "EnergybalanceRate.h"
#include "EnergybalanceAuxiliary.h"

//using namespace std;

class Cropheatflux
{
    private:
    public:
        Cropheatflux();
        void  Calculate_Model(EnergybalanceState& s, EnergybalanceState& s1, EnergybalanceRate& r, EnergybalanceAuxiliary& a);

};

#endif