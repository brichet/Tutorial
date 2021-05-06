
using System;
using System.Collections.Generic;
using CRA.ModelLayer.Core;
using System.Reflection;
using CRA.ModelLayer.ParametersManagement;   

namespace SiriusQualitySnow.DomainClass
{
    public class SnowRateVarInfo : IVarInfoClass
    {
        static VarInfo _Mrf = new VarInfo();
        static VarInfo _Snowaccu = new VarInfo();
        static VarInfo _M = new VarInfo();

        static SnowRateVarInfo()
        {
            SnowRateVarInfo.DescribeVariables();
        }

        public virtual string Description
        {
            get { return "SnowRate Domain class of the component";}
        }

        public string URL
        {
            get { return "http://" ;}
        }

        public string DomainClassOfReference
        {
            get { return "SnowRate";}
        }

        public static  VarInfo Mrf
        {
            get { return _Mrf;}
        }

        public static  VarInfo Snowaccu
        {
            get { return _Snowaccu;}
        }

        public static  VarInfo M
        {
            get { return _M;}
        }

        static void DescribeVariables()
        {
            _Mrf.Name = "Mrf";
            _Mrf.Description = "liquid water in the snow cover in the process of refreezing";
            _Mrf.MaxValue = 500.0;
            _Mrf.MinValue = 0.0;
            _Mrf.DefaultValue = -1D;
            _Mrf.Units = "mmW/d";
            _Mrf.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _Snowaccu.Name = "Snowaccu";
            _Snowaccu.Description = "snowfall accumulation";
            _Snowaccu.MaxValue = 500.0;
            _Snowaccu.MinValue = 0.0;
            _Snowaccu.DefaultValue = -1D;
            _Snowaccu.Units = "mmW/d";
            _Snowaccu.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _M.Name = "M";
            _M.Description = "snow in the process of melting";
            _M.MaxValue = 500.0;
            _M.MinValue = 0.0;
            _M.DefaultValue = -1D;
            _M.Units = "mmW/d";
            _M.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

        }

    }
}