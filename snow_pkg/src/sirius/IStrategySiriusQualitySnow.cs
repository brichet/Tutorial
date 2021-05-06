using System;
using CRA.AgroManagement;
using CRA.ModelLayer.Strategy;
namespace SiriusQualitySnow.DomainClass
{
    public interface IStrategySiriusQualitySnow : IStrategy
    {
        void Estimate( SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a, SnowExogenous ex);

        string TestPreConditions( SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a, SnowExogenous ex, string callID);

        string TestPostConditions( SnowState s, SnowState s1, SnowRate r, SnowAuxiliary a, SnowExogenous ex, string callID);

        void SetParametersDefaultValue();
    }
}