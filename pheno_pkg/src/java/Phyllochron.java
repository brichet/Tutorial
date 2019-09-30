import  java.io.*;
import  java.util.*;
public class Phyllochron
{
    private double lincr;
    public double getlincr()
    {
        return lincr;
    }

    public void setlincr(double _lincr)
    {
        this.lincr= _lincr;
    } 
    
    private double ldecr;
    public double getldecr()
    {
        return ldecr;
    }

    public void setldecr(double _ldecr)
    {
        this.ldecr= _ldecr;
    } 
    
    private double pdecr;
    public double getpdecr()
    {
        return pdecr;
    }

    public void setpdecr(double _pdecr)
    {
        this.pdecr= _pdecr;
    } 
    
    private double pincr;
    public double getpincr()
    {
        return pincr;
    }

    public void setpincr(double _pincr)
    {
        this.pincr= _pincr;
    } 
    
    private double ptq;
    public double getptq()
    {
        return ptq;
    }

    public void setptq(double _ptq)
    {
        this.ptq= _ptq;
    } 
    
    private double kl;
    public double getkl()
    {
        return kl;
    }

    public void setkl(double _kl)
    {
        this.kl= _kl;
    } 
    
    private double aPTQ;
    public double getaPTQ()
    {
        return aPTQ;
    }

    public void setaPTQ(double _aPTQ)
    {
        this.aPTQ= _aPTQ;
    } 
    
    private double phylPTQ1;
    public double getphylPTQ1()
    {
        return phylPTQ1;
    }

    public void setphylPTQ1(double _phylPTQ1)
    {
        this.phylPTQ1= _phylPTQ1;
    } 
    
    private double p;
    public double getp()
    {
        return p;
    }

    public void setp(double _p)
    {
        this.p= _p;
    } 
    
    private String choosePhyllUse;
    public String getchoosePhyllUse()
    {
        return choosePhyllUse;
    }

    public void setchoosePhyllUse(String _choosePhyllUse)
    {
        this.choosePhyllUse= _choosePhyllUse;
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
        double fixPhyll = a.getfixPhyll();
        double leafNumber = s.getleafNumber();
        double gai = a.getgai();
        double pastMaxAI = s.getpastMaxAI();
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
            gai_ = Math.max(pastMaxAI, gai);
            pastMaxAI = gai_;
            if (gai_ > 0.0d)
            {
                phyllochron = phylPTQ1 * (gai_ * kl / (1 - Math.exp(-kl * gai_))) / (ptq + aPTQ);
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
        s.setpastMaxAI(pastMaxAI);
        s.setphyllochron(phyllochron);
    }
}