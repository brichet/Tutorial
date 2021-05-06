using System;
using System.Collections.Generic;

public class SnowRate 
{
    private double _Mrf;
    private double _Snowaccu;
    private double _M;
    
    public SnowRate() { }
    
    
    public SnowRate(SnowRate toCopy, bool copyAll) // copy constructor 
    {
    if (copyAll)
    {
    
    _Mrf = toCopy._Mrf;
    _Snowaccu = toCopy._Snowaccu;
    _M = toCopy._M;
    }
    }
    public double Mrf
        {
            get { return this._Mrf; }
            set { this._Mrf= value; } 
        }
    public double Snowaccu
        {
            get { return this._Snowaccu; }
            set { this._Snowaccu= value; } 
        }
    public double M
        {
            get { return this._M; }
            set { this._M= value; } 
        }
}