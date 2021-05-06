// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowwet: public DiscreteTimeDyn {
public:
    Snowwet(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        //  Variables gérées par ce composant
        Swet.init(this,"Swet", events);
        //  Variables gérées par un autre composant
        Sdry.init(this,"Sdry", events);
        Snowaccu.init(this,"Snowaccu", events);
        Mrf.init(this,"Mrf", events);
        M.init(this,"M", events);
        precip.init(this,"precip", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowwet() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        double frac_sdry;
        double tmp_swet;
        Swet = 0.0d;
        if (Mrf() <= Swet(-1))
        {
            tmp_swet = Swet(-1) + precip() - Snowaccu() + M() - Mrf();
            frac_sdry = 0.1d * Sdry();
            if (tmp_swet < frac_sdry)
            {
                Swet = tmp_swet;
            }
            else
            {
                Swet = frac_sdry;
            }
        }
    }
private:
    //Variables d'etat
    /**
    * @brief water in liquid state in the snow cover (mmW)
    */
    Var Swet

    //Entrées
    /**
        * @brief water in solid state in the snow cover (mmW)
        */
    Var Sdry/**
        * @brief  snowfall accumulation (mmW/d)
        */
    Var Snowaccu/**
        * @brief liquid water in the snow cover in the process of refreezing (mmW/d)
        */
    Var Mrf/**
        * @brief snow in the process of melting (mmW/d)
        */
    Var M/**
        * @brief current precipitation (mmW)
        */
    Var precip

    //Paramètres du modele
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowwet); // balise specifique VLE