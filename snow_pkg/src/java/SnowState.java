import  java.io.*;
import  java.util.*;
import java.time.LocalDateTime;
public class SnowState
{
    private double tmaxrec;
    private double ps;
    private double Swet;
    private double Snowmelt;
    private double Sdry;
    private double Sdepth;
    private double tminrec;
    private double preciprec;
    private double Sdepth_cm;
    
    public SnowState() { }
    
    public SnowState(SnowState toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.tmaxrec = toCopy.tmaxrec;
            this.ps = toCopy.ps;
            this.Swet = toCopy.Swet;
            this.Snowmelt = toCopy.Snowmelt;
            this.Sdry = toCopy.Sdry;
            this.Sdepth = toCopy.Sdepth;
            this.tminrec = toCopy.tminrec;
            this.preciprec = toCopy.preciprec;
            this.Sdepth_cm = toCopy.Sdepth_cm;
        }
    }
    public double gettmaxrec()
    { return tmaxrec; }

    public void settmaxrec(double _tmaxrec)
    { this.tmaxrec= _tmaxrec; } 
    
    public double getps()
    { return ps; }

    public void setps(double _ps)
    { this.ps= _ps; } 
    
    public double getSwet()
    { return Swet; }

    public void setSwet(double _Swet)
    { this.Swet= _Swet; } 
    
    public double getSnowmelt()
    { return Snowmelt; }

    public void setSnowmelt(double _Snowmelt)
    { this.Snowmelt= _Snowmelt; } 
    
    public double getSdry()
    { return Sdry; }

    public void setSdry(double _Sdry)
    { this.Sdry= _Sdry; } 
    
    public double getSdepth()
    { return Sdepth; }

    public void setSdepth(double _Sdepth)
    { this.Sdepth= _Sdepth; } 
    
    public double gettminrec()
    { return tminrec; }

    public void settminrec(double _tminrec)
    { this.tminrec= _tminrec; } 
    
    public double getpreciprec()
    { return preciprec; }

    public void setpreciprec(double _preciprec)
    { this.preciprec= _preciprec; } 
    
    public double getSdepth_cm()
    { return Sdepth_cm; }

    public void setSdepth_cm(double _Sdepth_cm)
    { this.Sdepth_cm= _Sdepth_cm; } 
    
}