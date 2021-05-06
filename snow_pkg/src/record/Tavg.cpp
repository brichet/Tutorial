// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Tavg: public DiscreteTimeDyn {
public:
    Tavg(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        //  Variables gérées par ce composant
        tavg.init(this,"tavg", events);
        //  Variables gérées par un autre composant
        tmin.init(this,"tmin", events);
        tmax.init(this,"tmax", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Tavg() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        tavg = (tmin() + tmax()) / 2;
    }
private:
    //Variables d'etat
    /**
    * @brief mean temperature (degC)
    */
    Var tavg

    //Entrées
    /**
        * @brief current minimum air temperature (degC)
        */
    Var tmin/**
        * @brief current maximum air temperature (degC)
        */
    Var tmax

    //Paramètres du modele
};
}
}
DECLARE_DYNAMICS(record::Snow::Tavg); // balise specifique VLE