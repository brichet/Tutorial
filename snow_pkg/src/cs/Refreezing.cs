using System;
using System.Collections.Generic;
using System.Linq;
public class Refreezing
{
    private double _Tmf;
    public double Tmf
        {
            get { return this._Tmf; }
            set { this._Tmf= value; } 
        }
    private double _SWrf;
    public double SWrf
        {
            get { return this._SWrf; }
            set { this._SWrf= value; } 
        }
    public Refreezing() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: Refreezing -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: snowfall accumulation  calculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: tavg
    //                          ** description : average temperature
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: Tmf
    //                          ** description : threshold temperature for snow melting 
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: SWrf
    //                          ** description : degree-day temperature index for refreezing
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW/degC/d
    //                          ** uri : 
        //- outputs:
    //            * name: Mrf
    //                          ** description : liquid water in the snow cover in the process of refreezing
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW/d
    //                          ** uri : 
        double tavg = a.tavg;
        double Mrf;
        Mrf = 0.0d;
        if (tavg < Tmf)
        {
            Mrf = SWrf * (Tmf - tavg);
        }
        r.Mrf = Mrf;
    }
}