
using System;
using System.Collections.Generic;
using CRA.ModelLayer.Core;
using System.Reflection;
using CRA.ModelLayer.ParametersManagement;   

namespace SiriusQualitySnow.DomainClass
{
    public class SnowAuxiliary : ICloneable, IDomainClass
    {
        private int _jul;
        private double _tmin;
        private double _tmax;
        private double _precip;
        private double _tavg;
        private ParametersIO _parametersIO;

        public SnowAuxiliary()
        {
            _parametersIO = new ParametersIO(this);
        }

        public SnowAuxiliary(SnowAuxiliary toCopy, bool copyAll) // copy constructor 
        {
            if (copyAll)
            {
                _jul = toCopy._jul;
                _tmin = toCopy._tmin;
                _tmax = toCopy._tmax;
                _precip = toCopy._precip;
                _tavg = toCopy._tavg;
            }
        }

        public int jul
        {
            get { return this._jul; }
            set { this._jul= value; } 
        }
        public double tmin
        {
            get { return this._tmin; }
            set { this._tmin= value; } 
        }
        public double tmax
        {
            get { return this._tmax; }
            set { this._tmax= value; } 
        }
        public double precip
        {
            get { return this._precip; }
            set { this._precip= value; } 
        }
        public double tavg
        {
            get { return this._tavg; }
            set { this._tavg= value; } 
        }

        public string Description
        {
            get { return "SnowAuxiliary of the component";}
        }

        public string URL
        {
            get { return "http://" ;}
        }

        public virtual IDictionary<string, PropertyInfo> PropertiesDescription
        {
            get { return _parametersIO.GetCachedProperties(typeof(IDomainClass));}
        }

        public virtual Boolean ClearValues()
        {
             _jul = default(int);
             _tmin = default(double);
             _tmax = default(double);
             _precip = default(double);
             _tavg = default(double);
            return true;
        }

        public virtual Object Clone()
        {
            IDomainClass myclass = (IDomainClass) this.MemberwiseClone();
            _parametersIO.PopulateClonedCopy(myclass);
            return myclass;
        }
    }
}