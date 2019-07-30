using System;
using System.Collections.Generic;

public class rate
{
    private double _cropHeatFlux;
    private double _soilHeatFlux;
    private double _evapoTranspirationPriestlyTaylor;
    private double _evapoTranspirationPenman;
    private double _evapoTranspiration;
    
    public rate()
    {
           
    }
    
    
    public rate(rate toCopy, bool copyAll) // copy constructor 
    {
    if (copyAll)
    {
    
    _cropHeatFlux = toCopy._cropHeatFlux;
    _soilHeatFlux = toCopy._soilHeatFlux;
    _evapoTranspirationPriestlyTaylor = toCopy._evapoTranspirationPriestlyTaylor;
    _evapoTranspirationPenman = toCopy._evapoTranspirationPenman;
    _evapoTranspiration = toCopy._evapoTranspiration;
    }
    }
    public double cropHeatFlux
    {
        get
        {
            return this._cropHeatFlux;
        }
        set
        {
            this._cropHeatFlux= value;
        } 
    }
    public double soilHeatFlux
    {
        get
        {
            return this._soilHeatFlux;
        }
        set
        {
            this._soilHeatFlux= value;
        } 
    }
    public double evapoTranspirationPriestlyTaylor
    {
        get
        {
            return this._evapoTranspirationPriestlyTaylor;
        }
        set
        {
            this._evapoTranspirationPriestlyTaylor= value;
        } 
    }
    public double evapoTranspirationPenman
    {
        get
        {
            return this._evapoTranspirationPenman;
        }
        set
        {
            this._evapoTranspirationPenman= value;
        } 
    }
    public double evapoTranspiration
    {
        get
        {
            return this._evapoTranspiration;
        }
        set
        {
            this._evapoTranspiration= value;
        } 
    }
}