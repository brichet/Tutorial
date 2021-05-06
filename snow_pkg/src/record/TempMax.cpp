// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Tempmax: public DiscreteTimeDyn {
public:
    Tempmax(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        prof = (events.exist("prof")) ? vv::toDouble(events.get("prof")) : 0.0;
        tminseuil = (events.exist("tminseuil")) ? vv::toDouble(events.get("tminseuil")) : 0.0;
        tmaxseuil = (events.exist("tmaxseuil")) ? vv::toDouble(events.get("tmaxseuil")) : 0.0;
        //  Variables gérées par ce composant
        tmaxrec.init(this,"tmaxrec", events);
        //  Variables gérées par un autre composant
        Sdepth_cm.init(this,"Sdepth_cm", events);
        tmax.init(this,"tmax", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Tempmax() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        tmaxrec = tmax();
        if (Sdepth_cm() > prof)
        {
            if (tmax() < tminseuil)
            {
                tmaxrec = tminseuil;
            }
            else
            {
                if (tmax() > tmaxseuil)
                {
                    tmaxrec = tmaxseuil;
                }
            }
        }
        else
        {
            if (Sdepth_cm() > 0.0d)
            {
                if (tmax() <= 0.0d)
                {
                    tmaxrec = tmaxseuil - ((1 - (Sdepth_cm() / prof)) * -tmax());
                }
                else
                {
                    tmaxrec = 0.0d;
                }
            }
        }
    }
private:
    //Variables d'etat
    /**
    * @brief recalculated maximum temperature (degC)
    */
    Var tmaxrec

    //Entrées
    /**
        * @brief snow depth (cm)
        */
    Var Sdepth_cm/**
        * @brief current maximum air temperature (degC)
        */
    Var tmax

    //Paramètres du modele
    /**
    * @brief snow cover threshold for snow insulation  (cm)
    */
    double prof;
    /**
    * @brief minimum temperature when snow cover is higher than prof (degC)
    */
    double tminseuil;
    /**
    * @brief maximum temperature when snow cover is higher than prof (degC)
    */
    double tmaxseuil;
};
}
}
DECLARE_DYNAMICS(record::Snow::Tempmax); // balise specifique VLE