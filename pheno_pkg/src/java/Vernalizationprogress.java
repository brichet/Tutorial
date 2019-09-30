import  java.io.*;
import  java.util.*;
public class Vernalizationprogress
{
    private double minTvern;
    public double getminTvern()
    {
        return minTvern;
    }

    public void setminTvern(double _minTvern)
    {
        this.minTvern= _minTvern;
    } 
    
    private double intTvern;
    public double getintTvern()
    {
        return intTvern;
    }

    public void setintTvern(double _intTvern)
    {
        this.intTvern= _intTvern;
    } 
    
    private double vAI;
    public double getvAI()
    {
        return vAI;
    }

    public void setvAI(double _vAI)
    {
        this.vAI= _vAI;
    } 
    
    private double vBEE;
    public double getvBEE()
    {
        return vBEE;
    }

    public void setvBEE(double _vBEE)
    {
        this.vBEE= _vBEE;
    } 
    
    private double minDL;
    public double getminDL()
    {
        return minDL;
    }

    public void setminDL(double _minDL)
    {
        this.minDL= _minDL;
    } 
    
    private double maxDL;
    public double getmaxDL()
    {
        return maxDL;
    }

    public void setmaxDL(double _maxDL)
    {
        this.maxDL= _maxDL;
    } 
    
    private double maxTvern;
    public double getmaxTvern()
    {
        return maxTvern;
    }

    public void setmaxTvern(double _maxTvern)
    {
        this.maxTvern= _maxTvern;
    } 
    
    private double pNini;
    public double getpNini()
    {
        return pNini;
    }

    public void setpNini(double _pNini)
    {
        this.pNini= _pNini;
    } 
    
    private double aMXLFNO;
    public double getaMXLFNO()
    {
        return aMXLFNO;
    }

    public void setaMXLFNO(double _aMXLFNO)
    {
        this.aMXLFNO= _aMXLFNO;
    } 
    
    private int isVernalizable;
    public int getisVernalizable()
    {
        return isVernalizable;
    }

    public void setisVernalizable(int _isVernalizable)
    {
        this.isVernalizable= _isVernalizable;
    } 
    
    public Vernalizationprogress()
    {
           
    }
    public void  Calculate_vernalizationprogress(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            - Model Name: VernalizationProgress Model
    //            - Author: Pierre MARTRE
    //            - Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            - Institution: INRA Montpellier
    //            - Abstract: Calculate progress (VernaProg) towards vernalization, but there 
    //        			is no vernalization below minTvern 
    //        			and above maxTvern . The maximum value of VernaProg is 1.
    //        			Progress towards full vernalization is a linear function of shoot 
    //        			temperature (soil temperature until leaf # reach MaxLeafSoil and then
    //        			 canopy temperature)
    //    	
        //- inputs:
    //            - name: dayLength
    //                          - description : day length
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 12.3037621834005
    //                          - unit : mm2 m-2
    //                          - inputtype : variable
    //            - name: deltaTT
    //                          - description : difference cumul TT between j and j-1 day 
    //                          - variablecategory : auxiliary
    //                          - inputtype : variable
    //                          - datatype : DOUBLE
    //                          - min : -20
    //                          - max : 100
    //                          - default : 20.3429985011972
    //                          - unit : °C d
    //            - name: cumulTT
    //                          - description : cumul thermal times at currentdate
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : -200
    //                          - max : 10000
    //                          - default : 112.330110409888
    //                          - unit : °C d
    //                          - inputtype : variable
    //            - name: leafNumber
    //                          - description : Actual number of phytomers
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 25
    //                          - default : 0
    //                          - unit : leaf
    //                          - inputtype : variable
    //            - name: calendarMoments
    //                          - description : List containing appearance of each stage
    //                          - variablecategory : state
    //                          - datatype : STRINGLIST
    //                          - default : ['Sowing']
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: calendarDates
    //                          - description : List containing  the dates of the wheat developmental phases
    //                          - variablecategory : state
    //                          - datatype : DATELIST
    //                          - default : ['21/3/2007']
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: calendarCumuls
    //                          - description : list containing for each stage occured its cumulated thermal times
    //                          - variablecategory : state
    //                          - datatype : DOUBLELIST
    //                          - default : [0.0]
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: minTvern
    //                          - description : Minimum temperature for vernalization to occur
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : -20
    //                          - max : 60
    //                          - default : 0.0
    //                          - unit : °C
    //                          - inputtype : parameter
    //            - name: intTvern
    //                          - description : Intermediate temperature for vernalization to occur
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : -20
    //                          - max : 60
    //                          - default :  11.0
    //                          - unit : °C
    //                          - inputtype : parameter
    //            - name: vAI
    //                          - description : Response of vernalization rate to temperature
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 1
    //                          - default :  0.015
    //                          - unit : d-1 °C-1
    //                          - inputtype : parameter
    //            - name: vBEE
    //                          - description : Vernalization rate at 0°C
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 1
    //                          - default : 0.01
    //                          - unit : d-1
    //                          - inputtype : parameter
    //            - name: minDL
    //                          - description : Threshold daylength below which it does influence vernalization rate
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 12
    //                          - max : 24
    //                          - default : 8.0
    //                          - unit : h
    //                          - inputtype : parameter
    //            - name: maxDL
    //                          - description : Saturating photoperiod above which final leaf number is not influenced by daylength
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 24
    //                          - default : 15.0
    //                          - unit : h
    //                          - inputtype : parameter
    //            - name: maxTvern
    //                          - description : Maximum temperature for vernalization to occur
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : -20
    //                          - max : 60
    //                          - default :  23.0
    //                          - unit : °C
    //                          - inputtype : parameter
    //            - name: pNini
    //                          - description : Number of primorida in the apex at emergence
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 24
    //                          - default : 4.0
    //                          - unit : primordia
    //                          - inputtype : parameter
    //            - name: aMXLFNO
    //                          - description : Absolute maximum leaf number
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 25
    //                          - default : 24.0
    //                          - unit : leaf
    //                          - inputtype : parameter
    //            - name: vernaprog
    //                          - description : progression on a 0  to 1 scale of the vernalization
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 1
    //                          - default :  0.5517254187376879
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: currentdate
    //                          - description : current date 
    //                          - variablecategory : auxiliary
    //                          - datatype : DATE
    //                          - default : 27/3/2007
    //                          - inputtype : variable
    //                          - unit : 
    //            - name: isVernalizable
    //                          - description : true if the plant is vernalizable
    //                          - parametercategory : species
    //                          - datatype : INT
    //                          - min : 0
    //                          - max : 1
    //                          - default : 1
    //                          - unit : 
    //                          - inputtype : parameter
    //            - name: minFinalNumber
    //                          - description : minimum final leaf number
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 25
    //                          - default : 5.5
    //                          - unit : leaf
    //                          - inputtype : variable
    //                          - variablecategory : state
        //- outputs:
    //            - name: vernaprog
    //                          - description : progression on a 0  to 1 scale of the vernalization
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : 
    //            - name: minFinalNumber
    //                          - description : minimum final leaf number
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : leaf
    //            - name: calendarMoments
    //                          - description : List containing appearance of each stage
    //                          - variablecategory : state
    //                          - datatype : STRINGLIST
    //                          - unit : 
    //            - name: calendarDates
    //                          - description : List containing  the dates of the wheat developmental phases
    //                          - variablecategory : state
    //                          - datatype : DATELIST
    //                          - unit : 
    //            - name: calendarCumuls
    //                          - description : list containing for each stage occured its cumulated thermal times
    //                          - variablecategory : state
    //                          - datatype : DOUBLELIST
    //                          - unit : 
        double dayLength = a.getdayLength();
        double deltaTT = a.getdeltaTT();
        double cumulTT = a.getcumulTT();
        double leafNumber = s.getleafNumber();
        List<String> calendarMoments = s.getcalendarMoments();
        List<String> calendarDates = s.getcalendarDates();
        List<Double> calendarCumuls = s.getcalendarCumuls();
        double vernaprog = s.getvernaprog();
        String currentdate = a.getcurrentdate();
        double minFinalNumber = s.getminFinalNumber();
        double maxVernaProg;
        double dLverna;
        double primordno;
        double minLeafNumber;
        double potlfno;
        double tt;
        if (isVernalizable == 1 && vernaprog < 1.0d)
        {
            tt = deltaTT;
            if (tt >= minTvern && tt <= intTvern)
            {
                vernaprog = vernaprog + (vAI * tt) + vBEE;
            }
            if (tt > intTvern)
            {
                maxVernaProg = vAI * intTvern + vBEE;
                dLverna = Math.max(minDL, Math.min(maxDL, dayLength));
                vernaprog = vernaprog + Math.max(0.0d, maxVernaProg * (1.0d + ((intTvern - tt) / (maxTvern - intTvern) * ((dLverna - minDL) / (maxDL - minDL)))));
            }
            primordno = 2.0d * leafNumber + pNini;
            minLeafNumber = minFinalNumber;
            if (vernaprog >= 1.0d || primordno >= aMXLFNO)
            {
                minFinalNumber = Math.max(primordno, minFinalNumber);
                calendarMoments.add("EndVernalisation");
                calendarCumuls.add(cumulTT);
                calendarDates.add(currentdate);
                vernaprog = Math.max(1.0d, vernaprog);
            }
            else
            {
                potlfno = aMXLFNO - ((aMXLFNO - minLeafNumber) * vernaprog);
                if (primordno >= potlfno)
                {
                    minFinalNumber = Math.max((potlfno + primordno) / 2.0d, minFinalNumber);
                    vernaprog = Math.max(1.0d, vernaprog);
                    calendarMoments.add("EndVernalisation");
                    calendarCumuls.add(cumulTT);
                    calendarDates.add(currentdate);
                }
            }
        }
        s.setcalendarMoments(calendarMoments);
        s.setcalendarDates(calendarDates);
        s.setcalendarCumuls(calendarCumuls);
        s.setvernaprog(vernaprog);
        s.setminFinalNumber(minFinalNumber);
    }
}