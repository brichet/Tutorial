using System;
using System.Collections.Generic;
using System.Linq;
public class TempMin
{
    private double _prof;
    public double prof
        {
            get { return this._prof; }
            set { this._prof= value; } 
        }
    private double _tminseuil;
    public double tminseuil
        {
            get { return this._tminseuil; }
            set { this._tminseuil= value; } 
        }
    private double _tmaxseuil;
    public double tmaxseuil
        {
            get { return this._tmaxseuil; }
            set { this._tmaxseuil= value; } 
        }
    public TempMin() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: TempMin -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Minimum temperature  calculation
    //            * Author: STICS
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: Sdepth_cm
    //                          ** description : snow depth
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : cm
    //                          ** uri : 
    //            * name: prof
    //                          ** description : snow cover threshold for snow insulation 
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 1000
    //                          ** unit : cm
    //                          ** uri : 
    //            * name: tmin
    //                          ** description : current minimum air temperature
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: tminseuil
    //                          ** description : minimum temperature when snow cover is higher than prof
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : degC
    //                          ** uri : 
    //            * name: tmaxseuil
    //                          ** description : maximum temperature when snow cover is higher than prof
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : degC
    //                          ** uri : 
        //- outputs:
    //            * name: tminrec
    //                          ** description : recalculated minimum temperature
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : degC
    //                          ** uri : 
        double Sdepth_cm = s.Sdepth_cm;
        double tmin = a.tmin;
        double tminrec;
        tminrec = tmin;
        if (Sdepth_cm > prof)
        {
            if (tmin < tminseuil)
            {
                tminrec = tminseuil;
            }
            else
            {
                if (tmin > tmaxseuil)
                {
                    tminrec = tmaxseuil;
                }
            }
        }
        else
        {
            if (Sdepth_cm > 0.0d)
            {
                tminrec = tminseuil - ((1 - (Sdepth_cm / prof)) * (Math.Abs(tmin) + tminseuil));
            }
        }
        s.tminrec= tminrec;
    }
}