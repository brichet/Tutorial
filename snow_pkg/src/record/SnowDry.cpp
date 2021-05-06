// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Snowdry: public DiscreteTimeDyn {
public:
    Snowdry(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        //  Variables gérées par ce composant
        Sdry.init(this,"Sdry", events);
        //  Variables gérées par un autre composant
        Snowaccu.init(this,"Snowaccu", events);
        Mrf.init(this,"Mrf", events);
        M.init(this,"M", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Snowdry() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        double tmp_sdry;
        Sdry = 0.0d;
        if (M() * 1 <= Sdry(-1))
        {
            tmp_sdry = Snowaccu() + Mrf() - M() + Sdry(-1);
            if (tmp_sdry < 0.0d)
            {
                Sdry = 0.001d;
            }
            else
            {
                Sdry = tmp_sdry;
            }
        }
    }
private:
    //Variables d'etat
    /**
    * @brief water in solid state in the snow cover (mmW)
    */
    Var Sdry

    //Entrées
    /**
        * @brief snowfall accumulation (mmW/d)
        */
    Var Snowaccu/**
        * @brief liquid water in the snow cover in the process of refreezing (mmW/d)
        */
    Var Mrf/**
        * @brief snow in the process of melting (mmW/d)
        */
    Var M

    //Paramètres du modele
};
}
}
DECLARE_DYNAMICS(record::Snow::Snowdry); // balise specifique VLE