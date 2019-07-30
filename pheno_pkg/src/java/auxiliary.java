import  java.io.*;
import  java.util.*;

public class auxiliary
{
    private double cumulTT;
    private double cumulTTFromZC_65;
    private double cumulTTFromZC_39;
    private double cumulTTFromZC_91;
    private double deltaTT;
    private double fixPhyll;
    private double gai;
    private String currentdate;
    private double grainCumulTT;
    private double dayLength;
    
    public auxiliary()
    {
           
    }
    
    public auxiliary(auxiliary toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.cumulTT = toCopy.cumulTT;
            this.cumulTTFromZC_65 = toCopy.cumulTTFromZC_65;
            this.cumulTTFromZC_39 = toCopy.cumulTTFromZC_39;
            this.cumulTTFromZC_91 = toCopy.cumulTTFromZC_91;
            this.deltaTT = toCopy.deltaTT;
            this.fixPhyll = toCopy.fixPhyll;
            this.gai = toCopy.gai;
            this.currentdate = toCopy.currentdate;
            this.grainCumulTT = toCopy.grainCumulTT;
            this.dayLength = toCopy.dayLength;
        }
    }
    public double getcumulTT()
    {
        return cumulTT;
    }

    public void setcumulTT(double _cumulTT)
    {
        this.cumulTT= _cumulTT;
    } 
    
    public double getcumulTTFromZC_65()
    {
        return cumulTTFromZC_65;
    }

    public void setcumulTTFromZC_65(double _cumulTTFromZC_65)
    {
        this.cumulTTFromZC_65= _cumulTTFromZC_65;
    } 
    
    public double getcumulTTFromZC_39()
    {
        return cumulTTFromZC_39;
    }

    public void setcumulTTFromZC_39(double _cumulTTFromZC_39)
    {
        this.cumulTTFromZC_39= _cumulTTFromZC_39;
    } 
    
    public double getcumulTTFromZC_91()
    {
        return cumulTTFromZC_91;
    }

    public void setcumulTTFromZC_91(double _cumulTTFromZC_91)
    {
        this.cumulTTFromZC_91= _cumulTTFromZC_91;
    } 
    
    public double getdeltaTT()
    {
        return deltaTT;
    }

    public void setdeltaTT(double _deltaTT)
    {
        this.deltaTT= _deltaTT;
    } 
    
    public double getfixPhyll()
    {
        return fixPhyll;
    }

    public void setfixPhyll(double _fixPhyll)
    {
        this.fixPhyll= _fixPhyll;
    } 
    
    public double getgai()
    {
        return gai;
    }

    public void setgai(double _gai)
    {
        this.gai= _gai;
    } 
    
    public String getcurrentdate()
    {
        return currentdate;
    }

    public void setcurrentdate(String _currentdate)
    {
        this.currentdate= _currentdate;
    } 
    
    public double getgrainCumulTT()
    {
        return grainCumulTT;
    }

    public void setgrainCumulTT(double _grainCumulTT)
    {
        this.grainCumulTT= _grainCumulTT;
    } 
    
    public double getdayLength()
    {
        return dayLength;
    }

    public void setdayLength(double _dayLength)
    {
        this.dayLength= _dayLength;
    } 
    
}