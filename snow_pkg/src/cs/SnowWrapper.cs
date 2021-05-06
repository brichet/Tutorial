using System;
using System.Collections.Generic;
using System.Linq;
class SnowWrapper
{
    private SnowState s;
    private SnowRate r;
    private SnowAuxiliary a;
    private SnowComponent snowComponent;

    public SnowWrapper()
    {
        s = new SnowState();
        r = new SnowRate();
        a = new SnowAuxiliary();
        snowComponent = new SnowComponent();
        loadParameters();
    }

        double tmaxseuil = 0.0d;
    double tminseuil = 0.0d;
    double prof = 0.0d;
    double E = 0.0d;
    double rho = 100.0d;
    double Pns = 100.0d;
    double Kmin = 0.0d;
    double Tmf = 0.0d;
    double SWrf = 0.0d;
    double tsmax = 0.0d;
    double DKmax = 0.0d;
    double trmax = 0.0d;

    public double Sdry{ get { return s.Sdry;}} 
     
    public double Sdepth{ get { return s.Sdepth;}} 
     
    public double Swet{ get { return s.Swet;}} 
     
    public double ps{ get { return s.ps;}} 
     
    public double tmaxrec{ get { return s.tmaxrec;}} 
     
    public double Snowmelt{ get { return s.Snowmelt;}} 
     
    public double tminrec{ get { return s.tminrec;}} 
     
    public double preciprec{ get { return s.preciprec;}} 
     
    public double Sdepth_cm{ get { return s.Sdepth_cm;}} 
     
    public double Mrf{ get { return r.Mrf;}} 
     
    public double Snowaccu{ get { return r.Snowaccu;}} 
     
    public double M{ get { return r.M;}} 
     
    public double tavg{ get { return a.tavg;}} 
     

    public SnowWrapper(SnowWrapper toCopy, bool copyAll) : this()
    {
        s = (toCopy.s != null) ? new SnowState(toCopy.s, copyAll) : null;
        r = (toCopy.r != null) ? new SnowRate(toCopy.r, copyAll) : null;
        a = (toCopy.a != null) ? new SnowAuxiliary(toCopy.a, copyAll) : null;
        if (copyAll)
        {
            snowComponent = (toCopy.snowComponent != null) ? new SnowComponent(toCopy.snowComponent) : null;
        }
    }

    public void Init(){
        snowComponent.Init(s, r, a);
        loadParameters();
    }

    private void loadParameters()
    {
        snowComponent.tmaxseuil = tmaxseuil;
        snowComponent.tminseuil = tminseuil;
        snowComponent.prof = prof;
        snowComponent.E = E;
        snowComponent.rho = rho;
        snowComponent.Pns = Pns;
        snowComponent.Kmin = Kmin;
        snowComponent.Tmf = Tmf;
        snowComponent.SWrf = SWrf;
        snowComponent.tsmax = tsmax;
        snowComponent.DKmax = DKmax;
        snowComponent.trmax = trmax;
    }

    public void EstimateSnow(int jul, double tmin, double tmax, double precip)
    {
        a.jul = jul;
        a.tmin = tmin;
        a.tmax = tmax;
        a.precip = precip;
        snowComponent.CalculateModel(s,s1, r, a);
    }

}