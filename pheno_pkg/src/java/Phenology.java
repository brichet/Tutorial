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

    public double getlincr()
    {
        return _Phyllochron.getlincr();
    }
    public void setlincr(double lincr)
    {
        _Phyllochron.setlincr(lincr);
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

    public double getpincr()
    {
        return _Phyllochron.getpincr();
    }
    public void setpincr(double pincr)
    {
        _Phyllochron.setpincr(pincr);
    } 

    public double getptq()
    {
        return _Phyllochron.getptq();
    }
    public void setptq(double ptq)
    {
        _Phyllochron.setptq(ptq);
    } 

    public double getkl()
    {
        return _Phyllochron.getkl();
    }
    public void setkl(double kl)
    {
        _Phyllochron.setkl(kl);
    } 

    public double getaPTQ()
    {
        return _Phyllochron.getaPTQ();
    }
    public void setaPTQ(double aPTQ)
    {
        _Phyllochron.setaPTQ(aPTQ);
    } 

    public double getphylPTQ1()
    {
        return _Phyllochron.getphylPTQ1();
    }
    public void setphylPTQ1(double phylPTQ1)
    {
        _Phyllochron.setphylPTQ1(phylPTQ1);
    } 

    public double getp()
    {
        return _Phyllochron.getp();
    }
    public void setp(double p)
    {
        _Phyllochron.setp(p);
        _Phylsowingdatecorrection.setp(p);
        _Updatephase.setp(p);
    } 

    public String getchoosePhyllUse()
    {
        return _Phyllochron.getchoosePhyllUse();
    }
    public void setchoosePhyllUse(String choosePhyllUse)
    {
        _Phyllochron.setchoosePhyllUse(choosePhyllUse);
        _Updatephase.setchoosePhyllUse(choosePhyllUse);
    } 

    public int getsowingDay()
    {
        return _Phylsowingdatecorrection.getsowingDay();
    }
    public void setsowingDay(int sowingDay)
    {
        _Phylsowingdatecorrection.setsowingDay(sowingDay);
    } 

    public int getsDsa_sh()
    {
        return _Phylsowingdatecorrection.getsDsa_sh();
    }
    public void setsDsa_sh(int sDsa_sh)
    {
        _Phylsowingdatecorrection.setsDsa_sh(sDsa_sh);
    } 

    public int getsDws()
    {
        return _Phylsowingdatecorrection.getsDws();
    }
    public void setsDws(int sDws)
    {
        _Phylsowingdatecorrection.setsDws(sDws);
    } 

    public int getsDsa_nh()
    {
        return _Phylsowingdatecorrection.getsDsa_nh();
    }
    public void setsDsa_nh(int sDsa_nh)
    {
        _Phylsowingdatecorrection.setsDsa_nh(sDsa_nh);
    } 

    public double getrp()
    {
        return _Phylsowingdatecorrection.getrp();
    }
    public void setrp(double rp)
    {
        _Phylsowingdatecorrection.setrp(rp);
    } 

    public double getlatitude()
    {
        return _Phylsowingdatecorrection.getlatitude();
    }
    public void setlatitude(double latitude)
    {
        _Phylsowingdatecorrection.setlatitude(latitude);
    } 

    public int getisVernalizable()
    {
        return _Vernalizationprogress.getisVernalizable();
    }
    public void setisVernalizable(int isVernalizable)
    {
        _Vernalizationprogress.setisVernalizable(isVernalizable);
        _Updatephase.setisVernalizable(isVernalizable);
    } 

    public double getminTvern()
    {
        return _Vernalizationprogress.getminTvern();
    }
    public void setminTvern(double minTvern)
    {
        _Vernalizationprogress.setminTvern(minTvern);
    } 

    public double getintTvern()
    {
        return _Vernalizationprogress.getintTvern();
    }
    public void setintTvern(double intTvern)
    {
        _Vernalizationprogress.setintTvern(intTvern);
    } 

    public double getvAI()
    {
        return _Vernalizationprogress.getvAI();
    }
    public void setvAI(double vAI)
    {
        _Vernalizationprogress.setvAI(vAI);
    } 

    public double getvBEE()
    {
        return _Vernalizationprogress.getvBEE();
    }
    public void setvBEE(double vBEE)
    {
        _Vernalizationprogress.setvBEE(vBEE);
    } 

    public double getminDL()
    {
        return _Vernalizationprogress.getminDL();
    }
    public void setminDL(double minDL)
    {
        _Vernalizationprogress.setminDL(minDL);
    } 

    public double getmaxDL()
    {
        return _Vernalizationprogress.getmaxDL();
    }
    public void setmaxDL(double maxDL)
    {
        _Vernalizationprogress.setmaxDL(maxDL);
        _Updatephase.setmaxDL(maxDL);
    } 

    public double getmaxTvern()
    {
        return _Vernalizationprogress.getmaxTvern();
    }
    public void setmaxTvern(double maxTvern)
    {
        _Vernalizationprogress.setmaxTvern(maxTvern);
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

    public double getdse()
    {
        return _Updatephase.getdse();
    }
    public void setdse(double dse)
    {
        _Updatephase.setdse(dse);
    } 

    public double getpFLLAnth()
    {
        return _Updatephase.getpFLLAnth();
    }
    public void setpFLLAnth(double pFLLAnth)
    {
        _Updatephase.setpFLLAnth(pFLLAnth);
    } 

    public double getdcd()
    {
        return _Updatephase.getdcd();
    }
    public void setdcd(double dcd)
    {
        _Updatephase.setdcd(dcd);
    } 

    public double getdgf()
    {
        return _Updatephase.getdgf();
    }
    public void setdgf(double dgf)
    {
        _Updatephase.setdgf(dgf);
    } 

    public double getdegfm()
    {
        return _Updatephase.getdegfm();
    }
    public void setdegfm(double degfm)
    {
        _Updatephase.setdegfm(degfm);
    } 

    public boolean getignoreGrainMaturation()
    {
        return _Updatephase.getignoreGrainMaturation();
    }
    public void setignoreGrainMaturation(boolean ignoreGrainMaturation)
    {
        _Updatephase.setignoreGrainMaturation(ignoreGrainMaturation);
    } 

    public double getpHEADANTH()
    {
        return _Updatephase.getpHEADANTH();
    }
    public void setpHEADANTH(double pHEADANTH)
    {
        _Updatephase.setpHEADANTH(pHEADANTH);
    } 

    public double getsLDL()
    {
        return _Updatephase.getsLDL();
    }
    public void setsLDL(double sLDL)
    {
        _Updatephase.setsLDL(sLDL);
    } 

    public double getsowingDensity()
    {
        return _Shootnumber.getsowingDensity();
    }
    public void setsowingDensity(double sowingDensity)
    {
        _Shootnumber.setsowingDensity(sowingDensity);
    } 

    public double gettargetFertileShoot()
    {
        return _Shootnumber.gettargetFertileShoot();
    }
    public void settargetFertileShoot(double targetFertileShoot)
    {
        _Shootnumber.settargetFertileShoot(targetFertileShoot);
    } 

    public double getslopeTSFLN()
    {
        return _Registerzadok.getslopeTSFLN();
    }
    public void setslopeTSFLN(double slopeTSFLN)
    {
        _Registerzadok.setslopeTSFLN(slopeTSFLN);
    } 

    public double getintTSFLN()
    {
        return _Registerzadok.getintTSFLN();
    }
    public void setintTSFLN(double intTSFLN)
    {
        _Registerzadok.setintTSFLN(intTSFLN);
    } 

    public double getder()
    {
        return _Registerzadok.getder();
    }
    public void setder(double der)
    {
        _Registerzadok.setder(der);
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
    private double lincr;
    private double ldecr;
    private double pdecr;
    private double pincr;
    private double ptq;
    private double kl;
    private double aPTQ;
    private double phylPTQ1;
    private double p;
    private String choosePhyllUse;
    private int sowingDay;
    private int sDsa_sh;
    private int sDws;
    private int sDsa_nh;
    private double rp;
    private double latitude;
    private int isVernalizable;
    private double minTvern;
    private double intTvern;
    private double vAI;
    private double vBEE;
    private double minDL;
    private double maxDL;
    private double maxTvern;
    private double pNini;
    private double aMXLFNO;
    private double dse;
    private double pFLLAnth;
    private double dcd;
    private double dgf;
    private double degfm;
    private boolean ignoreGrainMaturation;
    private double pHEADANTH;
    private double sLDL;
    private double sowingDensity;
    private double targetFertileShoot;
    private double slopeTSFLN;
    private double intTSFLN;
    private double der;
    public Phenology(Phenology toCopy) // copy constructor 
    {
        this.lincr = toCopy.getlincr();
        this.ldecr = toCopy.getldecr();
        this.pdecr = toCopy.getpdecr();
        this.pincr = toCopy.getpincr();
        this.ptq = toCopy.getptq();
        this.kl = toCopy.getkl();
        this.aPTQ = toCopy.getaPTQ();
        this.phylPTQ1 = toCopy.getphylPTQ1();
        this.p = toCopy.getp();
        this.choosePhyllUse = toCopy.getchoosePhyllUse();
        this.sowingDay = toCopy.getsowingDay();
        this.sDsa_sh = toCopy.getsDsa_sh();
        this.sDws = toCopy.getsDws();
        this.sDsa_nh = toCopy.getsDsa_nh();
        this.rp = toCopy.getrp();
        this.latitude = toCopy.getlatitude();
        this.isVernalizable = toCopy.getisVernalizable();
        this.minTvern = toCopy.getminTvern();
        this.intTvern = toCopy.getintTvern();
        this.vAI = toCopy.getvAI();
        this.vBEE = toCopy.getvBEE();
        this.minDL = toCopy.getminDL();
        this.maxDL = toCopy.getmaxDL();
        this.maxTvern = toCopy.getmaxTvern();
        this.pNini = toCopy.getpNini();
        this.aMXLFNO = toCopy.getaMXLFNO();
        this.dse = toCopy.getdse();
        this.pFLLAnth = toCopy.getpFLLAnth();
        this.dcd = toCopy.getdcd();
        this.dgf = toCopy.getdgf();
        this.degfm = toCopy.getdegfm();
        this.ignoreGrainMaturation = toCopy.getignoreGrainMaturation();
        this.pHEADANTH = toCopy.getpHEADANTH();
        this.sLDL = toCopy.getsLDL();
        this.sowingDensity = toCopy.getsowingDensity();
        this.targetFertileShoot = toCopy.gettargetFertileShoot();
        this.slopeTSFLN = toCopy.getslopeTSFLN();
        this.intTSFLN = toCopy.getintTSFLN();
        this.der = toCopy.getder();

    }
}