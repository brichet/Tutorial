import  java.io.*;
import  java.util.*;
import java.time.LocalDateTime;

public class SnowRate
{
    private double Mrf;
    private double Snowaccu;
    private double M;
    
    public SnowRate() { }
    
    public SnowRate(SnowRate toCopy, boolean copyAll) // copy constructor 
    {
        if (copyAll)
        {
            this.Mrf = toCopy.Mrf;
            this.Snowaccu = toCopy.Snowaccu;
            this.M = toCopy.M;
        }
    }
    public double getMrf()
    { return Mrf; }

    public void setMrf(double _Mrf)
    { this.Mrf= _Mrf; } 
    
    public double getSnowaccu()
    { return Snowaccu; }

    public void setSnowaccu(double _Snowaccu)
    { this.Snowaccu= _Snowaccu; } 
    
    public double getM()
    { return M; }

    public void setM(double _M)
    { this.M= _M; } 
    
}