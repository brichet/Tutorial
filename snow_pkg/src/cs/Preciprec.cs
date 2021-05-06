using System;
using System.Collections.Generic;
using System.Linq;
public class Preciprec
{
    private double _rho;
    public double rho
        {
            get { return this._rho; }
            set { this._rho= value; } 
        }
    public Preciprec() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: Preciprec -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Precipitation ReCalculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: Sdry_t1
    //                          ** description : water in solid state in the snow cover in previous day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW
    //                          ** uri : 
    //            * name: Sdry
    //                          ** description : water in solid state in the snow cover 
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW
    //                          ** uri : 
    //            * name: Swet
    //                          ** description : water in liquid state in the snow cover
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : mmW
    //                          ** uri : 
    //            * name: Swet_t1
    //                          ** description : water in liquid state in the snow cover in previous day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : mmW
    //                          ** uri : 
    //            * name: Sdepth_t1
    //                          ** description : snow cover depth Calculation in previous day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m
    //                          ** uri : 
    //            * name: Sdepth
    //                          ** description : snow cover depth Calculation
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m
    //                          ** uri : 
    //            * name: Mrf
    //                          ** description : liquid water in the snow cover in the process of refreezing
    //                          ** inputtype : variable
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : mmW/d
    //                          ** uri : 
    //            * name: precip
    //                          ** description : recalculated precipitation
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW
    //                          ** uri : 
    //            * name: Snowaccu
    //                          ** description : snowfall accumulation
    //                          ** inputtype : variable
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : mmW/d
    //                          ** uri : 
    //            * name: rho
    //                          ** description : The density of the new snow fixed by the user
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 100
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : kg/m**3
    //                          ** uri : 
        //- outputs:
    //            * name: preciprec
    //                          ** description : precipitation recalculation
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW
    //                          ** uri : 
        double Sdry_t1 = s1.Sdry;
        double Sdry = s.Sdry;
        double Swet = s.Swet;
        double Swet_t1 = s1.Swet;
        double Sdepth_t1 = s1.Sdepth;
        double Sdepth = s.Sdepth;
        double Mrf = r.Mrf;
        double precip = a.precip;
        double Snowaccu = r.Snowaccu;
        double preciprec;
        preciprec = precip;
        if (Sdry + Swet < Sdry_t1 + Swet_t1)
        {
            preciprec = preciprec + ((Sdepth_t1 - Sdepth) * rho) - Mrf;
        }
        preciprec = preciprec - Snowaccu;
        s.preciprec= preciprec;
    }
}