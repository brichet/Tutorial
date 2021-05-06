// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Melting: public DiscreteTimeDyn {
public:
    Melting(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        Tmf = (events.exist("Tmf")) ? vv::toDouble(events.get("Tmf")) : 0.5;
        DKmax = (events.exist("DKmax")) ? vv::toDouble(events.get("DKmax")) : 0.0;
        Kmin = (events.exist("Kmin")) ? vv::toDouble(events.get("Kmin")) : 0.0;
        //  Variables gérées par ce composant
        M.init(this,"M", events);
        //  Variables gérées par un autre composant
        jul.init(this,"jul", events);
        tavg.init(this,"tavg", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Melting() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        double K;
        M = 0.0d;
        K = DKmax / 2.0d * -asin((2.0d * M_PI * float(jul()) / 366.0d + (9.0d / 16.0d * M_PI))) + Kmin + (DKmax / 2.0d);
        if (tavg() > Tmf)
        {
            M = K * (tavg() - Tmf);
        }
    }
private:
    //Variables d'etat
    /**
    * @brief snow in the process of melting (mmW/d)
    */
    Var M

    //Entrées
    /**
        * @brief current day of year for the calculation (d)
        */
    Var jul/**
        * @brief average temperature (degC)
        */
    Var tavg

    //Paramètres du modele
    /**
    * @brief threshold temperature for snow melting  (degC)
    */
    double Tmf;
    /**
    * @brief difference between the maximum and the minimum melting rates (mmW/degC/d)
    */
    double DKmax;
    /**
    * @brief minimum melting rate on 21 December (mmW/degC/d)
    */
    double Kmin;
};
}
}
DECLARE_DYNAMICS(record::Snow::Melting); // balise specifique VLE