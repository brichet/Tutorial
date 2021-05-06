using System;
using System.Collections.Generic;
using System.Linq;
using SQCrop2ML_Snow.DomainClass;
using SQCrop2ML_Snow.Strategies;

namespace SiriusModel.Model.Snow
{
    class SnowWrapper :  UniverseLink
    {
        private SnowState s;
        private SnowRate r;
        private SnowAuxiliary a;
        private SnowComponent snowComponent;

        public SnowWrapper(Universe universe) : base(universe)
        {
            s = new SnowState();
            r = new SnowRate();
            a = new SnowAuxiliary();
            snowComponent = new Snow();
            loadParameters();
        }

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
     

        public SnowWrapper(Universe universe, SnowWrapper toCopy, bool copyAll) : base(universe)
        {
            s = (toCopy.s != null) ? new SnowState(toCopy.s, copyAll) : null;
            r = (toCopy.r != null) ? new SnowRate(toCopy.r, copyAll) : null;
            a = (toCopy.a != null) ? new SnowAuxiliary(toCopy.a, copyAll) : null;
            if (copyAll)
            {
                snowComponent = (toCopy.snowComponent != null) ? new Snow(toCopy.snowComponent) : null;
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

}