import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class Gaimean
{
    private double tTWindowForPTQ;
    public double gettTWindowForPTQ()
    {
        return tTWindowForPTQ;
    }

    public void settTWindowForPTQ(double _tTWindowForPTQ)
    {
        this.tTWindowForPTQ= _tTWindowForPTQ;
    } 
    
    public Gaimean()
    {
           
    }
    public void  Calculate_gaimean(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            * Title: Average GAI on a specific thermal time window
    //            * Author: Loïc Manceau
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: gAI
    //                          ** description : Green Area Index of the day
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: tTWindowForPTQ
    //                          ** description : Thermal Time window for average
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: deltaTT
    //                          ** description : Thermal time increase of the day
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: pastMaxAI
    //                          ** description : Maximum Leaf Area Index reached the current day
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: listTTShootWindowForPTQ
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** default : [0.0]
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: listGAITTWindowForPTQ
    //                          ** description : List of daily Green Area Index in the window dedicated to average
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** default : [0.0]
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
        //- outputs:
    //            * name: gAImean
    //                          ** description : Mean Green Area Index
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: pastMaxAI
    //                          ** description : Maximum Leaf Area Index reached the current day
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: listTTShootWindowForPTQ
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: listGAITTWindowForPTQ
    //                          ** description : List of daily Green Area Index in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
        double gAI = a.getgAI();
        double deltaTT = a.getdeltaTT();
        double pastMaxAI = s.getpastMaxAI();
        List<Double> listTTShootWindowForPTQ = s.getlistTTShootWindowForPTQ();
        List<Double> listGAITTWindowForPTQ = s.getlistGAITTWindowForPTQ();
        double gAImean;
        List<Double> TTList = new ArrayList<>(Arrays.asList());
        List<Double> GAIList = new ArrayList<>(Arrays.asList());
        double SumTT;
        int count = 0;
        double gai_ = 0.0d;
        double gaiMean_ = 0.0d;
        int countGaiMean = 0;
        int i;
        for (i=0 ; i<listTTShootWindowForPTQ.size() ; i+=1)
        {
            TTList.add(listTTShootWindowForPTQ.get(i));
            GAIList.add(listGAITTWindowForPTQ.get(i));
        }
        TTList.add(deltaTT);
        GAIList.add(gAI);
        SumTT = TTList.stream().mapToDouble(Double::doubleValue).sum();
        while ( SumTT > tTWindowForPTQ)
        {
            SumTT = SumTT - TTList.get(count);
            count = count + 1;
        }
        listTTShootWindowForPTQ = new ArrayList<>(Arrays.asList());
        listGAITTWindowForPTQ = new ArrayList<>(Arrays.asList());
        for (i=count ; i<TTList.size() ; i+=1)
        {
            listTTShootWindowForPTQ.add(TTList.get(i));
            listGAITTWindowForPTQ.add(GAIList.get(i));
        }
        for (i=0 ; i<listGAITTWindowForPTQ.size() ; i+=1)
        {
            gaiMean_ = gaiMean_ + listGAITTWindowForPTQ.get(i);
            countGaiMean = countGaiMean + 1;
        }
        gaiMean_ = gaiMean_ / countGaiMean;
        gai_ = Math.max(pastMaxAI, gaiMean_);
        pastMaxAI = gai_;
        gAImean = gai_;
        s.setpastMaxAI(pastMaxAI);
        s.setlistTTShootWindowForPTQ(listTTShootWindowForPTQ);
        s.setlistGAITTWindowForPTQ(listGAITTWindowForPTQ);
        s.setgAImean(gAImean);
    }
}