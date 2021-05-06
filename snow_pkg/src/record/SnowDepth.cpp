// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowdepth: public DiscreteTimeDyn {
public:
    Snowdepth(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        E = (events.exist("E")) ? vv::toDouble(events.get("E")) : 0.0;
        rho = (events.exist("rho")) ? vv::toDouble(events.get("rho")) : 100;
        //  Variables gérées par ce composant
        Sdepth.init(this,"Sdepth", events);
        //  Variables gérées par un autre composant
        Snowmelt.init(this,"Snowmelt", events);
        Snowaccu.init(this,"Snowaccu", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowdepth() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        Sdepth = 0.0d;
        if (Snowmelt() <= Sdepth(-1) + (Snowaccu() / rho))
        {
            Sdepth = Snowaccu() / rho + Sdepth(-1) - Snowmelt() - (Sdepth(-1) * E);
        }
    }
private:
    //Variables d'etat
    /**
    * @brief snow cover depth Calculation (m)
    */
    Var Sdepth

    //Entrées
    /**
        * @brief snow melt  (m)
        */
    Var Snowmelt/**
        * @brief snowfall accumulation (mmW/d)
        */
    Var Snowaccu

    //Paramètres du modele
    /**
    * @brief snow compaction parameter (mm/mm/d)
    */
    double E;
    /**
    * @brief The density of the new snow fixed by the user (kg/m**3)
    */
    double rho;
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowdepth); // balise specifique VLE