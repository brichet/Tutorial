import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javafx.util.*;
import java.time.LocalDateTime;
public class Snowaccumulation
{
    private double tsmax;
    public double gettsmax()
    { return tsmax; }

    public void settsmax(double _tsmax)
    { this.tsmax= _tsmax; } 
    
    private double trmax;
    public double gettrmax()
    { return trmax; }

    public void settrmax(double _trmax)
    { this.trmax= _trmax; } 
    
    public Snowaccumulation() { }
    public void  Calculate_snowaccumulation(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
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
        double tmax = a.gettmax();
        double precip = a.getprecip();
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
        r.setSnowaccu(Snowaccu);
    }
}