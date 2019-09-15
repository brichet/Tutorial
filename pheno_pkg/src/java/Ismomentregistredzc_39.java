import  java.io.*;
import  java.util.*;
public class Ismomentregistredzc_39
{
    
    public Ismomentregistredzc_39()
    {
           
    }
    public void  Calculate_ismomentregistredzc_39(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            - Model Name: Is FlagLeafLiguleJustVisible Model
    //            - Author: Pierre Martre
    //            - Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            - Institution: INRA Montpellier
    //            - Abstract: if FlagLeafLiguleJustVisible is already Registred 
        //- inputs:
    //            - name: calendarMoments
    //                          - description : List containing appearance of each stage
    //                          - variablecategory : state
    //                          - datatype : STRINGLIST
    //                          - default : ['Sowing']
    //                          - unit : 
    //                          - inputtype : variable
        //- outputs:
    //            - name: isMomentRegistredZC_39
    //                          - description :  if Flag leaf ligule has already appeared 
    //                          - variablecategory : state
    //                          - datatype : INT
    //                          - min : 0
    //                          - max : 1
    //                          - unit : 
        List<String> calendarMoments = s.getcalendarMoments();
        int isMomentRegistredZC_39;
        isMomentRegistredZC_39 = calendarMoments.contains("FlagLeafLiguleJustVisible") ? 1 : 0;
        s.setisMomentRegistredZC_39(isMomentRegistredZC_39);
    }
}