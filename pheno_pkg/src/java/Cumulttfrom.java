import  java.io.*;
import  java.util.*;
public class Cumulttfrom
{
    
    public Cumulttfrom()
    {
           
    }
    public void  Calculate_cumulttfrom(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            - Model Name: CumulTTFrom Model
    //            - Author: Pierre Martre
    //            - Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            - Institution: INRA Montpellier
    //            - Abstract: Calculate CumulTT 
        //- inputs:
    //            - name: calendarMoments
    //                          - description : List containing appearance of each stage
    //                          - variablecategory : state
    //                          - datatype : STRINGLIST
    //                          - default : ['Sowing']
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: calendarCumuls
    //                          - description : list containing for each stage occured its cumulated thermal times
    //                          - variablecategory : state
    //                          - datatype : DOUBLELIST
    //                          - default : [0.0]
    //                          - unit : °C d
    //                          - inputtype : variable
    //            - name: cumulTT
    //                          - description : cumul TT at current date
    //                          - datatype : DOUBLE
    //                          - variablecategory : auxiliary
    //                          - min : -200
    //                          - max : 10000
    //                          - default : 8
    //                          - unit : °C d
    //                          - inputtype : variable
        //- outputs:
    //            - name: cumulTTFromZC_65
    //                          - description :  cumul TT from Anthesis to current date 
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 5000
    //                          - unit : °C d
    //            - name: cumulTTFromZC_39
    //                          - description :  cumul TT from FlagLeafLiguleJustVisible to current date 
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 5000
    //                          - unit : °C d
    //            - name: cumulTTFromZC_91
    //                          - description :  cumul TT from EndGrainFilling to current date 
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 5000
    //                          - unit : °C d
        List<String> calendarMoments = s.getcalendarMoments();
        List<Double> calendarCumuls = s.getcalendarCumuls();
        double cumulTT = a.getcumulTT();
        double cumulTTFromZC_65;
        double cumulTTFromZC_39;
        double cumulTTFromZC_91;
        cumulTTFromZC_65 = 0.0d;
        cumulTTFromZC_39 = 0.0d;
        cumulTTFromZC_91 = 0.0d;
        if (calendarMoments.contains("Anthesis"))
        {
            cumulTTFromZC_65 = cumulTT - calendarCumuls.get(calendarMoments.indexOf("Anthesis"));
        }
        if (calendarMoments.contains("FlagLeafLiguleJustVisible"))
        {
            cumulTTFromZC_39 = cumulTT - calendarCumuls.get(calendarMoments.indexOf("FlagLeafLiguleJustVisible"));
        }
        if (calendarMoments.contains("EndGrainFilling"))
        {
            cumulTTFromZC_91 = cumulTT - calendarCumuls.get(calendarMoments.indexOf("EndGrainFilling"));
        }
        a.setcumulTTFromZC_65(cumulTTFromZC_65);
        a.setcumulTTFromZC_39(cumulTTFromZC_39);
        a.setcumulTTFromZC_91(cumulTTFromZC_91);
    }
}