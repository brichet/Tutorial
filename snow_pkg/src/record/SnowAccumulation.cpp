// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowaccumulation: public DiscreteTimeDyn {
public:
    Snowaccumulation(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        tsmax = (events.exist("tsmax")) ? vv::toDouble(events.get("tsmax")) : 0.0;
        trmax = (events.exist("trmax")) ? vv::toDouble(events.get("trmax")) : 0.0;
        //  Variables gérées par ce composant
        Snowaccu.init(this,"Snowaccu", events);
        //  Variables gérées par un autre composant
        tmax.init(this,"tmax", events);
        precip.init(this,"precip", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowaccumulation() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        double fs = 0.0d;
        if (tmax() < tsmax)
        {
            fs = 1.0d;
        }
        if (tmax() >= tsmax && tmax() <= trmax)
        {
            fs = (trmax - tmax()) / (trmax - tsmax);
        }
        Snowaccu = fs * precip() * 1;
    }
private:
    //Variables d'etat
    /**
    * @brief snowfall accumulation (mmW/d)
    */
    Var Snowaccu

    //Entrées
    /**
        * @brief current maximum air temperature (degC)
        */
    Var tmax/**
        * @brief recalculated precipitation (mmW)
        */
    Var precip

    //Paramètres du modele
    /**
    * @brief maximum daily air temperature (tmax) below which all precipitation is assumed to be snow (degC)
    */
    double tsmax;
    /**
    * @brief tmax above which all precipitation is assumed to be rain (degC)
    */
    double trmax;
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowaccumulation); // balise specifique VLE