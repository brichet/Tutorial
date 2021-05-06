// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowdensity: public DiscreteTimeDyn {
public:
    Snowdensity(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        //  Variables gérées par ce composant
        ps.init(this,"ps", events);
        //  Variables gérées par un autre composant
        Sdepth.init(this,"Sdepth", events);
        Sdry.init(this,"Sdry", events);
        Swet.init(this,"Swet", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowdensity() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        ps = 0.0d;
        if (abs(Sdepth(-1)) > 0.0d)
        {
            if (abs(Sdry(-1) + Swet(-1)) > 0.0d)
            {
                ps = (Sdry(-1) + Swet(-1)) / Sdepth(-1);
            }
            else
            {
                ps = ps(-1);
            }
        }
    }
private:
    //Variables d'etat
    /**
    * @brief density of snow cover (kg/m**3)
    */
    Var ps

    //Entrées
    /**
        * @brief snow cover depth Calculation in previous day (m)
        */
    Var Sdepth/**
        * @brief water in solid state in the snow cover in previous day (mmW)
        */
    Var Sdry/**
        * @brief water in liquid state in the snow cover (mmW)
        */
    Var Swet

    //Paramètres du modele
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowdensity); // balise specifique VLE