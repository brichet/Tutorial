using System;
using System.Collections.Generic;
public class Gaimean
{
    private double _TTWindowForPTQ;
    public double TTWindowForPTQ
    {
        get
        {
            return this._TTWindowForPTQ;
        }
        set
        {
            this._TTWindowForPTQ= value;
        } 
    }
    public Gaimean()
    {
           
    }
    
    public void  Calculate_gaimean(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Name: GAImean -Version: 1.0, -Time step: 1
        //- Description:
    //            * Title: Average GAI on a specific thermal time window
    //            * Author: Loïc Manceau
    //            * Reference: -
    //            * Institution: INRA
    //            * Abstract: -
        //- inputs:
    //            * name: GAI
    //                          ** description : Green Area Index of the day
    //                          ** inputtype : variable
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 500.0
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
    //            * name: TTWindowForPTQ
    //                          ** description : Thermal Time window for average
    //                          ** inputtype : parameter
    //                          ** parametercategory : constant
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 5000.0
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: DeltaTT
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
    //            * name: ListTTShootWindowForPTQ
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** inputtype : variable
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** default : [0.0]
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: ListGAITTWindowForPTQ
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
    //            * name: GAImean
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
    //            * name: ListTTShootWindowForPTQ
    //                          ** description : List of daily shoot thermal time in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //                          ** uri : 
    //            * name: ListGAITTWindowForPTQ
    //                          ** description : List of daily Green Area Index in the window dedicated to average
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : m2 leaf m-2 ground
    //                          ** uri : 
        double GAI = a.GAI;
        double DeltaTT = a.DeltaTT;
        double pastMaxAI = s.pastMaxAI;
        List<double> ListTTShootWindowForPTQ = s.ListTTShootWindowForPTQ;
        List<double> ListGAITTWindowForPTQ = s.ListGAITTWindowForPTQ;
        double GAImean;
        List<double> TTList = new List<double>();
        List<double> GAIList = new List<double>();
        double SumTT;
        int count = 0;
        double gai = 0.0d;
        double gaiMean = 0.0d;
        int countGaiMean = 0;
        int i;
        TTList = new List<double>{};
        GAIList = new List<double>{};
        for (i=0 ; i<ListTTShootWindowForPTQ.Count ; i+=1)
        {
            TTList.Add(ListTTShootWindowForPTQ[i]);
            GAIList.Add(ListGAITTWindowForPTQ[i]);
        }
        TTList.Add(DeltaTT);
        GAIList.Add(GAI);
        SumTT = TTList.Sum();
        while ( SumTT > TTWindowForPTQ)
        {
            SumTT = SumTT - TTList[count];
            count = count + 1;
        }
        ListTTShootWindowForPTQ = new List<double>{};
        ListGAITTWindowForPTQ = new List<double>{};
        for (i=count ; i<TTList.Count ; i+=1)
        {
            ListTTShootWindowForPTQ.Add(TTList[i]);
            ListGAITTWindowForPTQ.Add(GAIList[i]);
        }
        for (i=0 ; i<ListGAITTWindowForPTQ.Count ; i+=1)
        {
            gaiMean = gaiMean + ListGAITTWindowForPTQ[i];
            countGaiMean = countGaiMean + 1;
        }
        gaiMean = gaiMean / countGaiMean;
        gai = Math.Max(pastMaxAI, gaiMean);
        pastMaxAI = gai;
        GAImean = gai;
        s.pastMaxAI= pastMaxAI;
        s.ListTTShootWindowForPTQ= ListTTShootWindowForPTQ;
        s.ListGAITTWindowForPTQ= ListGAITTWindowForPTQ;
        s.GAImean= GAImean;
    }
}