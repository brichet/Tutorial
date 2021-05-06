// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowmelt: public DiscreteTimeDyn {
public:
    Snowmelt(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        //  Variables gérées par ce composant
        Snowmelt.init(this,"Snowmelt", events);
        //  Variables gérées par un autre composant
        ps.init(this,"ps", events);
        M.init(this,"M", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowmelt() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        Snowmelt = 0.0d;
        if (ps() > 1e-8d)
        {
            Snowmelt = M() / ps();
        }
    }
private:
    //Variables d'etat
    /**
    * @brief Snow melt (m)
    */
    Var Snowmelt

    //Entrées
    /**
        * @brief density of snow cover (kg/m**3)
        */
    Var ps/**
        * @brief snow in the process of melting (mmW/d)
        */
    Var M

    //Paramètres du modele
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowmelt); // balise specifique VLE