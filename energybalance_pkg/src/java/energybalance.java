public class Energybalance
{
    
    public Energybalance()
    {
           
    }

    Netradiation _Netradiation = new Netradiation();
    Netradiationequivalentevaporation _Netradiationequivalentevaporation = new Netradiationequivalentevaporation();
    Priestlytaylor _Priestlytaylor = new Priestlytaylor();
    Conductance _Conductance = new Conductance();
    Diffusionlimitedevaporation _Diffusionlimitedevaporation = new Diffusionlimitedevaporation();
    Penman _Penman = new Penman();
    Ptsoil _Ptsoil = new Ptsoil();
    Soilevaporation _Soilevaporation = new Soilevaporation();
    Evapotranspiration _Evapotranspiration = new Evapotranspiration();
    Soilheatflux _Soilheatflux = new Soilheatflux();
    Potentialtranspiration _Potentialtranspiration = new Potentialtranspiration();
    Cropheatflux _Cropheatflux = new Cropheatflux();
    Canopytemperature _Canopytemperature = new Canopytemperature();

    public  getalbedoCoefficient()
    {
        return _NetRadiation.albedoCoefficient;
    }
    public void setalbedoCoefficient(double albedoCoefficient)
    {
        _Netradiation.setalbedoCoefficient(albedoCoefficient);
    } 

    public  getstefanBoltzman()
    {
        return _NetRadiation.stefanBoltzman;
    }
    public void setstefanBoltzman(double stefanBoltzman)
    {
        _Netradiation.setstefanBoltzman(stefanBoltzman);
    } 

    public  getelevation()
    {
        return _NetRadiation.elevation;
    }
    public void setelevation(double elevation)
    {
        _Netradiation.setelevation(elevation);
    } 

    public  getlambdaV()
    {
        return _NetRadiationEquivalentEvaporation.lambdaV;
    }
    public void setlambdaV(double lambdaV)
    {
        _Netradiationequivalentevaporation.setlambdaV(lambdaV);
        _Penman.setlambdaV(lambdaV);
        _Canopytemperature.setlambdaV(lambdaV);
    } 

    public  getpsychrometricConstant()
    {
        return _PriestlyTaylor.psychrometricConstant;
    }
    public void setpsychrometricConstant(double psychrometricConstant)
    {
        _Priestlytaylor.setpsychrometricConstant(psychrometricConstant);
        _Penman.setpsychrometricConstant(psychrometricConstant);
    } 

    public  getAlpha()
    {
        return _PriestlyTaylor.Alpha;
    }
    public void setAlpha(double Alpha)
    {
        _Priestlytaylor.setAlpha(Alpha);
        _Penman.setAlpha(Alpha);
        _Ptsoil.setAlpha(Alpha);
    } 

    public  getvonKarman()
    {
        return _Conductance.vonKarman;
    }
    public void setvonKarman(double vonKarman)
    {
        _Conductance.setvonKarman(vonKarman);
    } 

    public  getheightWeatherMeasurements()
    {
        return _Conductance.heightWeatherMeasurements;
    }
    public void setheightWeatherMeasurements(double heightWeatherMeasurements)
    {
        _Conductance.setheightWeatherMeasurements(heightWeatherMeasurements);
    } 

    public  getzm()
    {
        return _Conductance.zm;
    }
    public void setzm(double zm)
    {
        _Conductance.setzm(zm);
    } 

    public  getd()
    {
        return _Conductance.d;
    }
    public void setd(double d)
    {
        _Conductance.setd(d);
    } 

    public  getzh()
    {
        return _Conductance.zh;
    }
    public void setzh(double zh)
    {
        _Conductance.setzh(zh);
    } 

    public  getsoilDiffusionConstant()
    {
        return _DiffusionLimitedEvaporation.soilDiffusionConstant;
    }
    public void setsoilDiffusionConstant(double soilDiffusionConstant)
    {
        _Diffusionlimitedevaporation.setsoilDiffusionConstant(soilDiffusionConstant);
    } 

    public  getrhoDensityAir()
    {
        return _Penman.rhoDensityAir;
    }
    public void setrhoDensityAir(double rhoDensityAir)
    {
        _Penman.setrhoDensityAir(rhoDensityAir);
        _Canopytemperature.setrhoDensityAir(rhoDensityAir);
    } 

    public  getspecificHeatCapacityAir()
    {
        return _Penman.specificHeatCapacityAir;
    }
    public void setspecificHeatCapacityAir(double specificHeatCapacityAir)
    {
        _Penman.setspecificHeatCapacityAir(specificHeatCapacityAir);
        _Canopytemperature.setspecificHeatCapacityAir(specificHeatCapacityAir);
    } 

    public  gettau()
    {
        return _PtSoil.tau;
    }
    public void settau(double tau)
    {
        _Ptsoil.settau(tau);
        _Soilheatflux.settau(tau);
        _Potentialtranspiration.settau(tau);
    } 

    public  gettauAlpha()
    {
        return _PtSoil.tauAlpha;
    }
    public void settauAlpha(double tauAlpha)
    {
        _Ptsoil.settauAlpha(tauAlpha);
    } 

    public  getisWindVpDefined()
    {
        return _EvapoTranspiration.isWindVpDefined;
    }
    public void setisWindVpDefined(int isWindVpDefined)
    {
        _Evapotranspiration.setisWindVpDefined(isWindVpDefined);
    } 
    public void  Calculate_energybalance(state s, rate r, auxiliary a)
    {
        _Diffusionlimitedevaporation.Calculate_diffusionlimitedevaporation(s, r, a);
        _Conductance.Calculate_conductance(s, r, a);
        _Netradiation.Calculate_netradiation(s, r, a);
        _Netradiationequivalentevaporation.Calculate_netradiationequivalentevaporation(s, r, a);
        _Priestlytaylor.Calculate_priestlytaylor(s, r, a);
        _Penman.Calculate_penman(s, r, a);
        _Evapotranspiration.Calculate_evapotranspiration(s, r, a);
        _Potentialtranspiration.Calculate_potentialtranspiration(s, r, a);
        _Ptsoil.Calculate_ptsoil(s, r, a);
        _Soilevaporation.Calculate_soilevaporation(s, r, a);
        _Soilheatflux.Calculate_soilheatflux(s, r, a);
        _Cropheatflux.Calculate_cropheatflux(s, r, a);
        _Canopytemperature.Calculate_canopytemperature(s, r, a);
    }
    
    public Energybalance(Energybalance toCopy) // copy constructor 
    {
        this.albedoCoefficient = toCopy.albedoCoefficient;
        this.stefanBoltzman = toCopy.stefanBoltzman;
        this.elevation = toCopy.elevation;
        this.lambdaV = toCopy.lambdaV;
        this.psychrometricConstant = toCopy.psychrometricConstant;
        this.Alpha = toCopy.Alpha;
        this.vonKarman = toCopy.vonKarman;
        this.heightWeatherMeasurements = toCopy.heightWeatherMeasurements;
        this.zm = toCopy.zm;
        this.d = toCopy.d;
        this.zh = toCopy.zh;
        this.soilDiffusionConstant = toCopy.soilDiffusionConstant;
        this.rhoDensityAir = toCopy.rhoDensityAir;
        this.specificHeatCapacityAir = toCopy.specificHeatCapacityAir;
        this.tau = toCopy.tau;
        this.tauAlpha = toCopy.tauAlpha;
        this.isWindVpDefined = toCopy.isWindVpDefined;

    }
}