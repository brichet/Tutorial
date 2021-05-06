
using System;
using System.Collections.Generic;
using CRA.ModelLayer.Core;
using System.Reflection;
using CRA.ModelLayer.ParametersManagement;   

namespace SiriusQualitySnow.DomainClass
{
    public class SnowAuxiliaryVarInfo : IVarInfoClass
    {
        static VarInfo _jul = new VarInfo();
        static VarInfo _tmin = new VarInfo();
        static VarInfo _tmax = new VarInfo();
        static VarInfo _precip = new VarInfo();
        static VarInfo _tavg = new VarInfo();

        static SnowAuxiliaryVarInfo()
        {
            SnowAuxiliaryVarInfo.DescribeVariables();
        }

        public virtual string Description
        {
            get { return "SnowAuxiliary Domain class of the component";}
        }

        public string URL
        {
            get { return "http://" ;}
        }

        public string DomainClassOfReference
        {
            get { return "SnowAuxiliary";}
        }

        public static  VarInfo jul
        {
            get { return _jul;}
        }

        public static  VarInfo tmin
        {
            get { return _tmin;}
        }

        public static  VarInfo tmax
        {
            get { return _tmax;}
        }

        public static  VarInfo precip
        {
            get { return _precip;}
        }

        public static  VarInfo tavg
        {
            get { return _tavg;}
        }

        static void DescribeVariables()
        {
            _jul.Name = "jul";
            _jul.Description = "current day of year for the calculation";
            _jul.MaxValue = 366;
            _jul.MinValue = 0;
            _jul.DefaultValue = 0;
            _jul.Units = "d";
            _jul.ValueType = VarInfoValueTypes.GetInstanceForName("Integer");

            _tmin.Name = "tmin";
            _tmin.Description = "current minimum air temperature";
            _tmin.MaxValue = 100.0;
            _tmin.MinValue = 0.0;
            _tmin.DefaultValue = 0.0;
            _tmin.Units = "degC";
            _tmin.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _tmax.Name = "tmax";
            _tmax.Description = "current maximum air temperature";
            _tmax.MaxValue = 100.0;
            _tmax.MinValue = 0.0;
            _tmax.DefaultValue = 0.0;
            _tmax.Units = "degC";
            _tmax.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _precip.Name = "precip";
            _precip.Description = "current precipitation";
            _precip.MaxValue = 5000.0;
            _precip.MinValue = 0.0;
            _precip.DefaultValue = 0.0;
            _precip.Units = "mmW";
            _precip.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _tavg.Name = "tavg";
            _tavg.Description = "mean temperature";
            _tavg.MaxValue = 500.0;
            _tavg.MinValue = 0.0;
            _tavg.DefaultValue = -1D;
            _tavg.Units = "degC";
            _tavg.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

        }

    }
}