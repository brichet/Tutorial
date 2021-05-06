import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javafx.util.*;
import java.time.LocalDateTime;
public class Tempmax
{
    private double prof;
    public double getprof()
    { return prof; }

    public void setprof(double _prof)
    { this.prof= _prof; } 
    
    private double tminseuil;
    public double gettminseuil()
    { return tminseuil; }

    public void settminseuil(double _tminseuil)
    { this.tminseuil= _tminseuil; } 
    
    private double tmaxseuil;
    public double gettmaxseuil()
    { return tmaxseuil; }

    public void settmaxseuil(double _tmaxseuil)
    { this.tmaxseuil= _tmaxseuil; } 
    
    public Tempmax() { }
    public void  Calculate_tempmax(SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a)
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
        double Sdepth_cm = s.getSdepth_cm();
        double tmax = a.gettmax();
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
        s.settmaxrec(tmaxrec);
    }
}