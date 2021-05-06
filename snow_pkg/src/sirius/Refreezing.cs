
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
    public class Refreezing : IStrategySiriusQualitySnow
    {
        public Refreezing()
        {
            ModellingOptions mo0_0 = new ModellingOptions();
            //Parameters
            List<VarInfo> _parameters0_0 = new List<VarInfo>();
            VarInfo v1 = new VarInfo();
            v1.DefaultValue = 0.0;
            v1.Description = "threshold temperature for snow melting ";
            v1.Id = 0;
            v1.MaxValue = 5000.0;
            v1.MinValue = 0.0;
            v1.Name = "Tmf";
            v1.Size = 1;
            v1.Units = "degC";
            v1.URL = "";
            v1.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v1.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v1);
            VarInfo v2 = new VarInfo();
            v2.DefaultValue = 0.0;
            v2.Description = "degree-day temperature index for refreezing";
            v2.Id = 0;
            v2.MaxValue = 5000.0;
            v2.MinValue = 0.0;
            v2.Name = "SWrf";
            v2.Size = 1;
            v2.Units = "mmW/degC/d";
            v2.URL = "";
            v2.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v2.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v2);
            mo0_0.Parameters=_parameters0_0;

            //Inputs
            List<PropertyDescription> _inputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd1 = new PropertyDescription();
            pd1.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowAuxiliary);
            pd1.PropertyName = "tavg";
            pd1.PropertyType = (SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tavg).ValueType.TypeForCurrentValue;
            pd1.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tavg);
            _inputs0_0.Add(pd1);
            mo0_0.Inputs=_inputs0_0;

            //Outputs
            List<PropertyDescription> _outputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd2 = new PropertyDescription();
            pd2.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowRate);
            pd2.PropertyName = "Mrf";
            pd2.PropertyType = (SiriusQualitySnow.DomainClass.SnowRateVarInfo.Mrf).ValueType.TypeForCurrentValue;
            pd2.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowRateVarInfo.Mrf);
            _outputs0_0.Add(pd2);
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

        public double Tmf
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("Tmf");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'Tmf' not found (or found null) in strategy 'Refreezing'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("Tmf");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'Tmf' not found in strategy 'Refreezing'");
            }
        }
        public double SWrf
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("SWrf");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'SWrf' not found (or found null) in strategy 'Refreezing'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("SWrf");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'SWrf' not found in strategy 'Refreezing'");
            }
        }

        public void SetParametersDefaultValue()
        {
            _modellingOptionsManager.SetParametersDefaultValue();
        }

        private static void SetStaticParametersVarInfoDefinitions()
        {

            TmfVarInfo.Name = "Tmf";
            TmfVarInfo.Description = "threshold temperature for snow melting ";
            TmfVarInfo.MaxValue = 5000.0;
            TmfVarInfo.MinValue = 0.0;
            TmfVarInfo.DefaultValue = 0.0;
            TmfVarInfo.Units = "degC";
            TmfVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            SWrfVarInfo.Name = "SWrf";
            SWrfVarInfo.Description = "degree-day temperature index for refreezing";
            SWrfVarInfo.MaxValue = 5000.0;
            SWrfVarInfo.MinValue = 0.0;
            SWrfVarInfo.DefaultValue = 0.0;
            SWrfVarInfo.Units = "mmW/degC/d";
            SWrfVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
        }

        private static VarInfo _TmfVarInfo = new VarInfo();
        public static VarInfo TmfVarInfo
        {
            get { return _TmfVarInfo;} 
        }

        private static VarInfo _SWrfVarInfo = new VarInfo();
        public static VarInfo SWrfVarInfo
        {
            get { return _SWrfVarInfo;} 
        }

        public string TestPostConditions(SiriusQualitySnow.DomainClass.SnowState s,SiriusQualitySnow.DomainClass.SnowState s1,SiriusQualitySnow.DomainClass.SnowRate r,SiriusQualitySnow.DomainClass.SnowAuxiliary a,SiriusQualitySnow.DomainClass.SnowExogenous ex,string callID)
        {
            try
            {
                //Set current values of the outputs to the static VarInfo representing the output properties of the domain classes
                SiriusQualitySnow.DomainClass.SnowRateVarInfo.Mrf.CurrentValue=r.Mrf;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r4 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowRateVarInfo.Mrf);
                if(r4.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowRateVarInfo.Mrf.ValueType)){prc.AddCondition(r4);}
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
                SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tavg.CurrentValue=a.tavg;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r1 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tavg);
                if(r1.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tavg.ValueType)){prc.AddCondition(r1);}
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("Tmf")));
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("SWrf")));
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
            double tavg = a.tavg;
            double Mrf;
            Mrf = 0.0d;
            if (tavg < Tmf)
            {
                Mrf = SWrf * (Tmf - tavg);
            }
            r.Mrf = Mrf;
        }

    }
}