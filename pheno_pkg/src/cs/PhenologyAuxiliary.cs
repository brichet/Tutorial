using System;
using System.Collections.Generic;

public class PhenologyAuxiliary
{
    private double _gai;
    private double _grainCumulTT;
    private double _cumulTT;
    private double _dayLength;
    private double _deltaTT;
    private string _currentdate;
    private double _cumulTTFromZC_65;
    private double _fixPhyll;
    private double _cumulTTFromZC_39;
    private double _cumulTTFromZC_91;
    
    public PhenologyAuxiliary()
    {
           
    }
    
    
    public PhenologyAuxiliary(PhenologyAuxiliary toCopy, bool copyAll) // copy constructor 
    {
    if (copyAll)
    {
    
    _gai = toCopy._gai;
    _grainCumulTT = toCopy._grainCumulTT;
    _cumulTT = toCopy._cumulTT;
    _dayLength = toCopy._dayLength;
    _deltaTT = toCopy._deltaTT;
    _currentdate = toCopy._currentdate;
    _cumulTTFromZC_65 = toCopy._cumulTTFromZC_65;
    _fixPhyll = toCopy._fixPhyll;
    _cumulTTFromZC_39 = toCopy._cumulTTFromZC_39;
    _cumulTTFromZC_91 = toCopy._cumulTTFromZC_91;
    }
    }
    public double gai
    {
        get
        {
            return this._gai;
        }
        set
        {
            this._gai= value;
        } 
    }
    public double grainCumulTT
    {
        get
        {
            return this._grainCumulTT;
        }
        set
        {
            this._grainCumulTT= value;
        } 
    }
    public double cumulTT
    {
        get
        {
            return this._cumulTT;
        }
        set
        {
            this._cumulTT= value;
        } 
    }
    public double dayLength
    {
        get
        {
            return this._dayLength;
        }
        set
        {
            this._dayLength= value;
        } 
    }
    public double deltaTT
    {
        get
        {
            return this._deltaTT;
        }
        set
        {
            this._deltaTT= value;
        } 
    }
    public string currentdate
    {
        get
        {
            return this._currentdate;
        }
        set
        {
            this._currentdate= value;
        } 
    }
    public double cumulTTFromZC_65
    {
        get
        {
            return this._cumulTTFromZC_65;
        }
        set
        {
            this._cumulTTFromZC_65= value;
        } 
    }
    public double fixPhyll
    {
        get
        {
            return this._fixPhyll;
        }
        set
        {
            this._fixPhyll= value;
        } 
    }
    public double cumulTTFromZC_39
    {
        get
        {
            return this._cumulTTFromZC_39;
        }
        set
        {
            this._cumulTTFromZC_39= value;
        } 
    }
    public double cumulTTFromZC_91
    {
        get
        {
            return this._cumulTTFromZC_91;
        }
        set
        {
            this._cumulTTFromZC_91= value;
        } 
    }
}