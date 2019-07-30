using System;
using System.Collections.Generic;
public class state
{
    private List<string> _calendarMoments;
    private List<double> _calendarCumuls;
    private int _isMomentRegistredZC_39;
    private double _phyllochron;
    private int _hasFlagLeafLiguleAppeared;
    private double _leafNumber;
    private double _phase;
    private double _pastMaxAI;
    private List<string> _calendarDates;
    private double _finalLeafNumber;
    private string _currentZadokStage;
    private int _hasZadokStageChanged;
    private double _canopyShootNumber;
    private List<double> _tilleringProfile;
    private List<int> _leafTillerNumberArray;
    private int _tillerNumber;
    private double _averageShootNumberPerPlant;
    private double _vernaprog;
    private double _minFinalNumber;
    private int _hasLastPrimordiumAppeared;
    
    public state()
    {
           
    }
    
    
    public state(state toCopy, bool copyAll) // copy constructor 
    {
    if (copyAll)
    {
    
    calendarMoments = new List<string>();
        for (int i = 0; i < toCopy.calendarMoments.Count; i++)
        {
            calendarMoments.Add(toCopy.calendarMoments[i]);
        }
    
    calendarCumuls = new List<double>();
        for (int i = 0; i < toCopy.calendarCumuls.Count; i++)
        {
            calendarCumuls.Add(toCopy.calendarCumuls[i]);
        }
    
    _isMomentRegistredZC_39 = toCopy._isMomentRegistredZC_39;
    _phyllochron = toCopy._phyllochron;
    _hasFlagLeafLiguleAppeared = toCopy._hasFlagLeafLiguleAppeared;
    _leafNumber = toCopy._leafNumber;
    _phase = toCopy._phase;
    _pastMaxAI = toCopy._pastMaxAI;
    calendarDates = new List<string>();
        for (int i = 0; i < toCopy.calendarDates.Count; i++)
        {
            calendarDates.Add(toCopy.calendarDates[i]);
        }
    
    _finalLeafNumber = toCopy._finalLeafNumber;
    _currentZadokStage = toCopy._currentZadokStage;
    _hasZadokStageChanged = toCopy._hasZadokStageChanged;
    _canopyShootNumber = toCopy._canopyShootNumber;
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
    _averageShootNumberPerPlant = toCopy._averageShootNumberPerPlant;
    _vernaprog = toCopy._vernaprog;
    _minFinalNumber = toCopy._minFinalNumber;
    _hasLastPrimordiumAppeared = toCopy._hasLastPrimordiumAppeared;
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
    public List<string> calendarDates
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
}