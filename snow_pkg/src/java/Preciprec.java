import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javafx.util.*;
import java.time.LocalDateTime;
public class Preciprec
{
    private double rho;
    public double getrho()
    { return rho; }

    public void setrho(double _rho)
    { this.rho= _rho; } 
    
    public Preciprec() { }
    public void  Calculate_preciprec(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
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
        double Sdry_t1 = s1.getSdry();
        double Sdry = s.getSdry();
        double Swet = s.getSwet();
        double Swet_t1 = s1.getSwet();
        double Sdepth_t1 = s1.getSdepth();
        double Sdepth = s.getSdepth();
        double Mrf = r.getMrf();
        double precip = a.getprecip();
        double Snowaccu = r.getSnowaccu();
        double preciprec;
        preciprec = precip;
        if (Sdry + Swet < Sdry_t1 + Swet_t1)
        {
            preciprec = preciprec + ((Sdepth_t1 - Sdepth) * rho) - Mrf;
        }
        preciprec = preciprec - Snowaccu;
        s.setpreciprec(preciprec);
    }
}