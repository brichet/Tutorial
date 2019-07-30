import  java.io.*;
import  java.util.*;

public class rate
{
    private double cropHeatFlux;
    private double soilHeatFlux;
    private double evapoTranspirationPriestlyTaylor;
    private double evapoTranspirationPenman;
    private double evapoTranspiration;
    
    public rate()
    {
           
    }
    
    public rate(rate toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.cropHeatFlux = toCopy.cropHeatFlux;
            this.soilHeatFlux = toCopy.soilHeatFlux;
            this.evapoTranspirationPriestlyTaylor = toCopy.evapoTranspirationPriestlyTaylor;
            this.evapoTranspirationPenman = toCopy.evapoTranspirationPenman;
            this.evapoTranspiration = toCopy.evapoTranspiration;
        }
    }
    public double getcropHeatFlux()
    {
        return cropHeatFlux;
    }

    public void setcropHeatFlux(double _cropHeatFlux)
    {
        this.cropHeatFlux= _cropHeatFlux;
    } 
    
    public double getsoilHeatFlux()
    {
        return soilHeatFlux;
    }

    public void setsoilHeatFlux(double _soilHeatFlux)
    {
        this.soilHeatFlux= _soilHeatFlux;
    } 
    
    public double getevapoTranspirationPriestlyTaylor()
    {
        return evapoTranspirationPriestlyTaylor;
    }

    public void setevapoTranspirationPriestlyTaylor(double _evapoTranspirationPriestlyTaylor)
    {
        this.evapoTranspirationPriestlyTaylor= _evapoTranspirationPriestlyTaylor;
    } 
    
    public double getevapoTranspirationPenman()
    {
        return evapoTranspirationPenman;
    }

    public void setevapoTranspirationPenman(double _evapoTranspirationPenman)
    {
        this.evapoTranspirationPenman= _evapoTranspirationPenman;
    } 
    
    public double getevapoTranspiration()
    {
        return evapoTranspiration;
    }

    public void setevapoTranspiration(double _evapoTranspiration)
    {
        this.evapoTranspiration= _evapoTranspiration;
    } 
    
}