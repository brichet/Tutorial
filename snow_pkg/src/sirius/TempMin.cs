
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
    public class TempMin : IStrategySiriusQualitySnow
    {
        public TempMin()
        {
            ModellingOptions mo0_0 = new ModellingOptions();
            //Parameters
            List<VarInfo> _parameters0_0 = new List<VarInfo>();
            VarInfo v1 = new VarInfo();
            v1.DefaultValue = 0.0;
            v1.Description = "snow cover threshold for snow insulation ";
            v1.Id = 0;
            v1.MaxValue = 1000;
            v1.MinValue = 0.0;
            v1.Name = "prof";
            v1.Size = 1;
            v1.Units = "cm";
            v1.URL = "";
            v1.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v1.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v1);
            VarInfo v2 = new VarInfo();
            v2.DefaultValue = 0.0;
            v2.Description = "minimum temperature when snow cover is higher than prof";
            v2.Id = 0;
            v2.MaxValue = 5000.0;
            v2.MinValue = 0.0;
            v2.Name = "tminseuil";
            v2.Size = 1;
            v2.Units = "degC";
            v2.URL = "";
            v2.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v2.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v2);
            VarInfo v3 = new VarInfo();
            v3.DefaultValue = 0.0;
            v3.Description = "maximum temperature when snow cover is higher than prof";
            v3.Id = 0;
            v3.MaxValue = ;
            v3.MinValue = ;
            v3.Name = "tmaxseuil";
            v3.Size = 1;
            v3.Units = "degC";
            v3.URL = "";
            v3.VarType = CRA.ModelLayer.Core.VarInfo.Type.PARAMETER;
            v3.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
            _parameters0_0.Add(v3);
            mo0_0.Parameters=_parameters0_0;

            //Inputs
            List<PropertyDescription> _inputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd1 = new PropertyDescription();
            pd1.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowState);
            pd1.PropertyName = "Sdepth_cm";
            pd1.PropertyType = (SiriusQualitySnow.DomainClass.SnowStateVarInfo.Sdepth_cm).ValueType.TypeForCurrentValue;
            pd1.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowStateVarInfo.Sdepth_cm);
            _inputs0_0.Add(pd1);
            PropertyDescription pd2 = new PropertyDescription();
            pd2.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowAuxiliary);
            pd2.PropertyName = "tmin";
            pd2.PropertyType = (SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmin).ValueType.TypeForCurrentValue;
            pd2.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmin);
            _inputs0_0.Add(pd2);
            mo0_0.Inputs=_inputs0_0;

            //Outputs
            List<PropertyDescription> _outputs0_0 = new List<PropertyDescription>();
            PropertyDescription pd3 = new PropertyDescription();
            pd3.DomainClassType = typeof(SiriusQualitySnow.DomainClass.SnowState);
            pd3.PropertyName = "tminrec";
            pd3.PropertyType = (SiriusQualitySnow.DomainClass.SnowStateVarInfo.tminrec).ValueType.TypeForCurrentValue;
            pd3.PropertyVarInfo =(SiriusQualitySnow.DomainClass.SnowStateVarInfo.tminrec);
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

        public double prof
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("prof");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'prof' not found (or found null) in strategy 'TempMin'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("prof");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'prof' not found in strategy 'TempMin'");
            }
        }
        public double tminseuil
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("tminseuil");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'tminseuil' not found (or found null) in strategy 'TempMin'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("tminseuil");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'tminseuil' not found in strategy 'TempMin'");
            }
        }
        public double tmaxseuil
        {
            get { 
                VarInfo vi= _modellingOptionsManager.GetParameterByName("tmaxseuil");
                if (vi != null && vi.CurrentValue!=null) return (double)vi.CurrentValue ;
                else throw new Exception("Parameter 'tmaxseuil' not found (or found null) in strategy 'TempMin'");
            } set {
                VarInfo vi = _modellingOptionsManager.GetParameterByName("tmaxseuil");
                if (vi != null)  vi.CurrentValue=value;
                else throw new Exception("Parameter 'tmaxseuil' not found in strategy 'TempMin'");
            }
        }

        public void SetParametersDefaultValue()
        {
            _modellingOptionsManager.SetParametersDefaultValue();
        }

        private static void SetStaticParametersVarInfoDefinitions()
        {

            profVarInfo.Name = "prof";
            profVarInfo.Description = "snow cover threshold for snow insulation ";
            profVarInfo.MaxValue = 1000;
            profVarInfo.MinValue = 0.0;
            profVarInfo.DefaultValue = 0.0;
            profVarInfo.Units = "cm";
            profVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            tminseuilVarInfo.Name = "tminseuil";
            tminseuilVarInfo.Description = "minimum temperature when snow cover is higher than prof";
            tminseuilVarInfo.MaxValue = 5000.0;
            tminseuilVarInfo.MinValue = 0.0;
            tminseuilVarInfo.DefaultValue = 0.0;
            tminseuilVarInfo.Units = "degC";
            tminseuilVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");

            tmaxseuilVarInfo.Name = "tmaxseuil";
            tmaxseuilVarInfo.Description = "maximum temperature when snow cover is higher than prof";
            tmaxseuilVarInfo.MaxValue = ;
            tmaxseuilVarInfo.MinValue = ;
            tmaxseuilVarInfo.DefaultValue = 0.0;
            tmaxseuilVarInfo.Units = "degC";
            tmaxseuilVarInfo.ValueType = VarInfoValueTypes.GetInstanceForName("Double");
        }

        private static VarInfo _profVarInfo = new VarInfo();
        public static VarInfo profVarInfo
        {
            get { return _profVarInfo;} 
        }

        private static VarInfo _tminseuilVarInfo = new VarInfo();
        public static VarInfo tminseuilVarInfo
        {
            get { return _tminseuilVarInfo;} 
        }

        private static VarInfo _tmaxseuilVarInfo = new VarInfo();
        public static VarInfo tmaxseuilVarInfo
        {
            get { return _tmaxseuilVarInfo;} 
        }

        public string TestPostConditions(SiriusQualitySnow.DomainClass.SnowState s,SiriusQualitySnow.DomainClass.SnowState s1,SiriusQualitySnow.DomainClass.SnowRate r,SiriusQualitySnow.DomainClass.SnowAuxiliary a,SiriusQualitySnow.DomainClass.SnowExogenous ex,string callID)
        {
            try
            {
                //Set current values of the outputs to the static VarInfo representing the output properties of the domain classes
                SiriusQualitySnow.DomainClass.SnowStateVarInfo.tminrec.CurrentValue=s.tminrec;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r6 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowStateVarInfo.tminrec);
                if(r6.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowStateVarInfo.tminrec.ValueType)){prc.AddCondition(r6);}
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
                SiriusQualitySnow.DomainClass.SnowStateVarInfo.Sdepth_cm.CurrentValue=s.Sdepth_cm;
                SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmin.CurrentValue=a.tmin;
                ConditionsCollection prc = new ConditionsCollection();
                Preconditions pre = new Preconditions(); 
                RangeBasedCondition r1 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowStateVarInfo.Sdepth_cm);
                if(r1.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowStateVarInfo.Sdepth_cm.ValueType)){prc.AddCondition(r1);}
                RangeBasedCondition r2 = new RangeBasedCondition(SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmin);
                if(r2.ApplicableVarInfoValueTypes.Contains( SiriusQualitySnow.DomainClass.SnowAuxiliaryVarInfo.tmin.ValueType)){prc.AddCondition(r2);}
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("prof")));
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("tminseuil")));
                prc.AddCondition(new RangeBasedCondition(_modellingOptionsManager.GetParameterByName("tmaxseuil")));
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
            double Sdepth_cm = s.Sdepth_cm;
            double tmin = a.tmin;
            double tminrec;
            tminrec = tmin;
            if (Sdepth_cm > prof)
            {
                if (tmin < tminseuil)
                {
                    tminrec = tminseuil;
                }
                else
                {
                    if (tmin > tmaxseuil)
                    {
                        tminrec = tmaxseuil;
                    }
                }
            }
            else
            {
                if (Sdepth_cm > 0.0d)
                {
                    tminrec = tminseuil - ((1 - (Sdepth_cm / prof)) * (Math.Abs(tmin) + tminseuil));
                }
            }
            s.tminrec= tminrec;
        }

    }
}