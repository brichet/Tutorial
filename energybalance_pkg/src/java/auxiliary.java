import  java.io.*;
import  java.util.*;

public class auxiliary
{
    private double minTair;
    private double maxTair;
    private double plantHeight;
    private double wind;
    private double netRadiationEquivalentEvaporation;
    private double deficitOnTopLayers;
    private double solarRadiation;
    private double vaporPressure;
    private double extraSolarRadiation;
    private double netRadiation;
    private double netOutGoingLongWaveRadiation;
    private double hslope;
    private double VPDair;
    private double energyLimitedEvaporation;
    private double soilEvaporation;
    
    public auxiliary()
    {
           
    }
    
    public auxiliary(auxiliary toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.minTair = toCopy.minTair;
            this.maxTair = toCopy.maxTair;
            this.plantHeight = toCopy.plantHeight;
            this.wind = toCopy.wind;
            this.netRadiationEquivalentEvaporation = toCopy.netRadiationEquivalentEvaporation;
            this.deficitOnTopLayers = toCopy.deficitOnTopLayers;
            this.solarRadiation = toCopy.solarRadiation;
            this.vaporPressure = toCopy.vaporPressure;
            this.extraSolarRadiation = toCopy.extraSolarRadiation;
            this.netRadiation = toCopy.netRadiation;
            this.netOutGoingLongWaveRadiation = toCopy.netOutGoingLongWaveRadiation;
            this.hslope = toCopy.hslope;
            this.VPDair = toCopy.VPDair;
            this.energyLimitedEvaporation = toCopy.energyLimitedEvaporation;
            this.soilEvaporation = toCopy.soilEvaporation;
        }
    }
    public double getminTair()
    {
        return minTair;
    }

    public void setminTair(double _minTair)
    {
        this.minTair= _minTair;
    } 
    
    public double getmaxTair()
    {
        return maxTair;
    }

    public void setmaxTair(double _maxTair)
    {
        this.maxTair= _maxTair;
    } 
    
    public double getplantHeight()
    {
        return plantHeight;
    }

    public void setplantHeight(double _plantHeight)
    {
        this.plantHeight= _plantHeight;
    } 
    
    public double getwind()
    {
        return wind;
    }

    public void setwind(double _wind)
    {
        this.wind= _wind;
    } 
    
    public double getnetRadiationEquivalentEvaporation()
    {
        return netRadiationEquivalentEvaporation;
    }

    public void setnetRadiationEquivalentEvaporation(double _netRadiationEquivalentEvaporation)
    {
        this.netRadiationEquivalentEvaporation= _netRadiationEquivalentEvaporation;
    } 
    
    public double getdeficitOnTopLayers()
    {
        return deficitOnTopLayers;
    }

    public void setdeficitOnTopLayers(double _deficitOnTopLayers)
    {
        this.deficitOnTopLayers= _deficitOnTopLayers;
    } 
    
    public double getsolarRadiation()
    {
        return solarRadiation;
    }

    public void setsolarRadiation(double _solarRadiation)
    {
        this.solarRadiation= _solarRadiation;
    } 
    
    public double getvaporPressure()
    {
        return vaporPressure;
    }

    public void setvaporPressure(double _vaporPressure)
    {
        this.vaporPressure= _vaporPressure;
    } 
    
    public double getextraSolarRadiation()
    {
        return extraSolarRadiation;
    }

    public void setextraSolarRadiation(double _extraSolarRadiation)
    {
        this.extraSolarRadiation= _extraSolarRadiation;
    } 
    
    public double getnetRadiation()
    {
        return netRadiation;
    }

    public void setnetRadiation(double _netRadiation)
    {
        this.netRadiation= _netRadiation;
    } 
    
    public double getnetOutGoingLongWaveRadiation()
    {
        return netOutGoingLongWaveRadiation;
    }

    public void setnetOutGoingLongWaveRadiation(double _netOutGoingLongWaveRadiation)
    {
        this.netOutGoingLongWaveRadiation= _netOutGoingLongWaveRadiation;
    } 
    
    public double gethslope()
    {
        return hslope;
    }

    public void sethslope(double _hslope)
    {
        this.hslope= _hslope;
    } 
    
    public double getVPDair()
    {
        return VPDair;
    }

    public void setVPDair(double _VPDair)
    {
        this.VPDair= _VPDair;
    } 
    
    public double getenergyLimitedEvaporation()
    {
        return energyLimitedEvaporation;
    }

    public void setenergyLimitedEvaporation(double _energyLimitedEvaporation)
    {
        this.energyLimitedEvaporation= _energyLimitedEvaporation;
    } 
    
    public double getsoilEvaporation()
    {
        return soilEvaporation;
    }

    public void setsoilEvaporation(double _soilEvaporation)
    {
        this.soilEvaporation= _soilEvaporation;
    } 
    
}