using System;
using System.Collections.Generic;
using System.Linq;
public class Melting
{
    private double _Tmf;
    public double Tmf
        {
            get { return this._Tmf; }
            set { this._Tmf= value; } 
        }
    private double _DKmax;
    public double DKmax
        {
            get { return this._DKmax; }
            set { this._DKmax= value; } 
        }
    private double _Kmin;
    public double Kmin
        {
            get { return this._Kmin; }
            set { this._Kmin= value; } 
        }
    public Melting() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: Melting -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: snow in the process of melting
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: jul
    //                          ** description : current day of year for the calculation
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : INT
    //                          ** default : 0
    //                          ** min : 0
    //                          ** max : 366
    //                          ** unit : d
    //                          ** uri : 
    //            * name: Tmf
    //                          ** description : threshold temperature for snow melting 
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.5
    //                          ** min : 0.0
    //                          ** max : 1.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: DKmax
    //                          ** description : difference between the maximum and the minimum melting rates
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW/degC/d
    //                          ** uri : 
    //            * name: Kmin
    //                          ** description : minimum melting rate on 21 December
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : mmW/degC/d
    //                          ** uri : 
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
        //- outputs:
    //            * name: M
    //                          ** description : snow in the process of melting
    //                          ** variablecategory : rate
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : mmW/d
    //                          ** uri : 
        int jul = a.jul;
        double tavg = a.tavg;
        double M;
        double K;
        M = 0.0d;
        K = DKmax / 2.0d * -Math.Sin((2.0d * Math.PI * (double)(jul) / 366.0d + (9.0d / 16.0d * Math.PI))) + Kmin + (DKmax / 2.0d);
        if (tavg > Tmf)
        {
            M = K * (tavg - Tmf);
        }
        r.M = M;
    }
}