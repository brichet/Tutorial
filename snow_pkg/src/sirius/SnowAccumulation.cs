
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using CRA.ModelLayer.MetadataTypes;
using CRA.ModelLayer.Core;
using CRA.ModelLayer.Strategy;
using System.Reflection;
using VarInfo=CRA.ModelLayer.Core.VarInfo;
using Preconditions=CRA.ModelLayer.Core.Preconditions;
using CRA.AgroManagement;       
using SiriusQualitySnow.DomainClass;
namespace SiriusQualitySnow.Strategies
{
    public class SnowAccumulation : IStrategySiriusQualitySnow
    {
        public SnowAccumulation()
        {
            ModellingOptions mo0_0 = new ModellingOptions();
            //Parameters
            List<VarInfo> _parameters0_0 = new List<VarInfo>();
            VarInfo v1 = new VarInfo();
            v1.DefaultValue = 0.0;
            v1.Description = "maximum daily air temperature (tmax) below which all precipitation is assumed to be snow";
            v1.Id = 0;
            v1.MaxValue = 1000;
            v1.MinValue = 0.0;
            v1.Name = "tsmax";
            v1.Size = 1;
            v1.Units = "degC";
            v1.URL = "";
            v1.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v1.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v1);
            VarInfo v2 = new VarInfo();
            v2.DefaultValue = 0.0;
            v2.Description = "tmax above which all precipitation is assumed to be rain";
            v2.Id = 0;
            v2.MaxValue = 5000.0;
            v2.MinValue = 0.0;
            v2.Name = "trmax";
            v2.Size = 1;
            v2.Units = "degC";
            v2.URL = "";
            v2.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v2.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v2);
            mo0_0.Parameters=_parameters0_0;

            //Inputs
            List<PropertyDescription> _inputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd1 = new PropertyDescription();
            pd1.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowAuxiliary);
            pd1.PropertyName = "tmax";
            pd1.PropertyType = (SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmax).ValueType.TypeForCurrentValue;
            pd1.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmax);
            _inputs0_0.Add(pd1);
            PropertyDescription pd2 = new PropertyDescription();
            pd2.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowAuxiliary);
            pd2.PropertyName = "precip";
            pd2.PropertyType = (SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.precip).ValueType.TypeForCurrentValue;
            pd2.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.precip);
            _inputs0_0.Add(pd2);
            mo0_0.Inputs=_inputs0_0;

            //Outputs
            List<PropertyDescription> _outputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd3 = new PropertyDescription();
            pd3.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowRate);
            pd3.PropertyName = "Snowaccu";
            pd3.PropertyType = (SiriusQualitySnow.DomainClass.SnowRateVarInfo.Snowaccu).ValueType.TypeForCurrentValue;
            pd3.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowRateVarInfo.Snowaccu);
            _outputs0_0.Add(pd3);
            mo0_0.Outputs=_outputs0_0;
            //Associated strategies
            List<string> lAssStrat0_0 = new List<string>();
            mo0_0.AssociatedStrategies = lAssStrat0_0;
            //Adding the modeling options to the modeling options manager
            _modellingOptionsManager = new ModellingOptionsManager(mo0_0);
            SetStaticParametersVarInfoDefinitions();
            SetPublisherData();

        }

        public string Description
        {
            get { return "-" ;}
        }

        public string URL
        {
            get { return "" ;}
        }

        public string Domain
        {
            get { return "";}
        }

        public string ModelType
        {
            get { return "";}
        }

        public bool IsContext
        {
            get { return false;}
        }

        public IList<int> TimeStep
        {
            get
            {
                IList<int> ts = new List<int>();
                return ts;
            }
        }

        private  PublisherData _pd;
        public PublisherData PublisherData
        {
            get { return _pd;} 
        }

        private  void SetPublisherData()
        {
            _pd = new CRA.ModelLayer.MetadataTypes.PublisherData();
            _pd.Add("Creator", "STICS");
            _pd.Add("Date", "");
            _pd.Add("Publisher", "INRA");
        }

        private ModellingOptionsManager _modellingOptionsManager;
        public ModellingOptionsManager ModellingOptionsManager
        {
            get { return _modellingOptionsManager; } 
        }

        public IEnumerable<Type> GetStrategyDomainClassesTypes()
        {
            return new List<Type>() {  typeof(SiriusQualitySnow.DomainClass.SnowState),  typeof(SiriusQualitySnow.DomainClass.SnowState), typeof(SiriusQualitySnow.DomainClass.SnowRate), typeof(SiriusQualitySnow.DomainClass.SnowAuxiliary), typeof(SiriusQualitySnow.DomainClass.SnowExogenous)};
        }

        // Getter and setters for the value of the parameters of the strategy. The actual parameters are stored into the ModelingOptionsManager of the strategy.

        public double tsmax
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("tsmax");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'tsmax' not found (or found null) in strategy 'SnowAccumulation'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("tsmax");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'tsmax' not found in strategy 'SnowAccumulation'");
            }
        }
        public double trmax
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("trmax");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'trmax' not found (or found null) in strategy 'SnowAccumulation'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("trmax");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'trmax' not found in strategy 'SnowAccumulation'");
            }
        }

        public void SetParametersDefaultValue()
        {
            _modellingOptionsManager.SetParametersDefaultValue();
        }

        private static void SetStaticParametersVarInfoDefinitions()
        {

            tsmaxVarInfo.Name = "tsmax";
            tsmaxVarInfo.Description = "maximum daily air temperature (tmax) below which all precipitation is assumed to be snow";
            tsmaxVarInfo.MaxValue = 1000;
            tsmaxVarInfo.MinValue = 0.0;
            tsmaxVarInfo.DefaultValue = 0.0;
            tsmaxVarInfo.Units = "degC";
            tsmaxVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            trmaxVarInfo.Name = "trmax";
            trmaxVarInfo.Description = "tmax above which all precipitation is assumed to be rain";
            trmaxVarInfo.MaxValue = 5000.0;
            trmaxVarInfo.MinValue = 0.0;
            trmaxVarInfo.DefaultValue = 0.0;
            trmaxVarInfo.Units = "degC";
            trmaxVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
        }

        private static VarInfo _tsmaxVarInfo = new VarInfo();
        public static VarInfo tsmaxVarInfo
        {
            get { return _tsmaxVarInfo;} 
        }

        private static VarInfo _trmaxVarInfo = new VarInfo();
        public static VarInfo trmaxVarInfo
        {
            get { return _trmaxVarInfo;} 
        }

        public string TestPostConditions(SiriusQualitySnow.DomainClass.SnowState s,SiriusQualitySnow.DomainClass.SnowState s1,SiriusQualitySnow.DomainClass.SnowRate r,SiriusQualitySnow.DomainClass.SnowAuxiliary a,SiriusQualitySnow.DomainClass.SnowExogenous ex,string callID)
        {
            try
            {
                //Set current values of the outputs to the static VarInfo representing the output properties of the domain classes
                SiriusQualitySnow.DomainClass.SnowRateVarInfo.Snowaccu.CurrentValue=r.Snowaccu;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r5 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowRateVarInfo.Snowaccu);
                if(r5.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowRateVarInfo.Snowaccu.ValueType)){prc.AddCondition(r5);}
                string postConditionsResult = pre.VerifyPostconditions(prc, callID); if (!string.IsNullOrEmpty(postConditionsResult)) { pre.TestsOut(postConditionsResult, true, "PostConditions errors in strategy " + this.GetType().Name); } return postConditionsResult;
            }
            catch (Exception exception)
            {
                string msg = "SiriusQuality.Snow, " + this.GetType().Name + ": Unhandled exception running post-condition test. ";
                throw new Exception(msg, exception);
            }
        }

        public string TestPreConditions(SiriusQualitySnow.DomainClass.SnowState s,SiriusQualitySnow.DomainClass.SnowState s1,SiriusQualitySnow.DomainClass.SnowRate r,SiriusQualitySnow.DomainClass.SnowAuxiliary a,SiriusQualitySnow.DomainClass.SnowExogenous ex,string callID)
        {
            try
            {
                //Set current values of the inputs to the static VarInfo representing the inputs properties of the domain classes
                SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmax.CurrentValue=a.tmax;
                SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.precip.CurrentValue=a.precip;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r1 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmax);
                if(r1.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmax.ValueType)){prc.AddCondition(r1);}
                RangeBasedCondition r2 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.precip);
                if(r2.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.precip.ValueType)){prc.AddCondition(r2);}
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("tsmax")));
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("trmax")));
                string preConditionsResult = pre.VerifyPreconditions(prc, callID); if (!string.IsNullOrEmpty(preConditionsResult)) { pre.TestsOut(preConditionsResult, true, "PreConditions errors in strategy " + this.GetType().Name); } return preConditionsResult;
            }
            catch (Exception exception)
            {
                string msg = "SiriusQuality.Snow, " + this.GetType().Name + ": Unhandled exception running pre-condition test. ";
                throw new Exception(msg, exception);
            }
        }

        public void Estimate(SiriusQualitySnow.DomainClass.SnowState s,SiriusQualitySnow.DomainClass.SnowState s1,SiriusQualitySnow.DomainClass.SnowRate r,SiriusQualitySnow.DomainClass.SnowAuxiliary a,SiriusQualitySnow.DomainClass.SnowExogenous ex)
        {
            try
            {
                CalculateModel(s, s1, r, a, ex);
            }
            catch (Exception exception)
            {
                string msg = "Error in component SiriusQualitySnow, strategy: " + this.GetType().Name + ": Unhandled exception running model. "+exception.GetType().FullName+" - "+exception.Message;
                throw new Exception(msg, exception);
            }
        }

        private void CalculateModel(SiriusQualitySnow.DomainClass.SnowState s, SiriusQualitySnow.DomainClass.SnowState s1, SiriusQualitySnow.DomainClass.SnowRate r, SiriusQualitySnow.DomainClass.SnowAuxiliary a, SiriusQualitySnow.DomainClass.SnowExogenous ex)
        {
            double tmax = a.tmax;
            double precip = a.precip;
            double Snowaccu;
            double fs = 0.0d;
            if (tmax < tsmax)
            {
                fs = 1.0d;
            }
            if (tmax >= tsmax && tmax <= trmax)
            {
                fs = (trmax - tmax) / (trmax - tsmax);
            }
            Snowaccu = fs * precip * 1;
            r.Snowaccu = Snowaccu;
        }

    }
}