import  java.io.*;
import  java.util.*;
public class PhenologyState
{
    private double leafNumber;
    private double finalLeafNumber;
    private double phase;
    private int hasLastPrimordiumAppeared;
    private int hasZadokStageChanged;
    private String currentZadokStage;
    private int tillerNumber;
    private List<Integer> leafTillerNumberArray;
    private double canopyShootNumber;
    private int hasFlagLeafLiguleAppeared;
    private List<Double> tilleringProfile;
    private List<Double> calendarCumuls;
    private List<String> calendarMoments;
    private double pastMaxAI;
    private List<String> calendarDates;
    private double minFinalNumber;
    private double vernaprog;
    private double averageShootNumberPerPlant;
    private double phyllochron;
    private int isMomentRegistredZC_39;
    
    public PhenologyState()
    {
           
    }
    
    public PhenologyState(PhenologyState toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.leafNumber = toCopy.leafNumber;
            this.finalLeafNumber = toCopy.finalLeafNumber;
            this.phase = toCopy.phase;
            this.hasLastPrimordiumAppeared = toCopy.hasLastPrimordiumAppeared;
            this.hasZadokStageChanged = toCopy.hasZadokStageChanged;
            this.currentZadokStage = toCopy.currentZadokStage;
            this.tillerNumber = toCopy.tillerNumber;
            List <Integer> _leafTillerNumberArray = new ArrayList<>();
            for (Integer c : toCopy.leafTillerNumberArray)
            {
                _leafTillerNumberArray.add(c);
            }
            this.leafTillerNumberArray = _leafTillerNumberArray;
            this.canopyShootNumber = toCopy.canopyShootNumber;
            this.hasFlagLeafLiguleAppeared = toCopy.hasFlagLeafLiguleAppeared;
            List <Double> _tilleringProfile = new ArrayList<>();
            for (Double c : toCopy.tilleringProfile)
            {
                _tilleringProfile.add(c);
            }
            this.tilleringProfile = _tilleringProfile;
            List <Double> _calendarCumuls = new ArrayList<>();
            for (Double c : toCopy.calendarCumuls)
            {
                _calendarCumuls.add(c);
            }
            this.calendarCumuls = _calendarCumuls;
            List <String> _calendarMoments = new ArrayList<>();
            for (String c : toCopy.calendarMoments)
            {
                _calendarMoments.add(c);
            }
            this.calendarMoments = _calendarMoments;
            this.pastMaxAI = toCopy.pastMaxAI;
            List <String> _calendarDates = new ArrayList<>();
            for (String c : toCopy.calendarDates)
            {
                _calendarDates.add(c);
            }
            this.calendarDates = _calendarDates;
            this.minFinalNumber = toCopy.minFinalNumber;
            this.vernaprog = toCopy.vernaprog;
            this.averageShootNumberPerPlant = toCopy.averageShootNumberPerPlant;
            this.phyllochron = toCopy.phyllochron;
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
    
    public double getfinalLeafNumber()
    {
        return finalLeafNumber;
    }

    public void setfinalLeafNumber(double _finalLeafNumber)
    {
        this.finalLeafNumber= _finalLeafNumber;
    } 
    
    public double getphase()
    {
        return phase;
    }

    public void setphase(double _phase)
    {
        this.phase= _phase;
    } 
    
    public int gethasLastPrimordiumAppeared()
    {
        return hasLastPrimordiumAppeared;
    }

    public void sethasLastPrimordiumAppeared(int _hasLastPrimordiumAppeared)
    {
        this.hasLastPrimordiumAppeared= _hasLastPrimordiumAppeared;
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
    
    public int gettillerNumber()
    {
        return tillerNumber;
    }

    public void settillerNumber(int _tillerNumber)
    {
        this.tillerNumber= _tillerNumber;
    } 
    
    public List<Integer> getleafTillerNumberArray()
    {
        return leafTillerNumberArray;
    }

    public void setleafTillerNumberArray(List<Integer> _leafTillerNumberArray)
    {
        this.leafTillerNumberArray= _leafTillerNumberArray;
    } 
    
    public double getcanopyShootNumber()
    {
        return canopyShootNumber;
    }

    public void setcanopyShootNumber(double _canopyShootNumber)
    {
        this.canopyShootNumber= _canopyShootNumber;
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
    
    public List<Double> getcalendarCumuls()
    {
        return calendarCumuls;
    }

    public void setcalendarCumuls(List<Double> _calendarCumuls)
    {
        this.calendarCumuls= _calendarCumuls;
    } 
    
    public List<String> getcalendarMoments()
    {
        return calendarMoments;
    }

    public void setcalendarMoments(List<String> _calendarMoments)
    {
        this.calendarMoments= _calendarMoments;
    } 
    
    public double getpastMaxAI()
    {
        return pastMaxAI;
    }

    public void setpastMaxAI(double _pastMaxAI)
    {
        this.pastMaxAI= _pastMaxAI;
    } 
    
    public List<String> getcalendarDates()
    {
        return calendarDates;
    }

    public void setcalendarDates(List<String> _calendarDates)
    {
        this.calendarDates= _calendarDates;
    } 
    
    public double getminFinalNumber()
    {
        return minFinalNumber;
    }

    public void setminFinalNumber(double _minFinalNumber)
    {
        this.minFinalNumber= _minFinalNumber;
    } 
    
    public double getvernaprog()
    {
        return vernaprog;
    }

    public void setvernaprog(double _vernaprog)
    {
        this.vernaprog= _vernaprog;
    } 
    
    public double getaverageShootNumberPerPlant()
    {
        return averageShootNumberPerPlant;
    }

    public void setaverageShootNumberPerPlant(double _averageShootNumberPerPlant)
    {
        this.averageShootNumberPerPlant= _averageShootNumberPerPlant;
    } 
    
    public double getphyllochron()
    {
        return phyllochron;
    }

    public void setphyllochron(double _phyllochron)
    {
        this.phyllochron= _phyllochron;
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