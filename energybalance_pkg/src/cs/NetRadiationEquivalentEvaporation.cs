using System;
using System.Collections.Generic;
using System.Linq;
public class NetRadiationEquivalentEvaporation
{
    private double _lambdaV;
    public double lambdaV
        {
            get { return this._lambdaV; }
            set { this._lambdaV= value; } 
        }
    public NetRadiationEquivalentEvaporation() { }
    
    public void  CalculateModel(EnergyBalanceState s, EnergyBalanceState s1, EnergyBalanceRate r, EnergyBalanceAuxiliary a)
    {
        //- Name: NetRadiationEquivalentEvaporation -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: NetRadiationEquivalentEvaporation Model
    //            * Author: Pierre Martre
    //            * Reference: Modelling energy balance in the wheat crop model SiriusQuality2:
    //            Evapotranspiration and canopy and soil temperature calculations
    //            * Institution: INRA/LEPSE Montpellier
    //            * Abstract:  It is given by dividing net radiation by latent heat of vaporization of water 
        //- inputs:
    //            * name: lambdaV
    //                          ** description : latent heat of vaporization of water
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 2.454
    //                          ** min : 0
    //                          ** max : 10
    //                          ** unit : MJ kg-1
    //                          ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
    //                          ** inputtype : parameter
    //            * name: netRadiation
    //                          ** description : net radiation
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 1.566
    //                          ** min : 0
    //                          ** max : 5000
    //                          ** unit : MJ m-2 d-1
    //                          ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
    //                          ** inputtype : variable
        //- outputs:
    //            * name: netRadiationEquivalentEvaporation
    //                          ** variablecategory : auxiliary
    //                          ** description : net Radiation in Equivalent Evaporation 
    //                          ** datatype : DOUBLE
    //                          ** min : 0
    //                          ** max : 5000
    //                          ** unit : g m-2 d-1
    //                          ** uri : http://www1.clermont.inra.fr/siriusquality/?page_id=547
        double netRadiation = s.netRadiation;
        double netRadiationEquivalentEvaporation;
        netRadiationEquivalentEvaporation = netRadiation / lambdaV * 1000.0d;
        a.netRadiationEquivalentEvaporation= netRadiationEquivalentEvaporation;
    }
}