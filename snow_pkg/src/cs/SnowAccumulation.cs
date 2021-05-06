using System;
using System.Collections.Generic;
using System.Linq;
public class SnowAccumulation
{
    private double _tsmax;
    public double tsmax
        {
            get { return this._tsmax; }
            set { this._tsmax= value; } 
        }
    private double _trmax;
    public double trmax
        {
            get { return this._trmax; }
            set { this._trmax= value; } 
        }
    public SnowAccumulation() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: SnowAccumulation -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: snowfall accumulation  calculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: tsmax
    //                          ** description : maximum daily air temperature (tmax) below which all precipitation is assumed to be snow
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 1000
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: tmax
    //                          ** description : current maximum air temperature
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: trmax
    //                          ** description : tmax above which all precipitation is assumed to be rain
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : degC
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
        //- outputs:
    //            * name: Snowaccu
    //                          ** description : snowfall accumulation
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW/d
    //                          ** uri : 
        double tmax = a.tmax;
        double precip = a.precip;
        double Snowaccu;
        double fs = 0.0d;
        if (tmax < tsmax)
        {
            fs = 1.0d;
        }
        if (tmax >= tsmax && tmax <= trmax)
        {
            fs = (trmax - tmax) / (trmax - tsmax);
        }
        Snowaccu = fs * precip * 1;
        r.Snowaccu = Snowaccu;
    }
}