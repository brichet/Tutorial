// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Refreezing: public DiscreteTimeDyn {
public:
    Refreezing(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        Tmf = (events.exist("Tmf")) ? vv::toDouble(events.get("Tmf")) : 0.0;
        SWrf = (events.exist("SWrf")) ? vv::toDouble(events.get("SWrf")) : 0.0;
        //  Variables gérées par ce composant
        Mrf.init(this,"Mrf", events);
        //  Variables gérées par un autre composant
        tavg.init(this,"tavg", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Refreezing() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        Mrf = 0.0d;
        if (tavg() < Tmf)
        {
            Mrf = SWrf * (Tmf - tavg());
        }
    }
private:
    //Variables d'etat
    /**
    * @brief liquid water in the snow cover in the process of refreezing (mmW/d)
    */
    Var Mrf

    //Entrées
    /**
        * @brief average temperature (degC)
        */
    Var tavg

    //Paramètres du modele
    /**
    * @brief threshold temperature for snow melting  (degC)
    */
    double Tmf;
    /**
    * @brief degree-day temperature index for refreezing (mmW/degC/d)
    */
    double SWrf;
};
}
}
DECLARE_DYNAMICS(record::Snow::Refreezing); // balise specifique VLE