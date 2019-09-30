using System;
using System.Collections.Generic;
public class Phyllochron
{
    private double _lincr;
    public double lincr
    {
        get
        {
            return this._lincr;
        }
        set
        {
            this._lincr= value;
        } 
    }
    private double _ldecr;
    public double ldecr
    {
        get
        {
            return this._ldecr;
        }
        set
        {
            this._ldecr= value;
        } 
    }
    private double _pdecr;
    public double pdecr
    {
        get
        {
            return this._pdecr;
        }
        set
        {
            this._pdecr= value;
        } 
    }
    private double _pincr;
    public double pincr
    {
        get
        {
            return this._pincr;
        }
        set
        {
            this._pincr= value;
        } 
    }
    private double _ptq;
    public double ptq
    {
        get
        {
            return this._ptq;
        }
        set
        {
            this._ptq= value;
        } 
    }
    private double _kl;
    public double kl
    {
        get
        {
            return this._kl;
        }
        set
        {
            this._kl= value;
        } 
    }
    private double _aPTQ;
    public double aPTQ
    {
        get
        {
            return this._aPTQ;
        }
        set
        {
            this._aPTQ= value;
        } 
    }
    private double _phylPTQ1;
    public double phylPTQ1
    {
        get
        {
            return this._phylPTQ1;
        }
        set
        {
            this._phylPTQ1= value;
        } 
    }
    private double _p;
    public double p
    {
        get
        {
            return this._p;
        }
        set
        {
            this._p= value;
        } 
    }
    private string _choosePhyllUse;
    public string choosePhyllUse
    {
        get
        {
            return this._choosePhyllUse;
        }
        set
        {
            this._choosePhyllUse= value;
        } 
    }
    public Phyllochron()
    {
           
    }
    
    public void  Calculate_phyllochron(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            - Model Name: Phyllochron Model
    //            - Author: Pierre Martre
    //            - Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            - Institution: INRA Montpellier
    //            - Abstract: Calculate different types of phyllochron 
        //- inputs:
    //            - name: fixPhyll
    //                          - description : Sowing date corrected Phyllochron
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 5
    //                          - unit : °C d leaf-1
    //                          - uri : some url
    //                          - inputtype : variable
    //            - name: leafNumber
    //                          - description : Actual number of phytomers
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 25
    //                          - default : 0
    //                          - unit : leaf
    //                          - uri : some url
    //                          - inputtype : variable
    //            - name: lincr
    //                          - description : Leaf number above which the phyllochron is increased by Pincr
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 30
    //                          - default : 8
    //                          - unit : leaf
    //                          - uri : some url
    //                          - inputtype : parameter
    //            - name: ldecr
    //                          - description : Leaf number up to which the phyllochron is decreased by Pdecr
    //                          - parametercategory : species
    //                          - inputtype : parameter
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 30
    //                          - default : 10
    //                          - unit : leaf
    //                          - uri : some url
    //            - name: pdecr
    //                          - description : Factor decreasing the phyllochron for leaf number less than Ldecr
    //                          - parametercategory : species
    //                          - inputtype : parameter
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10
    //                          - default : 0.4
    //                          - unit : 
    //                          - uri : some url
    //            - name: pincr
    //                          - description : Factor increasing the phyllochron for leaf number higher than Lincr
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - default : 1.5
    //                          - min : 0
    //                          - max : 10
    //                          - unit : 
    //                          - uri : some url
    //                          - inputtype : parameter
    //            - name: ptq
    //                          - description : Photothermal quotient 
    //                          - parametercategory : species
    //                          - inputtype : parameter
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 0
    //                          - unit : MJ °C-1 d-1 m-2)
    //                          - uri : some url
    //            - name: gai
    //                          - description : Green Area Index
    //                          - variablecategory : auxiliary
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 0
    //                          - unit : m2 m-2
    //                          - uri : some url
    //                          - inputtype : variable
    //            - name: pastMaxAI
    //                          - description : Past Maximum GAI
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 0
    //                          - unit : m2 m-2
    //                          - uri : some url
    //                          - inputtype : variable
    //            - name: kl
    //                          - description : Exctinction Coefficient
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 50
    //                          - default : 0.45
    //                          - unit : 
    //                          - uri : some url
    //                          - inputtype : parameter
    //            - name: aPTQ
    //                          - description : Slope to intercept ratio for Phyllochron  parametrization with PhotoThermal Quotient
    //                          - parametercategory : species
    //                          - inputtype : variable
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 1000
    //                          - default : 0.842934
    //                          - unit : 
    //                          - uri : some url
    //            - name: phylPTQ1
    //                          - description : Phyllochron at PTQ equal 1
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - default : 20
    //                          - min : 0
    //                          - max : 1000
    //                          - unit : °C d leaf-1
    //                          - uri : some url
    //                          - inputtype : parameter
    //            - name: p
    //                          - description : Phyllochron (Varietal parameter)
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - default : 120
    //                          - min : 0
    //                          - max : 1000
    //                          - unit : °C d leaf-1
    //                          - uri : some url
    //                          - inputtype : parameter
    //            - name: choosePhyllUse
    //                          - description : Switch to choose the type of phyllochron calculation to be used
    //                          - parametercategory : species
    //                          - datatype : STRING
    //                          - default : Default
    //                          - unit : 
    //                          - uri : some url
    //                          - inputtype : parameter
        //- outputs:
    //            - name: phyllochron
    //                          - description :  the rate of leaf appearance 
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 1000
    //                          - unit :  °C d leaf-1
    //            - name: pastMaxAI
    //                          - description : Past maximum GAI
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : m2 m-2
        double fixPhyll = a.fixPhyll;
        double leafNumber = s.leafNumber;
        double gai = a.gai;
        double pastMaxAI = s.pastMaxAI;
        double phyllochron;
        double gai_;
        phyllochron = 0.0d;
        if (choosePhyllUse == "Default")
        {
            if (leafNumber < ldecr)
            {
                phyllochron = fixPhyll * pdecr;
            }
            else if ( leafNumber >= ldecr && leafNumber < lincr)
            {
                phyllochron = fixPhyll;
            }
            else
            {
                phyllochron = fixPhyll * pincr;
            }
        }
        if (choosePhyllUse == "PTQ")
        {
            gai_ = Math.Max(pastMaxAI, gai);
            pastMaxAI = gai_;
            if (gai_ > 0.0d)
            {
                phyllochron = phylPTQ1 * (gai_ * kl / (1 - Math.Exp(-kl * gai_))) / (ptq + aPTQ);
            }
            else
            {
                phyllochron = phylPTQ1;
            }
        }
        if (choosePhyllUse == "Test")
        {
            if (leafNumber < ldecr)
            {
                phyllochron = p * pdecr;
            }
            else if ( leafNumber >= ldecr && leafNumber < lincr)
            {
                phyllochron = p;
            }
            else
            {
                phyllochron = p * pincr;
            }
        }
        s.pastMaxAI= pastMaxAI;
        s.phyllochron= phyllochron;
    }
}