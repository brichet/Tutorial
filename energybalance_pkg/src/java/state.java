import  java.io.*;
import  java.util.*;
public class state
{
    private double conductance;
    private double minCanopyTemperature;
    private double maxCanopyTemperature;
    private double diffusionLimitedEvaporation;
    
    public state()
    {
           
    }
    
    public state(state toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.conductance = toCopy.conductance;
            this.minCanopyTemperature = toCopy.minCanopyTemperature;
            this.maxCanopyTemperature = toCopy.maxCanopyTemperature;
            this.diffusionLimitedEvaporation = toCopy.diffusionLimitedEvaporation;
        }
    }
    public double getconductance()
    {
        return conductance;
    }

    public void setconductance(double _conductance)
    {
        this.conductance= _conductance;
    } 
    
    public double getminCanopyTemperature()
    {
        return minCanopyTemperature;
    }

    public void setminCanopyTemperature(double _minCanopyTemperature)
    {
        this.minCanopyTemperature= _minCanopyTemperature;
    } 
    
    public double getmaxCanopyTemperature()
    {
        return maxCanopyTemperature;
    }

    public void setmaxCanopyTemperature(double _maxCanopyTemperature)
    {
        this.maxCanopyTemperature= _maxCanopyTemperature;
    } 
    
    public double getdiffusionLimitedEvaporation()
    {
        return diffusionLimitedEvaporation;
    }

    public void setdiffusionLimitedEvaporation(double _diffusionLimitedEvaporation)
    {
        this.diffusionLimitedEvaporation= _diffusionLimitedEvaporation;
    } 
    
}