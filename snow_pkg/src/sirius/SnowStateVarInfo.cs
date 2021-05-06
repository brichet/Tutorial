
using System;
using System.Collections.Generic;
using CRA.ModelLayer.Core;
using System.Reflection;
using CRA.ModelLayer.ParametersManagement;   

namespace SiriusQualitySnow.DomainClass
{
    public class SnowStateVarInfo : IVarInfoClass
    {
        static VarInfo _Sdry = new VarInfo();
        static VarInfo _Sdepth = new VarInfo();
        static VarInfo _Swet = new VarInfo();
        static VarInfo _ps = new VarInfo();
        static VarInfo _tmaxrec = new VarInfo();
        static VarInfo _Snowmelt = new VarInfo();
        static VarInfo _tminrec = new VarInfo();
        static VarInfo _preciprec = new VarInfo();
        static VarInfo _Sdepth_cm = new VarInfo();

        static SnowStateVarInfo()
        {
            SnowStateVarInfo.DescribeVariables();
        }

        public virtual string Description
        {
            get { return "SnowState Domain class of the component";}
        }

        public string URL
        {
            get { return "http://" ;}
        }

        public string DomainClassOfReference
        {
            get { return "SnowState";}
        }

        public static  VarInfo Sdry
        {
            get { return _Sdry;}
        }

        public static  VarInfo Sdepth
        {
            get { return _Sdepth;}
        }

        public static  VarInfo Swet
        {
            get { return _Swet;}
        }

        public static  VarInfo ps
        {
            get { return _ps;}
        }

        public static  VarInfo tmaxrec
        {
            get { return _tmaxrec;}
        }

        public static  VarInfo Snowmelt
        {
            get { return _Snowmelt;}
        }

        public static  VarInfo tminrec
        {
            get { return _tminrec;}
        }

        public static  VarInfo preciprec
        {
            get { return _preciprec;}
        }

        public static  VarInfo Sdepth_cm
        {
            get { return _Sdepth_cm;}
        }

        static void DescribeVariables()
        {
            _Sdry.Name = "Sdry";
            _Sdry.Description = "water in solid state in the snow cover in previous day";
            _Sdry.MaxValue = 500.0;
            _Sdry.MinValue = 0.0;
            _Sdry.DefaultValue = 0.0;
            _Sdry.Units = "mmW";
            _Sdry.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _Sdepth.Name = "Sdepth";
            _Sdepth.Description = "snow cover depth Calculation in previous day";
            _Sdepth.MaxValue = 5000.0;
            _Sdepth.MinValue = 0.0;
            _Sdepth.DefaultValue = 0.0;
            _Sdepth.Units = "m";
            _Sdepth.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _Swet.Name = "Swet";
            _Swet.Description = "water in liquid state in the snow cover in previous day";
            _Swet.MaxValue = 100.0;
            _Swet.MinValue = 0.0;
            _Swet.DefaultValue = 0.0;
            _Swet.Units = "mmW";
            _Swet.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _ps.Name = "ps";
            _ps.Description = "density of snow cover in previous day";
            _ps.MaxValue = 100.0;
            _ps.MinValue = 0.0;
            _ps.DefaultValue = 0.0;
            _ps.Units = "kg/m**3";
            _ps.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _tmaxrec.Name = "tmaxrec";
            _tmaxrec.Description = "recalculated maximum temperature";
            _tmaxrec.MaxValue = 500.0;
            _tmaxrec.MinValue = 0.0;
            _tmaxrec.DefaultValue = -1D;
            _tmaxrec.Units = "degC";
            _tmaxrec.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _Snowmelt.Name = "Snowmelt";
            _Snowmelt.Description = "Snow melt";
            _Snowmelt.MaxValue = 500.0;
            _Snowmelt.MinValue = 0.0;
            _Snowmelt.DefaultValue = -1D;
            _Snowmelt.Units = "m";
            _Snowmelt.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _tminrec.Name = "tminrec";
            _tminrec.Description = "recalculated minimum temperature";
            _tminrec.MaxValue = 500.0;
            _tminrec.MinValue = 0.0;
            _tminrec.DefaultValue = -1D;
            _tminrec.Units = "degC";
            _tminrec.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _preciprec.Name = "preciprec";
            _preciprec.Description = "precipitation recalculation";
            _preciprec.MaxValue = 500.0;
            _preciprec.MinValue = 0.0;
            _preciprec.DefaultValue = -1D;
            _preciprec.Units = "mmW";
            _preciprec.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            _Sdepth_cm.Name = "Sdepth_cm";
            _Sdepth_cm.Description = "snow cover depth in cm";
            _Sdepth_cm.MaxValue = 500.0;
            _Sdepth_cm.MinValue = 0.0;
            _Sdepth_cm.DefaultValue = -1D;
            _Sdepth_cm.Units = "cm";
            _Sdepth_cm.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

        }

    }
}