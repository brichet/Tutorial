import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class Ptq
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
    
    private double kl;
    public double getkl()
    {
        return kl;
    }

    public void setkl(double _kl)
    {
        this.kl= _kl;
    } 
    
    public Ptq()
    {
           
    }
    public void  Calculate_ptq(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            * Title: Phyllochron Model
    //            * Author: Pierre Martre
    //            * Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            * Institution: INRA Montpellier
    //            * Abstract: Calculate Photothermal Quaotient 
        //- inputs:
    //            * name: tTWindowForPTQ
    //                          ** description : Thermal time window in which averages are computed
    //                          ** parametercategory : species
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 70000.0
    //                          ** default : 70.0
    //                          ** unit : °C d
    //                          ** uri : some url
    //                          ** inputtype : parameter
    //            * name: kl
    //                          ** description : Exctinction Coefficient
    //                          ** parametercategory : species
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 50.0
    //                          ** default : 0.45
    //                          ** unit : 
    //                          ** uri : some url
    //                          ** inputtype : parameter
    //            * name: listTTShootWindowForPTQ
    //                          ** description : List of Daily Shoot thermal time during TTWindowForPTQ thermal time period
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** default : [0.0]
    //                          ** unit : °C d
    //                          ** uri : some url
    //                          ** inputtype : variable
    //            * name: listPARTTWindowForPTQ
    //                          ** description : List of Daily PAR during TTWindowForPTQ thermal time period
    //                          ** variablecategory : state
    //                          ** inputtype : variable
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** default : [0.0]
    //                          ** unit : MJ m2 d
    //                          ** uri : some url
    //            * name: listGAITTWindowForPTQ
    //                          ** description : List of daily GAI over TTWindowForPTQ thermal time period
    //                          ** variablecategory : state
    //                          ** inputtype : variable
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** default : [0.0]
    //                          ** unit : m2 m-2
    //                          ** uri : some url
    //            * name: pAR
    //                          ** description : Daily Photosyntetically Active Radiation
    //                          ** variablecategory : auxiliary
    //                          ** datatype : DOUBLE
    //                          ** default : 0.0
    //                          ** min : 0.0
    //                          ** max : 10000.0
    //                          ** unit : MJ m² d
    //                          ** uri : some url
    //                          ** inputtype : variable
    //            * name: deltaTT
    //                          ** description : daily delta TT 
    //                          ** variablecategory : auxiliary
    //                          ** inputtype : variable
    //                          ** datatype : DOUBLE
    //                          ** min : 0.0
    //                          ** max : 100.0
    //                          ** default : 0.0
    //                          ** unit : °C d
    //                          ** uri : some url
        //- outputs:
    //            * name: listPARTTWindowForPTQ
    //                          ** description :  List of Daily PAR during TTWindowForPTQ thermal time period
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : MJ m2 d
    //            * name: listTTShootWindowForPTQ
    //                          ** description : List of Daily Shoot thermal time during TTWindowForPTQ thermal time period
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLELIST
    //                          ** min : 
    //                          ** max : 
    //                          ** unit : °C d
    //            * name: ptq
    //                          ** description : Photothermal Quotient
    //                          ** variablecategory : state
    //                          ** datatype : DOUBLE
    //                          ** min : 0
    //                          ** max : 10000
    //                          ** unit : MJ °C-1 d m-2)
        List<Double> listTTShootWindowForPTQ = s.getlistTTShootWindowForPTQ();
        List<Double> listPARTTWindowForPTQ = s.getlistPARTTWindowForPTQ();
        List<Double> listGAITTWindowForPTQ = s.getlistGAITTWindowForPTQ();
        double pAR = a.getpAR();
        double deltaTT = a.getdeltaTT();
        double ptq;
        List<Double> TTList = new ArrayList<>(Arrays.asList());
        List<Double> PARList = new ArrayList<>(Arrays.asList());
        int i;
        int count;
        double SumTT;
        double parInt = 0.0d;
        double TTShoot;
        for (i=0 ; i<listTTShootWindowForPTQ.size() ; i+=1)
        {
            TTList.add(listTTShootWindowForPTQ.get(i));
            PARList.add(listPARTTWindowForPTQ.get(i));
        }
        TTList.add(deltaTT);
        PARList.add(pAR);
        SumTT = TTList.stream().mapToDouble(Double::doubleValue).sum();
        count = 0;
        while ( SumTT > tTWindowForPTQ)
        {
            SumTT = SumTT - TTList.get(count);
            count = count + 1;
        }
        listTTShootWindowForPTQ = new ArrayList<>(Arrays.asList());
        listPARTTWindowForPTQ = new ArrayList<>(Arrays.asList());
        for (i=count ; i<TTList.size() ; i+=1)
        {
            listTTShootWindowForPTQ.add(TTList.get(i));
            listPARTTWindowForPTQ.add(PARList.get(i));
        }
        for (i=0 ; i<listTTShootWindowForPTQ.size() ; i+=1)
        {
            parInt = parInt + (listPARTTWindowForPTQ.get(i) * (1 - Math.exp(-kl * listGAITTWindowForPTQ.get(i))));
        }
        TTShoot = listTTShootWindowForPTQ.stream().mapToDouble(Double::doubleValue).sum();
        ptq = parInt / TTShoot;
        s.setlistTTShootWindowForPTQ(listTTShootWindowForPTQ);
        s.setlistPARTTWindowForPTQ(listPARTTWindowForPTQ);
        s.setptq(ptq);
    }
}