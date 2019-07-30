using System;
using System.Collections.Generic;
public class Phenology
{
    
    public Phenology()
    {
           
    }
    

    Phyllochron _Phyllochron = new Phyllochron();
    Phylsowingdatecorrection _Phylsowingdatecorrection = new Phylsowingdatecorrection();
    Shootnumber _Shootnumber = new Shootnumber();
    Updateleafflag _Updateleafflag = new Updateleafflag();
    Updatephase _Updatephase = new Updatephase();
    Leafnumber _Leafnumber = new Leafnumber();
    Vernalizationprogress _Vernalizationprogress = new Vernalizationprogress();
    Ismomentregistredzc_39 _Ismomentregistredzc_39 = new Ismomentregistredzc_39();
    Cumulttfrom _Cumulttfrom = new Cumulttfrom();
    Updatecalendar _Updatecalendar = new Updatecalendar();
    Registerzadok _Registerzadok = new Registerzadok();

    public double lincr
    {
        get
        {
            return _Phyllochron.lincr;
        }
        set
        {
            _Phyllochron.lincr = value;
        } 
    }
    
    public double ldecr
    {
        get
        {
            return _Phyllochron.ldecr;
        }
        set
        {
            _Phyllochron.ldecr = value;
        } 
    }
    
    public double pdecr
    {
        get
        {
            return _Phyllochron.pdecr;
        }
        set
        {
            _Phyllochron.pdecr = value;
        } 
    }
    
    public double pincr
    {
        get
        {
            return _Phyllochron.pincr;
        }
        set
        {
            _Phyllochron.pincr = value;
        } 
    }
    
    public double ptq
    {
        get
        {
            return _Phyllochron.ptq;
        }
        set
        {
            _Phyllochron.ptq = value;
        } 
    }
    
    public double kl
    {
        get
        {
            return _Phyllochron.kl;
        }
        set
        {
            _Phyllochron.kl = value;
        } 
    }
    
    public double aPTQ
    {
        get
        {
            return _Phyllochron.aPTQ;
        }
        set
        {
            _Phyllochron.aPTQ = value;
        } 
    }
    
    public double phylPTQ1
    {
        get
        {
            return _Phyllochron.phylPTQ1;
        }
        set
        {
            _Phyllochron.phylPTQ1 = value;
        } 
    }
    
    public double p
    {
        get
        {
            return _Phyllochron.p;
        }
        set
        {
            _Phyllochron.p = value;
            _Phylsowingdatecorrection.p = value;
            _Updatephase.p = value;
        } 
    }
    
    public string choosePhyllUse
    {
        get
        {
            return _Phyllochron.choosePhyllUse;
        }
        set
        {
            _Phyllochron.choosePhyllUse = value;
            _Updatephase.choosePhyllUse = value;
        } 
    }
    
    public int sowingDay
    {
        get
        {
            return _Phylsowingdatecorrection.sowingDay;
        }
        set
        {
            _Phylsowingdatecorrection.sowingDay = value;
        } 
    }
    
    public int sDsa_sh
    {
        get
        {
            return _Phylsowingdatecorrection.sDsa_sh;
        }
        set
        {
            _Phylsowingdatecorrection.sDsa_sh = value;
        } 
    }
    
    public int sDws
    {
        get
        {
            return _Phylsowingdatecorrection.sDws;
        }
        set
        {
            _Phylsowingdatecorrection.sDws = value;
        } 
    }
    
    public int sDsa_nh
    {
        get
        {
            return _Phylsowingdatecorrection.sDsa_nh;
        }
        set
        {
            _Phylsowingdatecorrection.sDsa_nh = value;
        } 
    }
    
    public double rp
    {
        get
        {
            return _Phylsowingdatecorrection.rp;
        }
        set
        {
            _Phylsowingdatecorrection.rp = value;
        } 
    }
    
    public double latitude
    {
        get
        {
            return _Phylsowingdatecorrection.latitude;
        }
        set
        {
            _Phylsowingdatecorrection.latitude = value;
        } 
    }
    
    public int isVernalizable
    {
        get
        {
            return _Vernalizationprogress.isVernalizable;
        }
        set
        {
            _Vernalizationprogress.isVernalizable = value;
            _Updatephase.isVernalizable = value;
        } 
    }
    
    public double minTvern
    {
        get
        {
            return _Vernalizationprogress.minTvern;
        }
        set
        {
            _Vernalizationprogress.minTvern = value;
        } 
    }
    
    public double intTvern
    {
        get
        {
            return _Vernalizationprogress.intTvern;
        }
        set
        {
            _Vernalizationprogress.intTvern = value;
        } 
    }
    
    public double vAI
    {
        get
        {
            return _Vernalizationprogress.vAI;
        }
        set
        {
            _Vernalizationprogress.vAI = value;
        } 
    }
    
    public double vBEE
    {
        get
        {
            return _Vernalizationprogress.vBEE;
        }
        set
        {
            _Vernalizationprogress.vBEE = value;
        } 
    }
    
    public double minDL
    {
        get
        {
            return _Vernalizationprogress.minDL;
        }
        set
        {
            _Vernalizationprogress.minDL = value;
        } 
    }
    
    public double maxDL
    {
        get
        {
            return _Vernalizationprogress.maxDL;
        }
        set
        {
            _Vernalizationprogress.maxDL = value;
            _Updatephase.maxDL = value;
        } 
    }
    
    public double maxTvern
    {
        get
        {
            return _Vernalizationprogress.maxTvern;
        }
        set
        {
            _Vernalizationprogress.maxTvern = value;
        } 
    }
    
    public double pNini
    {
        get
        {
            return _Vernalizationprogress.pNini;
        }
        set
        {
            _Vernalizationprogress.pNini = value;
        } 
    }
    
    public double aMXLFNO
    {
        get
        {
            return _Vernalizationprogress.aMXLFNO;
        }
        set
        {
            _Vernalizationprogress.aMXLFNO = value;
        } 
    }
    
    public double dse
    {
        get
        {
            return _Updatephase.dse;
        }
        set
        {
            _Updatephase.dse = value;
        } 
    }
    
    public double pFLLAnth
    {
        get
        {
            return _Updatephase.pFLLAnth;
        }
        set
        {
            _Updatephase.pFLLAnth = value;
        } 
    }
    
    public double dcd
    {
        get
        {
            return _Updatephase.dcd;
        }
        set
        {
            _Updatephase.dcd = value;
        } 
    }
    
    public double dgf
    {
        get
        {
            return _Updatephase.dgf;
        }
        set
        {
            _Updatephase.dgf = value;
        } 
    }
    
    public double degfm
    {
        get
        {
            return _Updatephase.degfm;
        }
        set
        {
            _Updatephase.degfm = value;
        } 
    }
    
    public bool ignoreGrainMaturation
    {
        get
        {
            return _Updatephase.ignoreGrainMaturation;
        }
        set
        {
            _Updatephase.ignoreGrainMaturation = value;
        } 
    }
    
    public double pHEADANTH
    {
        get
        {
            return _Updatephase.pHEADANTH;
        }
        set
        {
            _Updatephase.pHEADANTH = value;
        } 
    }
    
    public double sLDL
    {
        get
        {
            return _Updatephase.sLDL;
        }
        set
        {
            _Updatephase.sLDL = value;
        } 
    }
    
    public double sowingDensity
    {
        get
        {
            return _Shootnumber.sowingDensity;
        }
        set
        {
            _Shootnumber.sowingDensity = value;
        } 
    }
    
    public double targetFertileShoot
    {
        get
        {
            return _Shootnumber.targetFertileShoot;
        }
        set
        {
            _Shootnumber.targetFertileShoot = value;
        } 
    }
    
    public double slopeTSFLN
    {
        get
        {
            return _Registerzadok.slopeTSFLN;
        }
        set
        {
            _Registerzadok.slopeTSFLN = value;
        } 
    }
    
    public double intTSFLN
    {
        get
        {
            return _Registerzadok.intTSFLN;
        }
        set
        {
            _Registerzadok.intTSFLN = value;
        } 
    }
    
    public double der
    {
        get
        {
            return _Registerzadok.der;
        }
        set
        {
            _Registerzadok.der = value;
        } 
    }
    
    public void  Calculate_phenology(state s, rate r, auxiliary a)
    {
        _Cumulttfrom.Calculate_cumulttfrom(s, r, a);
        _Ismomentregistredzc_39.Calculate_ismomentregistredzc_39(s, r, a);
        _Vernalizationprogress.Calculate_vernalizationprogress(s, r, a);
        _Phylsowingdatecorrection.Calculate_phylsowingdatecorrection(s, r, a);
        _Phyllochron.Calculate_phyllochron(s, r, a);
        _Updatephase.Calculate_updatephase(s, r, a);
        _Leafnumber.Calculate_leafnumber(s, r, a);
        _Shootnumber.Calculate_shootnumber(s, r, a);
        _Updateleafflag.Calculate_updateleafflag(s, r, a);
        _Registerzadok.Calculate_registerzadok(s, r, a);
        _Updatecalendar.Calculate_updatecalendar(s, r, a);
    }
    
    public Phenology(Phenology toCopy): this() // copy constructor 
    {

        lincr = toCopy.lincr;
        ldecr = toCopy.ldecr;
        pdecr = toCopy.pdecr;
        pincr = toCopy.pincr;
        ptq = toCopy.ptq;
        kl = toCopy.kl;
        aPTQ = toCopy.aPTQ;
        phylPTQ1 = toCopy.phylPTQ1;
        p = toCopy.p;
        choosePhyllUse = toCopy.choosePhyllUse;
        sowingDay = toCopy.sowingDay;
        sDsa_sh = toCopy.sDsa_sh;
        sDws = toCopy.sDws;
        sDsa_nh = toCopy.sDsa_nh;
        rp = toCopy.rp;
        latitude = toCopy.latitude;
        isVernalizable = toCopy.isVernalizable;
        minTvern = toCopy.minTvern;
        intTvern = toCopy.intTvern;
        vAI = toCopy.vAI;
        vBEE = toCopy.vBEE;
        minDL = toCopy.minDL;
        maxDL = toCopy.maxDL;
        maxTvern = toCopy.maxTvern;
        pNini = toCopy.pNini;
        aMXLFNO = toCopy.aMXLFNO;
        dse = toCopy.dse;
        pFLLAnth = toCopy.pFLLAnth;
        dcd = toCopy.dcd;
        dgf = toCopy.dgf;
        degfm = toCopy.degfm;
        ignoreGrainMaturation = toCopy.ignoreGrainMaturation;
        pHEADANTH = toCopy.pHEADANTH;
        sLDL = toCopy.sLDL;
        sowingDensity = toCopy.sowingDensity;
        targetFertileShoot = toCopy.targetFertileShoot;
        slopeTSFLN = toCopy.slopeTSFLN;
        intTSFLN = toCopy.intTSFLN;
        der = toCopy.der;

    }
}