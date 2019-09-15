import  java.io.*;
import  java.util.*;

public class PhenologyAuxiliary
{
    private double gai;
    private double grainCumulTT;
    private double cumulTT;
    private double dayLength;
    private double deltaTT;
    private String currentdate;
    private double cumulTTFromZC_65;
    private double fixPhyll;
    private double cumulTTFromZC_39;
    private double cumulTTFromZC_91;
    
    public PhenologyAuxiliary()
    {
           
    }
    
    public PhenologyAuxiliary(PhenologyAuxiliary toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.gai = toCopy.gai;
            this.grainCumulTT = toCopy.grainCumulTT;
            this.cumulTT = toCopy.cumulTT;
            this.dayLength = toCopy.dayLength;
            this.deltaTT = toCopy.deltaTT;
            this.currentdate = toCopy.currentdate;
            this.cumulTTFromZC_65 = toCopy.cumulTTFromZC_65;
            this.fixPhyll = toCopy.fixPhyll;
            this.cumulTTFromZC_39 = toCopy.cumulTTFromZC_39;
            this.cumulTTFromZC_91 = toCopy.cumulTTFromZC_91;
        }
    }
    public double getgai()
    {
        return gai;
    }

    public void setgai(double _gai)
    {
        this.gai= _gai;
    } 
    
    public double getgrainCumulTT()
    {
        return grainCumulTT;
    }

    public void setgrainCumulTT(double _grainCumulTT)
    {
        this.grainCumulTT= _grainCumulTT;
    } 
    
    public double getcumulTT()
    {
        return cumulTT;
    }

    public void setcumulTT(double _cumulTT)
    {
        this.cumulTT= _cumulTT;
    } 
    
    public double getdayLength()
    {
        return dayLength;
    }

    public void setdayLength(double _dayLength)
    {
        this.dayLength= _dayLength;
    } 
    
    public double getdeltaTT()
    {
        return deltaTT;
    }

    public void setdeltaTT(double _deltaTT)
    {
        this.deltaTT= _deltaTT;
    } 
    
    public String getcurrentdate()
    {
        return currentdate;
    }

    public void setcurrentdate(String _currentdate)
    {
        this.currentdate= _currentdate;
    } 
    
    public double getcumulTTFromZC_65()
    {
        return cumulTTFromZC_65;
    }

    public void setcumulTTFromZC_65(double _cumulTTFromZC_65)
    {
        this.cumulTTFromZC_65= _cumulTTFromZC_65;
    } 
    
    public double getfixPhyll()
    {
        return fixPhyll;
    }

    public void setfixPhyll(double _fixPhyll)
    {
        this.fixPhyll= _fixPhyll;
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
    
}