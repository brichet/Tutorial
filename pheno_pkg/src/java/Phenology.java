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

    public double getsLDL()
    {
        return _Updatephase.getsLDL();
    }
    public void setsLDL(double sLDL)
    {
        _Updatephase.setsLDL(sLDL);
    } 

    public double getp()
    {
        return _Updatephase.getp();
    }
    public void setp(double p)
    {
        _Updatephase.setp(p);
        _Phylsowingdatecorrection.setp(p);
        _Phyllochron.setp(p);
    } 

    public String getchoosePhyllUse()
    {
        return _Updatephase.getchoosePhyllUse();
    }
    public void setchoosePhyllUse(String choosePhyllUse)
    {
        _Updatephase.setchoosePhyllUse(choosePhyllUse);
        _Phyllochron.setchoosePhyllUse(choosePhyllUse);
    } 

    public double getpHEADANTH()
    {
        return _Updatephase.getpHEADANTH();
    }
    public void setpHEADANTH(double pHEADANTH)
    {
        _Updatephase.setpHEADANTH(pHEADANTH);
    } 

    public boolean getignoreGrainMaturation()
    {
        return _Updatephase.getignoreGrainMaturation();
    }
    public void setignoreGrainMaturation(boolean ignoreGrainMaturation)
    {
        _Updatephase.setignoreGrainMaturation(ignoreGrainMaturation);
    } 

    public double getmaxDL()
    {
        return _Updatephase.getmaxDL();
    }
    public void setmaxDL(double maxDL)
    {
        _Updatephase.setmaxDL(maxDL);
        _Vernalizationprogress.setmaxDL(maxDL);
    } 

    public double getdegfm()
    {
        return _Updatephase.getdegfm();
    }
    public void setdegfm(double degfm)
    {
        _Updatephase.setdegfm(degfm);
    } 

    public double getdgf()
    {
        return _Updatephase.getdgf();
    }
    public void setdgf(double dgf)
    {
        _Updatephase.setdgf(dgf);
    } 

    public double getdcd()
    {
        return _Updatephase.getdcd();
    }
    public void setdcd(double dcd)
    {
        _Updatephase.setdcd(dcd);
    } 

    public double getpFLLAnth()
    {
        return _Updatephase.getpFLLAnth();
    }
    public void setpFLLAnth(double pFLLAnth)
    {
        _Updatephase.setpFLLAnth(pFLLAnth);
    } 

    public int getisVernalizable()
    {
        return _Updatephase.getisVernalizable();
    }
    public void setisVernalizable(int isVernalizable)
    {
        _Updatephase.setisVernalizable(isVernalizable);
        _Vernalizationprogress.setisVernalizable(isVernalizable);
    } 

    public double getder()
    {
        return _Registerzadok.getder();
    }
    public void setder(double der)
    {
        _Registerzadok.setder(der);
    } 

    public double getintTSFLN()
    {
        return _Registerzadok.getintTSFLN();
    }
    public void setintTSFLN(double intTSFLN)
    {
        _Registerzadok.setintTSFLN(intTSFLN);
    } 

    public double getslopeTSFLN()
    {
        return _Registerzadok.getslopeTSFLN();
    }
    public void setslopeTSFLN(double slopeTSFLN)
    {
        _Registerzadok.setslopeTSFLN(slopeTSFLN);
    } 

    public double getdse()
    {
        return _Updatephase.getdse();
    }
    public void setdse(double dse)
    {
        _Updatephase.setdse(dse);
    } 

    public double gettargetFertileShoot()
    {
        return _Shootnumber.gettargetFertileShoot();
    }
    public void settargetFertileShoot(double targetFertileShoot)
    {
        _Shootnumber.settargetFertileShoot(targetFertileShoot);
    } 

    public double getsowingDensity()
    {
        return _Shootnumber.getsowingDensity();
    }
    public void setsowingDensity(double sowingDensity)
    {
        _Shootnumber.setsowingDensity(sowingDensity);
    } 

    public int getsDsa_nh()
    {
        return _Phylsowingdatecorrection.getsDsa_nh();
    }
    public void setsDsa_nh(int sDsa_nh)
    {
        _Phylsowingdatecorrection.setsDsa_nh(sDsa_nh);
    } 

    public int getsDws()
    {
        return _Phylsowingdatecorrection.getsDws();
    }
    public void setsDws(int sDws)
    {
        _Phylsowingdatecorrection.setsDws(sDws);
    } 

    public int getsowingDay()
    {
        return _Phylsowingdatecorrection.getsowingDay();
    }
    public void setsowingDay(int sowingDay)
    {
        _Phylsowingdatecorrection.setsowingDay(sowingDay);
    } 

    public double getphylPTQ1()
    {
        return _Phyllochron.getphylPTQ1();
    }
    public void setphylPTQ1(double phylPTQ1)
    {
        _Phyllochron.setphylPTQ1(phylPTQ1);
    } 

    public double getrp()
    {
        return _Phylsowingdatecorrection.getrp();
    }
    public void setrp(double rp)
    {
        _Phylsowingdatecorrection.setrp(rp);
    } 

    public double getaPTQ()
    {
        return _Phyllochron.getaPTQ();
    }
    public void setaPTQ(double aPTQ)
    {
        _Phyllochron.setaPTQ(aPTQ);
    } 

    public double getptq()
    {
        return _Phyllochron.getptq();
    }
    public void setptq(double ptq)
    {
        _Phyllochron.setptq(ptq);
    } 

    public double getpincr()
    {
        return _Phyllochron.getpincr();
    }
    public void setpincr(double pincr)
    {
        _Phyllochron.setpincr(pincr);
    } 

    public double getldecr()
    {
        return _Phyllochron.getldecr();
    }
    public void setldecr(double ldecr)
    {
        _Phyllochron.setldecr(ldecr);
    } 

    public double getpdecr()
    {
        return _Phyllochron.getpdecr();
    }
    public void setpdecr(double pdecr)
    {
        _Phyllochron.setpdecr(pdecr);
    } 

    public double getlincr()
    {
        return _Phyllochron.getlincr();
    }
    public void setlincr(double lincr)
    {
        _Phyllochron.setlincr(lincr);
    } 

    public double getkl()
    {
        return _Phyllochron.getkl();
    }
    public void setkl(double kl)
    {
        _Phyllochron.setkl(kl);
    } 

    public double getlatitude()
    {
        return _Phylsowingdatecorrection.getlatitude();
    }
    public void setlatitude(double latitude)
    {
        _Phylsowingdatecorrection.setlatitude(latitude);
    } 

    public int getsDsa_sh()
    {
        return _Phylsowingdatecorrection.getsDsa_sh();
    }
    public void setsDsa_sh(int sDsa_sh)
    {
        _Phylsowingdatecorrection.setsDsa_sh(sDsa_sh);
    } 

    public double getpNini()
    {
        return _Vernalizationprogress.getpNini();
    }
    public void setpNini(double pNini)
    {
        _Vernalizationprogress.setpNini(pNini);
    } 

    public double getaMXLFNO()
    {
        return _Vernalizationprogress.getaMXLFNO();
    }
    public void setaMXLFNO(double aMXLFNO)
    {
        _Vernalizationprogress.setaMXLFNO(aMXLFNO);
    } 

    public double getmaxTvern()
    {
        return _Vernalizationprogress.getmaxTvern();
    }
    public void setmaxTvern(double maxTvern)
    {
        _Vernalizationprogress.setmaxTvern(maxTvern);
    } 

    public double getminDL()
    {
        return _Vernalizationprogress.getminDL();
    }
    public void setminDL(double minDL)
    {
        _Vernalizationprogress.setminDL(minDL);
    } 

    public double getvAI()
    {
        return _Vernalizationprogress.getvAI();
    }
    public void setvAI(double vAI)
    {
        _Vernalizationprogress.setvAI(vAI);
    } 

    public double getintTvern()
    {
        return _Vernalizationprogress.getintTvern();
    }
    public void setintTvern(double intTvern)
    {
        _Vernalizationprogress.setintTvern(intTvern);
    } 

    public double getminTvern()
    {
        return _Vernalizationprogress.getminTvern();
    }
    public void setminTvern(double minTvern)
    {
        _Vernalizationprogress.setminTvern(minTvern);
    } 

    public double getvBEE()
    {
        return _Vernalizationprogress.getvBEE();
    }
    public void setvBEE(double vBEE)
    {
        _Vernalizationprogress.setvBEE(vBEE);
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
    private double sLDL;
    private double p;
    private String choosePhyllUse;
    private double pHEADANTH;
    private boolean ignoreGrainMaturation;
    private double maxDL;
    private double degfm;
    private double dgf;
    private double dcd;
    private double pFLLAnth;
    private int isVernalizable;
    private double der;
    private double intTSFLN;
    private double slopeTSFLN;
    private double dse;
    private double targetFertileShoot;
    private double sowingDensity;
    private int sDsa_nh;
    private int sDws;
    private int sowingDay;
    private double phylPTQ1;
    private double rp;
    private double aPTQ;
    private double ptq;
    private double pincr;
    private double ldecr;
    private double pdecr;
    private double lincr;
    private double kl;
    private double latitude;
    private int sDsa_sh;
    private double pNini;
    private double aMXLFNO;
    private double maxTvern;
    private double minDL;
    private double vAI;
    private double intTvern;
    private double minTvern;
    private double vBEE;
    public Phenology(Phenology toCopy) // copy constructor 
    {
        this.sLDL = toCopy.getsLDL();
        this.p = toCopy.getp();
        this.choosePhyllUse = toCopy.getchoosePhyllUse();
        this.pHEADANTH = toCopy.getpHEADANTH();
        this.ignoreGrainMaturation = toCopy.getignoreGrainMaturation();
        this.maxDL = toCopy.getmaxDL();
        this.degfm = toCopy.getdegfm();
        this.dgf = toCopy.getdgf();
        this.dcd = toCopy.getdcd();
        this.pFLLAnth = toCopy.getpFLLAnth();
        this.isVernalizable = toCopy.getisVernalizable();
        this.der = toCopy.getder();
        this.intTSFLN = toCopy.getintTSFLN();
        this.slopeTSFLN = toCopy.getslopeTSFLN();
        this.dse = toCopy.getdse();
        this.targetFertileShoot = toCopy.gettargetFertileShoot();
        this.sowingDensity = toCopy.getsowingDensity();
        this.sDsa_nh = toCopy.getsDsa_nh();
        this.sDws = toCopy.getsDws();
        this.sowingDay = toCopy.getsowingDay();
        this.phylPTQ1 = toCopy.getphylPTQ1();
        this.rp = toCopy.getrp();
        this.aPTQ = toCopy.getaPTQ();
        this.ptq = toCopy.getptq();
        this.pincr = toCopy.getpincr();
        this.ldecr = toCopy.getldecr();
        this.pdecr = toCopy.getpdecr();
        this.lincr = toCopy.getlincr();
        this.kl = toCopy.getkl();
        this.latitude = toCopy.getlatitude();
        this.sDsa_sh = toCopy.getsDsa_sh();
        this.pNini = toCopy.getpNini();
        this.aMXLFNO = toCopy.getaMXLFNO();
        this.maxTvern = toCopy.getmaxTvern();
        this.minDL = toCopy.getminDL();
        this.vAI = toCopy.getvAI();
        this.intTvern = toCopy.getintTvern();
        this.minTvern = toCopy.getminTvern();
        this.vBEE = toCopy.getvBEE();

    }
}