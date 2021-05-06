// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Preciprec: public DiscreteTimeDyn {
public:
    Preciprec(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        rho = (events.exist("rho")) ? vv::toDouble(events.get("rho")) : 100;
        //  Variables gérées par ce composant
        preciprec.init(this,"preciprec", events);
        //  Variables gérées par un autre composant
        Sdry.init(this,"Sdry", events);
        Swet.init(this,"Swet", events);
        Sdepth.init(this,"Sdepth", events);
        Mrf.init(this,"Mrf", events);
        Snowaccu.init(this,"Snowaccu", events);
        precip.init(this,"precip", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Preciprec() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        preciprec = precip();
        if (Sdry() + Swet() < Sdry(-1) + Swet(-1))
        {
            preciprec = preciprec() + ((Sdepth(-1) - Sdepth()) * rho) - Mrf();
        }
        preciprec = preciprec() - Snowaccu();
    }
private:
    //Variables d'etat
    /**
    * @brief precipitation recalculation (mmW)
    */
    Var preciprec

    //Entrées
    /**
        * @brief water in solid state in the snow cover in previous day (mmW)
        */
    Var Sdry/**
        * @brief water in liquid state in the snow cover (mmW)
        */
    Var Swet/**
        * @brief snow cover depth Calculation in previous day (m)
        */
    Var Sdepth/**
        * @brief liquid water in the snow cover in the process of refreezing (mmW/d)
        */
    Var Mrf/**
        * @brief snowfall accumulation (mmW/d)
        */
    Var Snowaccu/**
        * @brief recalculated precipitation (mmW)
        */
    Var precip

    //Paramètres du modele
    /**
    * @brief The density of the new snow fixed by the user (kg/m**3)
    */
    double rho;
};
}
}
DECLARE_DYNAMICS(record::Snow::Preciprec); // balise specifique VLE