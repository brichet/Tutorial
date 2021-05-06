using System;
using System.Collections.Generic;
using System.Linq;
public class TempMax
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
    public TempMax() { }
    
    public void  CalculateModel(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
    {
        //- Name: TempMax -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Maximum temperature  recalculation
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
    //            * name: tmax
    //                          ** description : current maximum air temperature
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
    //            * name: tmaxrec
    //                          ** description : recalculated maximum temperature
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : degC
    //                          ** uri : 
        double Sdepth_cm = s.Sdepth_cm;
        double tmax = a.tmax;
        double tmaxrec;
        tmaxrec = tmax;
        if (Sdepth_cm > prof)
        {
            if (tmax < tminseuil)
            {
                tmaxrec = tminseuil;
            }
            else
            {
                if (tmax > tmaxseuil)
                {
                    tmaxrec = tmaxseuil;
                }
            }
        }
        else
        {
            if (Sdepth_cm > 0.0d)
            {
                if (tmax <= 0.0d)
                {
                    tmaxrec = tmaxseuil - ((1 - (Sdepth_cm / prof)) * -tmax);
                }
                else
                {
                    tmaxrec = 0.0d;
                }
            }
        }
        s.tmaxrec= tmaxrec;
    }
}