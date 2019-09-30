import  java.io.*;
import  java.util.*;
public class PhenologyState
{
    private double leafNumber;
    private double minFinalNumber;
    private List<Date> calendarDates;
    private List<String> calendarMoments;
    private double ptq;
    private double gAImean;
    private List<Double> listTTShootWindowForPTQ;
    private double pastMaxAI;
    private List<Double> listGAITTWindowForPTQ;
    private List<Double> listPARTTWindowForPTQ;
    private List<Double> calendarCumuls;
    private double vernaprog;
    private int hasLastPrimordiumAppeared;
    private double phase;
    private double finalLeafNumber;
    private int hasZadokStageChanged;
    private String currentZadokStage;
    private int hasFlagLeafLiguleAppeared;
    private List<Double> tilleringProfile;
    private List<Integer> leafTillerNumberArray;
    private int tillerNumber;
    private double canopyShootNumber;
    private double phyllochron;
    private double averageShootNumberPerPlant;
    private int isMomentRegistredZC_39;
    
    public PhenologyState()
    {
           
    }
    
    public PhenologyState(PhenologyState toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.leafNumber = toCopy.leafNumber;
            this.minFinalNumber = toCopy.minFinalNumber;
            List <Date> _calendarDates = new ArrayList<>();
            for (Date c : toCopy.calendarDates)
            {
                _calendarDates.add(c);
            }
            this.calendarDates = _calendarDates;
            List <String> _calendarMoments = new ArrayList<>();
            for (String c : toCopy.calendarMoments)
            {
                _calendarMoments.add(c);
            }
            this.calendarMoments = _calendarMoments;
            this.ptq = toCopy.ptq;
            this.gAImean = toCopy.gAImean;
            List <Double> _listTTShootWindowForPTQ = new ArrayList<>();
            for (Double c : toCopy.listTTShootWindowForPTQ)
            {
                _listTTShootWindowForPTQ.add(c);
            }
            this.listTTShootWindowForPTQ = _listTTShootWindowForPTQ;
            this.pastMaxAI = toCopy.pastMaxAI;
            List <Double> _listGAITTWindowForPTQ = new ArrayList<>();
            for (Double c : toCopy.listGAITTWindowForPTQ)
            {
                _listGAITTWindowForPTQ.add(c);
            }
            this.listGAITTWindowForPTQ = _listGAITTWindowForPTQ;
            List <Double> _listPARTTWindowForPTQ = new ArrayList<>();
            for (Double c : toCopy.listPARTTWindowForPTQ)
            {
                _listPARTTWindowForPTQ.add(c);
            }
            this.listPARTTWindowForPTQ = _listPARTTWindowForPTQ;
            List <Double> _calendarCumuls = new ArrayList<>();
            for (Double c : toCopy.calendarCumuls)
            {
                _calendarCumuls.add(c);
            }
            this.calendarCumuls = _calendarCumuls;
            this.vernaprog = toCopy.vernaprog;
            this.hasLastPrimordiumAppeared = toCopy.hasLastPrimordiumAppeared;
            this.phase = toCopy.phase;
            this.finalLeafNumber = toCopy.finalLeafNumber;
            this.hasZadokStageChanged = toCopy.hasZadokStageChanged;
            this.currentZadokStage = toCopy.currentZadokStage;
            this.hasFlagLeafLiguleAppeared = toCopy.hasFlagLeafLiguleAppeared;
            List <Double> _tilleringProfile = new ArrayList<>();
            for (Double c : toCopy.tilleringProfile)
            {
                _tilleringProfile.add(c);
            }
            this.tilleringProfile = _tilleringProfile;
            List <Integer> _leafTillerNumberArray = new ArrayList<>();
            for (Integer c : toCopy.leafTillerNumberArray)
            {
                _leafTillerNumberArray.add(c);
            }
            this.leafTillerNumberArray = _leafTillerNumberArray;
            this.tillerNumber = toCopy.tillerNumber;
            this.canopyShootNumber = toCopy.canopyShootNumber;
            this.phyllochron = toCopy.phyllochron;
            this.averageShootNumberPerPlant = toCopy.averageShootNumberPerPlant;
            this.isMomentRegistredZC_39 = toCopy.isMomentRegistredZC_39;
        }
    }
    public double getleafNumber()
    {
        return leafNumber;
    }

    public void setleafNumber(double _leafNumber)
    {
        this.leafNumber= _leafNumber;
    } 
    
    public double getminFinalNumber()
    {
        return minFinalNumber;
    }

    public void setminFinalNumber(double _minFinalNumber)
    {
        this.minFinalNumber= _minFinalNumber;
    } 
    
    public List<Date> getcalendarDates()
    {
        return calendarDates;
    }

    public void setcalendarDates(List<Date> _calendarDates)
    {
        this.calendarDates= _calendarDates;
    } 
    
    public List<String> getcalendarMoments()
    {
        return calendarMoments;
    }

    public void setcalendarMoments(List<String> _calendarMoments)
    {
        this.calendarMoments= _calendarMoments;
    } 
    
    public double getptq()
    {
        return ptq;
    }

    public void setptq(double _ptq)
    {
        this.ptq= _ptq;
    } 
    
    public double getgAImean()
    {
        return gAImean;
    }

    public void setgAImean(double _gAImean)
    {
        this.gAImean= _gAImean;
    } 
    
    public List<Double> getlistTTShootWindowForPTQ()
    {
        return listTTShootWindowForPTQ;
    }

    public void setlistTTShootWindowForPTQ(List<Double> _listTTShootWindowForPTQ)
    {
        this.listTTShootWindowForPTQ= _listTTShootWindowForPTQ;
    } 
    
    public double getpastMaxAI()
    {
        return pastMaxAI;
    }

    public void setpastMaxAI(double _pastMaxAI)
    {
        this.pastMaxAI= _pastMaxAI;
    } 
    
    public List<Double> getlistGAITTWindowForPTQ()
    {
        return listGAITTWindowForPTQ;
    }

    public void setlistGAITTWindowForPTQ(List<Double> _listGAITTWindowForPTQ)
    {
        this.listGAITTWindowForPTQ= _listGAITTWindowForPTQ;
    } 
    
    public List<Double> getlistPARTTWindowForPTQ()
    {
        return listPARTTWindowForPTQ;
    }

    public void setlistPARTTWindowForPTQ(List<Double> _listPARTTWindowForPTQ)
    {
        this.listPARTTWindowForPTQ= _listPARTTWindowForPTQ;
    } 
    
    public List<Double> getcalendarCumuls()
    {
        return calendarCumuls;
    }

    public void setcalendarCumuls(List<Double> _calendarCumuls)
    {
        this.calendarCumuls= _calendarCumuls;
    } 
    
    public double getvernaprog()
    {
        return vernaprog;
    }

    public void setvernaprog(double _vernaprog)
    {
        this.vernaprog= _vernaprog;
    } 
    
    public int gethasLastPrimordiumAppeared()
    {
        return hasLastPrimordiumAppeared;
    }

    public void sethasLastPrimordiumAppeared(int _hasLastPrimordiumAppeared)
    {
        this.hasLastPrimordiumAppeared= _hasLastPrimordiumAppeared;
    } 
    
    public double getphase()
    {
        return phase;
    }

    public void setphase(double _phase)
    {
        this.phase= _phase;
    } 
    
    public double getfinalLeafNumber()
    {
        return finalLeafNumber;
    }

    public void setfinalLeafNumber(double _finalLeafNumber)
    {
        this.finalLeafNumber= _finalLeafNumber;
    } 
    
    public int gethasZadokStageChanged()
    {
        return hasZadokStageChanged;
    }

    public void sethasZadokStageChanged(int _hasZadokStageChanged)
    {
        this.hasZadokStageChanged= _hasZadokStageChanged;
    } 
    
    public String getcurrentZadokStage()
    {
        return currentZadokStage;
    }

    public void setcurrentZadokStage(String _currentZadokStage)
    {
        this.currentZadokStage= _currentZadokStage;
    } 
    
    public int gethasFlagLeafLiguleAppeared()
    {
        return hasFlagLeafLiguleAppeared;
    }

    public void sethasFlagLeafLiguleAppeared(int _hasFlagLeafLiguleAppeared)
    {
        this.hasFlagLeafLiguleAppeared= _hasFlagLeafLiguleAppeared;
    } 
    
    public List<Double> gettilleringProfile()
    {
        return tilleringProfile;
    }

    public void settilleringProfile(List<Double> _tilleringProfile)
    {
        this.tilleringProfile= _tilleringProfile;
    } 
    
    public List<Integer> getleafTillerNumberArray()
    {
        return leafTillerNumberArray;
    }

    public void setleafTillerNumberArray(List<Integer> _leafTillerNumberArray)
    {
        this.leafTillerNumberArray= _leafTillerNumberArray;
    } 
    
    public int gettillerNumber()
    {
        return tillerNumber;
    }

    public void settillerNumber(int _tillerNumber)
    {
        this.tillerNumber= _tillerNumber;
    } 
    
    public double getcanopyShootNumber()
    {
        return canopyShootNumber;
    }

    public void setcanopyShootNumber(double _canopyShootNumber)
    {
        this.canopyShootNumber= _canopyShootNumber;
    } 
    
    public double getphyllochron()
    {
        return phyllochron;
    }

    public void setphyllochron(double _phyllochron)
    {
        this.phyllochron= _phyllochron;
    } 
    
    public double getaverageShootNumberPerPlant()
    {
        return averageShootNumberPerPlant;
    }

    public void setaverageShootNumberPerPlant(double _averageShootNumberPerPlant)
    {
        this.averageShootNumberPerPlant= _averageShootNumberPerPlant;
    } 
    
    public int getisMomentRegistredZC_39()
    {
        return isMomentRegistredZC_39;
    }

    public void setisMomentRegistredZC_39(int _isMomentRegistredZC_39)
    {
        this.isMomentRegistredZC_39= _isMomentRegistredZC_39;
    } 
    
}