using System;
using System.Collections.Generic;
public class PhenologyState
{
    private double _leafNumber;
    private double _minFinalNumber;
    private List<DateTime> _calendarDates;
    private List<string> _calendarMoments;
    private double _ptq;
    private double _gAImean;
    private List<double> _listTTShootWindowForPTQ;
    private double _pastMaxAI;
    private List<double> _listGAITTWindowForPTQ;
    private List<double> _listPARTTWindowForPTQ;
    private List<double> _calendarCumuls;
    private double _vernaprog;
    private int _hasLastPrimordiumAppeared;
    private double _phase;
    private double _finalLeafNumber;
    private int _hasZadokStageChanged;
    private string _currentZadokStage;
    private int _hasFlagLeafLiguleAppeared;
    private List<double> _tilleringProfile;
    private List<int> _leafTillerNumberArray;
    private int _tillerNumber;
    private double _canopyShootNumber;
    private double _phyllochron;
    private double _averageShootNumberPerPlant;
    private int _isMomentRegistredZC_39;
    
    public PhenologyState()
    {
           
    }
    
    
    public PhenologyState(PhenologyState toCopy, bool copyAll) // copy constructor 
    {
    if (copyAll)
    {
    
    _leafNumber = toCopy._leafNumber;
    _minFinalNumber = toCopy._minFinalNumber;
    calendarDates = new List<DateTime>();
        for (int i = 0; i < toCopy.calendarDates.Count; i++)
        {
            calendarDates.Add(toCopy.calendarDates[i]);
        }
    
    calendarMoments = new List<string>();
        for (int i = 0; i < toCopy.calendarMoments.Count; i++)
        {
            calendarMoments.Add(toCopy.calendarMoments[i]);
        }
    
    _ptq = toCopy._ptq;
    _gAImean = toCopy._gAImean;
    listTTShootWindowForPTQ = new List<double>();
        for (int i = 0; i < toCopy.listTTShootWindowForPTQ.Count; i++)
        {
            listTTShootWindowForPTQ.Add(toCopy.listTTShootWindowForPTQ[i]);
        }
    
    _pastMaxAI = toCopy._pastMaxAI;
    listGAITTWindowForPTQ = new List<double>();
        for (int i = 0; i < toCopy.listGAITTWindowForPTQ.Count; i++)
        {
            listGAITTWindowForPTQ.Add(toCopy.listGAITTWindowForPTQ[i]);
        }
    
    listPARTTWindowForPTQ = new List<double>();
        for (int i = 0; i < toCopy.listPARTTWindowForPTQ.Count; i++)
        {
            listPARTTWindowForPTQ.Add(toCopy.listPARTTWindowForPTQ[i]);
        }
    
    calendarCumuls = new List<double>();
        for (int i = 0; i < toCopy.calendarCumuls.Count; i++)
        {
            calendarCumuls.Add(toCopy.calendarCumuls[i]);
        }
    
    _vernaprog = toCopy._vernaprog;
    _hasLastPrimordiumAppeared = toCopy._hasLastPrimordiumAppeared;
    _phase = toCopy._phase;
    _finalLeafNumber = toCopy._finalLeafNumber;
    _hasZadokStageChanged = toCopy._hasZadokStageChanged;
    _currentZadokStage = toCopy._currentZadokStage;
    _hasFlagLeafLiguleAppeared = toCopy._hasFlagLeafLiguleAppeared;
    tilleringProfile = new List<double>();
        for (int i = 0; i < toCopy.tilleringProfile.Count; i++)
        {
            tilleringProfile.Add(toCopy.tilleringProfile[i]);
        }
    
    leafTillerNumberArray = new List<int>();
        for (int i = 0; i < toCopy.leafTillerNumberArray.Count; i++)
        {
            leafTillerNumberArray.Add(toCopy.leafTillerNumberArray[i]);
        }
    
    _tillerNumber = toCopy._tillerNumber;
    _canopyShootNumber = toCopy._canopyShootNumber;
    _phyllochron = toCopy._phyllochron;
    _averageShootNumberPerPlant = toCopy._averageShootNumberPerPlant;
    _isMomentRegistredZC_39 = toCopy._isMomentRegistredZC_39;
    }
    }
    public double leafNumber
    {
        get
        {
            return this._leafNumber;
        }
        set
        {
            this._leafNumber= value;
        } 
    }
    public double minFinalNumber
    {
        get
        {
            return this._minFinalNumber;
        }
        set
        {
            this._minFinalNumber= value;
        } 
    }
    public List<DateTime> calendarDates
    {
        get
        {
            return this._calendarDates;
        }
        set
        {
            this._calendarDates= value;
        } 
    }
    public List<string> calendarMoments
    {
        get
        {
            return this._calendarMoments;
        }
        set
        {
            this._calendarMoments= value;
        } 
    }
    public double ptq
    {
        get
        {
            return this._ptq;
        }
        set
        {
            this._ptq= value;
        } 
    }
    public double gAImean
    {
        get
        {
            return this._gAImean;
        }
        set
        {
            this._gAImean= value;
        } 
    }
    public List<double> listTTShootWindowForPTQ
    {
        get
        {
            return this._listTTShootWindowForPTQ;
        }
        set
        {
            this._listTTShootWindowForPTQ= value;
        } 
    }
    public double pastMaxAI
    {
        get
        {
            return this._pastMaxAI;
        }
        set
        {
            this._pastMaxAI= value;
        } 
    }
    public List<double> listGAITTWindowForPTQ
    {
        get
        {
            return this._listGAITTWindowForPTQ;
        }
        set
        {
            this._listGAITTWindowForPTQ= value;
        } 
    }
    public List<double> listPARTTWindowForPTQ
    {
        get
        {
            return this._listPARTTWindowForPTQ;
        }
        set
        {
            this._listPARTTWindowForPTQ= value;
        } 
    }
    public List<double> calendarCumuls
    {
        get
        {
            return this._calendarCumuls;
        }
        set
        {
            this._calendarCumuls= value;
        } 
    }
    public double vernaprog
    {
        get
        {
            return this._vernaprog;
        }
        set
        {
            this._vernaprog= value;
        } 
    }
    public int hasLastPrimordiumAppeared
    {
        get
        {
            return this._hasLastPrimordiumAppeared;
        }
        set
        {
            this._hasLastPrimordiumAppeared= value;
        } 
    }
    public double phase
    {
        get
        {
            return this._phase;
        }
        set
        {
            this._phase= value;
        } 
    }
    public double finalLeafNumber
    {
        get
        {
            return this._finalLeafNumber;
        }
        set
        {
            this._finalLeafNumber= value;
        } 
    }
    public int hasZadokStageChanged
    {
        get
        {
            return this._hasZadokStageChanged;
        }
        set
        {
            this._hasZadokStageChanged= value;
        } 
    }
    public string currentZadokStage
    {
        get
        {
            return this._currentZadokStage;
        }
        set
        {
            this._currentZadokStage= value;
        } 
    }
    public int hasFlagLeafLiguleAppeared
    {
        get
        {
            return this._hasFlagLeafLiguleAppeared;
        }
        set
        {
            this._hasFlagLeafLiguleAppeared= value;
        } 
    }
    public List<double> tilleringProfile
    {
        get
        {
            return this._tilleringProfile;
        }
        set
        {
            this._tilleringProfile= value;
        } 
    }
    public List<int> leafTillerNumberArray
    {
        get
        {
            return this._leafTillerNumberArray;
        }
        set
        {
            this._leafTillerNumberArray= value;
        } 
    }
    public int tillerNumber
    {
        get
        {
            return this._tillerNumber;
        }
        set
        {
            this._tillerNumber= value;
        } 
    }
    public double canopyShootNumber
    {
        get
        {
            return this._canopyShootNumber;
        }
        set
        {
            this._canopyShootNumber= value;
        } 
    }
    public double phyllochron
    {
        get
        {
            return this._phyllochron;
        }
        set
        {
            this._phyllochron= value;
        } 
    }
    public double averageShootNumberPerPlant
    {
        get
        {
            return this._averageShootNumberPerPlant;
        }
        set
        {
            this._averageShootNumberPerPlant= value;
        } 
    }
    public int isMomentRegistredZC_39
    {
        get
        {
            return this._isMomentRegistredZC_39;
        }
        set
        {
            this._isMomentRegistredZC_39= value;
        } 
    }
}