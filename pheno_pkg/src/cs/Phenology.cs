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
    
    public double p
    {
        get
        {
            return _Updatephase.p;
        }
        set
        {
            _Updatephase.p = value;
            _Phylsowingdatecorrection.p = value;
            _Phyllochron.p = value;
        } 
    }
    
    public string choosePhyllUse
    {
        get
        {
            return _Updatephase.choosePhyllUse;
        }
        set
        {
            _Updatephase.choosePhyllUse = value;
            _Phyllochron.choosePhyllUse = value;
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
    
    public double maxDL
    {
        get
        {
            return _Updatephase.maxDL;
        }
        set
        {
            _Updatephase.maxDL = value;
            _Vernalizationprogress.maxDL = value;
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
    
    public int isVernalizable
    {
        get
        {
            return _Updatephase.isVernalizable;
        }
        set
        {
            _Updatephase.isVernalizable = value;
            _Vernalizationprogress.isVernalizable = value;
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
    
    public void  Calculate_phenology(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        _Cumulttfrom.Calculate_cumulttfrom(s, r, a);
        _Ismomentregistredzc_39.Calculate_ismomentregistredzc_39(s, r, a);
        _Vernalizationprogress.Calculate_vernalizationprogress(s, r, a);
        _Phylsowingdatecorrection.Calculate_phylsowingdatecorrection(s, r, a);
        _Phyllochron.Calculate_phyllochron(s, r, a);
        _Updatephase.Calculate_updatephase(s, r, a);
        _Leafnumber.Calculate_leafnumber(s, r, a);
        _Updateleafflag.Calculate_updateleafflag(s, r, a);
        _Registerzadok.Calculate_registerzadok(s, r, a);
        _Updatecalendar.Calculate_updatecalendar(s, r, a);
        _Shootnumber.Calculate_shootnumber(s, r, a);
    }
    
    public Phenology(Phenology toCopy): this() // copy constructor 
    {

        sLDL = toCopy.sLDL;
        p = toCopy.p;
        choosePhyllUse = toCopy.choosePhyllUse;
        pHEADANTH = toCopy.pHEADANTH;
        ignoreGrainMaturation = toCopy.ignoreGrainMaturation;
        maxDL = toCopy.maxDL;
        degfm = toCopy.degfm;
        dgf = toCopy.dgf;
        dcd = toCopy.dcd;
        pFLLAnth = toCopy.pFLLAnth;
        isVernalizable = toCopy.isVernalizable;
        der = toCopy.der;
        intTSFLN = toCopy.intTSFLN;
        slopeTSFLN = toCopy.slopeTSFLN;
        dse = toCopy.dse;
        targetFertileShoot = toCopy.targetFertileShoot;
        sowingDensity = toCopy.sowingDensity;
        sDsa_nh = toCopy.sDsa_nh;
        sDws = toCopy.sDws;
        sowingDay = toCopy.sowingDay;
        phylPTQ1 = toCopy.phylPTQ1;
        rp = toCopy.rp;
        aPTQ = toCopy.aPTQ;
        ptq = toCopy.ptq;
        pincr = toCopy.pincr;
        ldecr = toCopy.ldecr;
        pdecr = toCopy.pdecr;
        lincr = toCopy.lincr;
        kl = toCopy.kl;
        latitude = toCopy.latitude;
        sDsa_sh = toCopy.sDsa_sh;
        pNini = toCopy.pNini;
        aMXLFNO = toCopy.aMXLFNO;
        maxTvern = toCopy.maxTvern;
        minDL = toCopy.minDL;
        vAI = toCopy.vAI;
        intTvern = toCopy.intTvern;
        minTvern = toCopy.minTvern;
        vBEE = toCopy.vBEE;

    }
}