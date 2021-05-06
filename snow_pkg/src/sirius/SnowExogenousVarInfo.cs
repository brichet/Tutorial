
using System;
using System.Collections.Generic;
using CRA.ModelLayer.Core;
using System.Reflection;
using CRA.ModelLayer.ParametersManagement;   

namespace SiriusQualitySnow.DomainClass
{
    public class SnowExogenousVarInfo : IVarInfoClass
    {

        static SnowExogenousVarInfo()
        {
            SnowExogenousVarInfo.DescribeVariables();
        }

        public virtual string Description
        {
            get { return "SnowExogenous Domain class of the component";}
        }

        public string URL
        {
            get { return "http://" ;}
        }

        public string DomainClassOfReference
        {
            get { return "SnowExogenous";}
        }

        static void DescribeVariables()
        {
        }

    }
}