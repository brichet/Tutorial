// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowdepthtrans: public DiscreteTimeDyn {
public:
    Snowdepthtrans(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        Pns = (events.exist("Pns")) ? vv::toDouble(events.get("Pns")) : 100.0;
        //  Variables gérées par ce composant
        Sdepth_cm.init(this,"Sdepth_cm", events);
        //  Variables gérées par un autre composant
        Sdepth.init(this,"Sdepth", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowdepthtrans() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        Sdepth_cm = Sdepth() * Pns;
    }
private:
    //Variables d'etat
    /**
    * @brief snow cover depth in cm (cm)
    */
    Var Sdepth_cm

    //Entrées
    /**
        * @brief snow cover depth Calculation (m)
        */
    Var Sdepth

    //Paramètres du modele
    /**
    * @brief density of the new snow (cm/m)
    */
    double Pns;
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowdepthtrans); // balise specifique VLE